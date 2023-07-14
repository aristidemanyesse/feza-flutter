import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/provider/DemandeProvider.dart';
import 'package:ipi/provider/OfficineProvider.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/widgets/animations.dart';
import 'package:ipi/widgets/chooseCamera.dart';
import 'package:ipi/widgets/felicitation.dart';
import 'package:ipi/widgets/noPharmacieAvialable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/bottomSheet.dart';
import 'package:ipi/utils/functions.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/loader.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';
import 'package:ipi/widgets/selectDistanceBloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/mapPin.dart';
import 'package:ipi/widgets/mapPopupPin.dart';
import 'package:flutter_map/plugin_api.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SearchPage extends StatefulWidget {
  static const routeName = "/SearchPage";

  SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  late StreamSubscription<String> _sharedPreferencesSubscription;

  late UtilisateurModel user;

  late List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines = [];
  List<OfficineModel> officines = [];
  List<ProduitModel> _produits = [];
  late Map<String, dynamic> routesOfficines = {};
  late Map<OfficineModel, int> ratioTableaux = {};
  late Map<OfficineModel, String> distanceTableaux = {};
  late List<ProduitModel> initialProduits = [];
  late List<String> _selectedOptions = [];

  MapController mapController = MapController();
  final PopupController _popupLayerController = PopupController();
  LatLng myPosition = LatLng(5.260298, -3.9522842);
  List<CustomMyMarker> markers = [];
  List<LatLng> markersLatLng = [];
  Polyline routeCoordinates = Polyline(points: []);
  bool wait = false;
  bool ready = true;
  bool isZone = false;
  bool isOrdonnance = false;
  int distance = 0;
  late File file;
  late String base64 = "";

  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    final startIdWithTarget =
        '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }

      hasTriggeredMove |= mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    _sharedPreferencesSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    getData();

    _sharedPreferencesSubscription =
        sharedPreferencesService.watchString('distance').listen((value) {
      setState(() {
        distance = int.parse(value);
      });
      officinesAvialable();
      locateMe();
    });

    _sharedPreferencesSubscription =
        sharedPreferencesService.watchString('circonscription').listen((value) {
      officinesAvialable();
    });

    _sharedPreferencesSubscription = sharedPreferencesService
        .watchString('produitsSelected')
        .listen((value) async {
      _selectedOptions =
          await sharedPreferencesService.getStringList('produitsSelected');
      setState(() {});
    });
    super.initState();
  }

  Future<void> getData() async {
    await sharedPreferencesService.init();

    String? userId = await sharedPreferencesService.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    user = users[0];

    dynamic lat = await sharedPreferencesService.getString('lat');
    dynamic lon = await sharedPreferencesService.getString('lon');
    myPosition = LatLng(double.parse(lat), double.parse(lon));

    distance = int.parse(await sharedPreferencesService.getString('distance'));
    _produits = await sharedPreferencesService.getProduitList('produits');
    _selectedOptions =
        await sharedPreferencesService.getStringList('produitsSelected');
    setState(() {});
    fitBoundsOnCircle(myPosition, distance * 1000);
    officinesAvialable();
  }

  void makeDemande() async {
    if (officines.length > 0) {
      if (_selectedOptions.length > 0 || isOrdonnance) {
        setState(() {
          ready = false;
        });

        ResponseModel response = await DemandeProvider.createDemande({
          "utilisateur": user.id,
          "commentaire": "",
          "base64": base64,
        });
        if (response.ok) {
          DemandeModel demande = response.data;

          for (var pro in _selectedOptions) {
            ProduitModel? produitTrouve =
                _produits.firstWhere((produit) => produit.name == pro);

            ResponseModel response = await DemandeProvider.createLigneDemande(
                {"produit": produitTrouve.id, "demande": demande.id});
            if (!response.ok) {
              Fluttertoast.showToast(
                msg:
                    response.message ?? "Ouups, Produit Veuillez recommencer !",
                gravity: ToastGravity.BOTTOM,
              );
            }
          }

          for (var officine in officines) {
            ResponseModel response =
                await DemandeProvider.createOfficineDemande(
                    {"officine": officine.id, "demande": demande.id});
            if (!response.ok) {
              Fluttertoast.showToast(
                msg: response.message ??
                    "Ouups, officine Veuillez recommencer !",
                gravity: ToastGravity.BOTTOM,
              );
            }
          }

          setState(() {
            ready = true;
          });
          await sharedPreferencesService.setString('distance', "1");
          await sharedPreferencesService.setStringList('produitsSelected', []);

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return FelicitationScreen();
            },
          );
        } else {
          Fluttertoast.showToast(
            backgroundColor: Colors.red.withOpacity(0.85),
            msg: response.message ?? "Ouups, Veuillez recommencer !",
            gravity: ToastGravity.BOTTOM,
          );
        }
      } else {
        Fluttertoast.showToast(
          backgroundColor: Colors.red.withOpacity(0.85),
          msg:
              "Veuillez selectionner les médicaments ou scanner votre ordonnance !",
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.red.withOpacity(0.85),
        msg: "Aucune pharmacie n'a été trouvé dans ce périmètre de recherche !",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void officinesAvialable() async {
    setState(() {
      wait = true;
      officines = [];
      markers = [];
      distanceTableaux = {};
      markersLatLng = [];
      routesOfficines = {};
    });

    List<dynamic> datas = await OfficineProvider.avialable({
      "circonscription":
          user.circonscription == null ? "" : user.circonscription!.id,
      "distance": !isZone ? distance : 0,
      "longitude": myPosition.longitude,
      "latitude": myPosition.latitude
    });

    if (datas.length > 0) {
      for (var element in datas) {
        var offs = await OfficineProvider.all({"id": element["officine"]});
        OfficineModel officine = offs[0];
        officines.add(officine);

        double ladistance = element["distance"];
        distanceTableaux[officine] = ladistance < 1000
            ? "$ladistance m"
            : "${(ladistance / 1000).toStringAsFixed(2)} km";

        routesOfficines[officine.id!] = jsonDecode(element["route"]);
        markers.add(
            CustomMyMarker(LatLng(officine.lon!, officine.lat!), officine));
        markersLatLng.add(LatLng(officine.lon!, officine.lat!));
        LatLngBounds bounds = LatLngBounds.fromPoints(markersLatLng);
        final centerZoom = mapController.centerZoomFitBounds(bounds);
        _animatedMapMove(centerZoom.center, centerZoom.zoom);
      }
      setState(() {
        wait = false;
        officines;
      });
    } else {
      setState(() {
        wait = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NoPharmacieAvialable();
        },
      );
    }
  }

  void scrollToContainer(String index) async {
    await sharedPreferencesService.init();
    await sharedPreferencesService.setString('scrollToContainerIndex', index);
    var geojson = routesOfficines[index];
    List<LatLng> points = [];
    for (var element in jsonDecode(geojson)["geometry"]["coordinates"]) {
      points.add(LatLng(element[1], element[0]));
    }

    routeCoordinates = Polyline(
        points: points,
        color: Colors.orange,
        borderStrokeWidth: 3,
        strokeWidth: 3,
        borderColor: Colors.white);
    mapController.fitBounds(getBoundsFromCoordinates(routeCoordinates.points));
    setState(() {});
  }

  void showProduitsListe(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ProduitsListe();
      },
    );
  }

  Future<void> getCodeBar() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.BARCODE);
    var datas = await ProduitProvider.all({"codebarre": barcodeScanRes});
    _selectedOptions.add(datas[0].name);
    await sharedPreferencesService.setStringList(
        'produitsSelected', _selectedOptions);
  }

  final picker = ImagePicker();
  late Future<XFile?> pickedFile = Future.value(null);

  void chooseCamera() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChooseCamera(
          cameraFunction: _captureImageFromCamera,
          galleryFunction: _pickImageFromGallery,
        );
      },
    );
  }

  Future<void> _captureImageFromCamera() async {
    pickedFile = picker
        .pickImage(source: ImageSource.camera)
        .whenComplete(() => setState(() {
              setState(() {});
            }));
    pickedFile.then((value) {
      setState(() {
        isOrdonnance = true;
        file = File(value!.path);
        List<int> imageBytes = file.readAsBytesSync();
        base64 = "data:image/png;base64," + base64Encode(imageBytes);
      });
    });
    Navigator.of(context).pop();
  }

  Future<void> _pickImageFromGallery() async {
    pickedFile = picker
        .pickImage(
          source: ImageSource.gallery,
        )
        .whenComplete(() => setState(() {}));
    pickedFile.then((value) {
      setState(() {
        isOrdonnance = true;
        file = File(value!.path);
        List<int> imageBytes = file.readAsBytesSync();
        base64 = base64Encode(imageBytes);
      });
    });
    Navigator.of(context).pop();
  }

  Future<void> getPosition() async {
    Position? position;
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      position = await Geolocator.getLastKnownPosition();
      print("L'utilisateur a refusé l'accès à la localisation");
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    await sharedPreferencesService.init();
    await sharedPreferencesService.setString(
        'lat', position!.latitude.toString());
    await sharedPreferencesService.setString(
        'lon', position.longitude.toString());
  }

  void fitBoundsOnCircle(LatLng center, double radius) {
    Distance distance = Distance();
    LatLng p1 = distance.offset(center, radius * 2, 0.0);
    LatLng p2 = distance.offset(center, -radius * 2, 0.0);

    final bounds = LatLngBounds.fromPoints([center, p1, p2]);
    final centerZoom = mapController.centerZoomFitBounds(bounds);
    _animatedMapMove(centerZoom.center, centerZoom.zoom);
  }

  void locateMe() async {
    setState(() {
      getPosition();
    });
    fitBoundsOnCircle(myPosition, distance * 1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: Helper.getScreenHeight(context) * 0.8,
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: myPosition,
                      zoom: 16,
                      minZoom: 6,
                      maxZoom: 26,
                      scrollWheelVelocity: 2.0,
                      interactiveFlags:
                          InteractiveFlag.all & ~InteractiveFlag.rotate,
                      onTap: (_, __) => _popupLayerController.hideAllPopups(),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      CircleLayer(
                        circles: [
                          CircleMarker(
                            point: myPosition, // Coordonnées du cercle
                            radius: !isZone ? distance * 1000 : 0,
                            useRadiusInMeter: true,
                            borderColor: Colors.grey,
                            borderStrokeWidth: 1.5,
                            color: Colors.transparent, // Couleur du cercle
                          ),
                        ],
                      ),
                      PolylineLayer(
                        polylines: [routeCoordinates],
                      ),
                      PopupMarkerLayer(
                        options: PopupMarkerLayerOptions(
                          popupController: _popupLayerController,
                          markers: markers
                              .map((element) => Marker(
                                    point: element.point,
                                    width: 35,
                                    height: 35,
                                    builder: (context) => PharmacieMapPin(),
                                    anchorPos: AnchorPos.align(AnchorAlign.top),
                                  ))
                              .toList(),
                          popupDisplayOptions: PopupDisplayOptions(
                            builder: (BuildContext context, Marker marker) {
                              CustomMyMarker element = markers.firstWhere(
                                  (element) => element.point == marker.point);
                              return MapMinPharmaciePopup(
                                marker: marker,
                                officine: element.officine,
                                ratio:
                                    "${ratioTableaux[element.officine].toString()}/${initialProduits.length}",
                                distance: distanceTableaux[element.officine]!,
                                ittineraireFunction: () {
                                  scrollToContainer(element.officine.id!);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      PopupMarkerLayer(
                        options: PopupMarkerLayerOptions(
                          // popupController: _popupLayerController,
                          markers: [
                            Marker(
                              point: myPosition,
                              width: 35,
                              height: 35,
                              builder: (context) => Clignotement(
                                  child: MyPinInMap(), milliseconds: 1000),
                              anchorPos: AnchorPos.align(AnchorAlign.top),
                            ),
                          ],
                          popupDisplayOptions: PopupDisplayOptions(
                              builder: (BuildContext context, Marker marker) {
                            return Container(
                              padding: EdgeInsets.all(7),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Vous êtes ici !"),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                      child: LoaderScreen(
                        title:
                            "IPI envoie votre demande aux pharmacies sélectionnées...",
                      ),
                      visible: !ready),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.51,
              maxChildSize: 0.51,
              minChildSize: 0.27,
              builder: (context, scrollController) {
                return ListView(
                  controller: scrollController,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                      height: Helper.getScreenHeight(context) * 0.48,
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 245, 239, 235),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Indicator(),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!isZone) {
                                        isZone = true;
                                        officinesAvialable();
                                      }
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xffe4f3e4),
                                                Color(0xff92cf94)
                                              ],
                                              stops: [0.25, 1],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Recherche zone",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10),
                                            Opacity(
                                              child:
                                                  SelectCirconscriptionBloc(),
                                              opacity: !isZone ? 0 : 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      !isZone ? Calque() : Container(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isZone) {
                                        isZone = false;
                                        officinesAvialable();
                                      }
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xffe4f3e4),
                                                Color(0xff92cf94)
                                              ],
                                              stops: [0.25, 1],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Périmètre de  ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10),
                                            Opacity(
                                              child: SelectDistanceBloc(),
                                              opacity: !isZone ? 1 : 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                      isZone ? Calque() : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  showProduitsListe(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors
                                            .grey, // Couleur de la bordure
                                        width: 2.0, // Épaisseur de la bordure
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: AppColor.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Rechercher ...",
                                        style: TextStyle(
                                          color: AppColor.placeholder,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              // GestureDetector(
                              //   child: Container(
                              //       padding: EdgeInsets.all(8),
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.all(
                              //               Radius.circular(10)),
                              //           border: Border.all(
                              //               color: AppColor.secondary,
                              //               width: 2)),
                              //       child: Icon(
                              //         Icons.barcode_reader,
                              //         size: 26,
                              //       )),
                              //   onTap: () {
                              //     getCodeBar();
                              //   },
                              // ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: AppColor.secondary, width: 2)),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 26,
                                  ),
                                ),
                                onTap: () {
                                  chooseCamera();
                                },
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => showProduitsListe(context),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.secondary,
                                              width: 1),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xffd1d1d1),
                                              Color(0xffffffff)
                                            ],
                                            stops: [0, 1],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _selectedOptions.length.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 7),
                                          Text(
                                            "médicaments",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.secondary,
                                            width: 1),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xffd1d1d1),
                                            Color(0xffffffff)
                                          ],
                                          stops: [0, 1],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          isOrdonnance ? "1" : "0",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 7),
                                        Text(
                                          "ordonnance",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: Helper.getScreenWidth(context) * 0.2,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.secondary, width: 1),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffd1d1d1),
                                        Color(0xffffffff)
                                      ],
                                      stops: [0, 1],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: FutureBuilder<XFile?>(
                                    future: pickedFile,
                                    builder: (context, data) {
                                      if (data.hasData) {
                                        file = File(data.data!.path);
                                        return Container(
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.file(
                                            file,
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                          ),
                                        );
                                      }
                                      return Text("...");
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: Helper.getScreenWidth(context) * 0.25,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.secondary, width: 1),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffd1d1d1),
                                        Color(0xffffffff)
                                      ],
                                      stops: [0, 1],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: !wait
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            officines.length.toString(),
                                            style: TextStyle(
                                                fontSize: 50,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "pharmacies trouvées",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    : Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                                height: 35,
                                                width: 35,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.grey,
                                                )),
                                            const SizedBox(height: 15),
                                            Text(
                                              "patientez...",
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          Spacer(),
                          ready
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        makeDemande();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_search,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Faire la demande ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              top: 10,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColor.blue, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: Helper.getScreenHeight(context) * 0.45,
                right: 5,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: AppColor.secondary, width: 2)),
                  child: GestureDetector(
                    child: Icon(
                      Icons.location_searching,
                      size: 26,
                    ),
                    onTap: () {
                      locateMe();
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Calque extends StatelessWidget {
  const Calque({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff464646).withOpacity(0.7),
              Color(0xffd1d1d1).withOpacity(0.7)
            ],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
