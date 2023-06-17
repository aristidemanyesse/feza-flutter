import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/OfficineProvider.dart';
import 'package:ipi/provider/ProduitInOfficineProvider.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/loader.dart';
import 'package:ipi/widgets/noPharmacieAvialable.dart';
import 'package:ipi/widgets/pharmacieItemCard.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/mapPin.dart';
import 'package:ipi/widgets/mapPopupPin.dart';
import 'package:ipi/widgets/searchedMedicamentListDialog.dart';
import 'package:flutter_map/plugin_api.dart';
import 'dart:convert';

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
  late List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines = [];
  List<OfficineModel> officines = [];
  late Map<String, dynamic> routesOfficines = {};
  late Map<OfficineModel, int> ratioTableaux = {};
  late Map<OfficineModel, String> distanceTableaux = {};
  late List<ProduitModel> initialProduits = [];
  late LatLng position = LatLng(5.307600, -3.972112);

  MapController mapController = MapController();
  final PopupController _popupLayerController = PopupController();
  LatLng center = LatLng(5.260298, -3.9522842);
  LatLng myPosition = LatLng(5.260298, -3.9522842);
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  List<CustomMyMarker> markers = [];
  List<LatLng> markersLatLng = [];
  Polyline routeCoordinates = Polyline(points: []);
  bool ready = false;

  Future<void> getData() async {
    await sharedPreferencesService.init();

    String? userId = await sharedPreferencesService.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    UtilisateurModel user = users[0];

    dynamic lat = await sharedPreferencesService.getString('lat');
    dynamic lon = await sharedPreferencesService.getString('lon');
    myPosition = LatLng(double.parse(lat), double.parse(lon));

    List<String> produitsSelected =
        await sharedPreferencesService.getStringList('produitsIDSelected');
    List<dynamic> datas =
        await ProduitInOfficineProvider.searchProduitsAvialableInOfficine({
      "circonscription": user.circonscription!.id,
      "produits": produitsSelected,
      "longitude": myPosition.longitude,
      "latitude": myPosition.latitude
    });

    if (datas.length > 0) {
      initialProduits =
          await ProduitProvider.specificAll({"produits": produitsSelected});
      for (var element in datas) {
        officines = await OfficineProvider.all({"id": element["officine"]});
        OfficineModel officine = officines[0];
        List<ProduitModel> produits = await ProduitProvider.specificAll(
            {"produits": element["produits"]});

        double distance = element["distance"];
        distanceTableaux[officine] = distance < 1
            ? "${distance * 1000} m"
            : "${distance.toStringAsFixed(2)} km";

        tableauxOfficines.add({officine: produits});
        ratioTableaux[officine] = element["ratio"];
        routesOfficines[officine.id!] = jsonDecode(element["route"]);
        markers.add(
            CustomMyMarker(LatLng(officine.lon!, officine.lat!), officine));
        markersLatLng.add(LatLng(officine.lon!, officine.lat!));
        LatLngBounds bounds = LatLngBounds.fromPoints(markersLatLng);
        final centerZoom = mapController.centerZoomFitBounds(bounds);
        _animatedMapMove(centerZoom.center, centerZoom.zoom);
      }
      ready = true;
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NoPharmacieAvialable();
        },
      );
    }
  }

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

    // Note this method of encoding the target destination is a workaround.
    // When proper animated movement is supported (see #1263) we should be able
    // to detect an appropriate animated movement event which contains the
    // target zoom/center.
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
    super.dispose();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void targetMarker(String? id) {
    for (var marker in markers) {
      if (marker.officine.id == id) {
        scrollToContainer(id!);
        _animatedMapMove(marker.point, 13);
      }
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
    Navigator.pop(context);
    setState(() {});
  }

  LatLngBounds getBoundsFromCoordinates(List<LatLng> coordinates) {
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLng = double.infinity;
    double maxLng = -double.infinity;

    for (LatLng coordinate in coordinates) {
      if (coordinate.latitude < minLat) minLat = coordinate.latitude;
      if (coordinate.latitude > maxLat) maxLat = coordinate.latitude;
      if (coordinate.longitude < minLng) minLng = coordinate.longitude;
      if (coordinate.longitude > maxLng) maxLng = coordinate.longitude;
    }

    return LatLngBounds(
      LatLng(minLat, minLng),
      LatLng(maxLat, maxLng),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: [
                            FlutterMap(
                              mapController: mapController,
                              options: MapOptions(
                                center: center,
                                zoom: 13,
                                minZoom: 6,
                                maxZoom: 22,
                                scrollWheelVelocity: 2.0,
                                interactiveFlags: InteractiveFlag.all &
                                    ~InteractiveFlag.rotate,
                                onTap: (_, __) =>
                                    _popupLayerController.hideAllPopups(),
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  subdomains: const ['a', 'b', 'c'],
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
                                              builder: (context) =>
                                                  PharmacieMapPin(),
                                              anchorPos: AnchorPos.align(
                                                  AnchorAlign.top),
                                            ))
                                        .toList(),
                                    popupDisplayOptions: PopupDisplayOptions(
                                      builder: (BuildContext context,
                                          Marker marker) {
                                        CustomMyMarker element =
                                            markers.firstWhere((element) =>
                                                element.point == marker.point);
                                        return MapMinPharmaciePopup(
                                          marker: marker,
                                          officine: element.officine,
                                          ratio:
                                              "${ratioTableaux[element.officine].toString()}/${initialProduits.length}",
                                          distance: distanceTableaux[
                                              element.officine]!,
                                          ittineraireFunction: () {
                                            scrollToContainer(
                                                element.officine.id!);
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
                                        builder: (context) => MyPinInMap(),
                                        anchorPos:
                                            AnchorPos.align(AnchorAlign.top),
                                      )
                                    ],
                                    popupDisplayOptions: PopupDisplayOptions(
                                        builder: (BuildContext context,
                                            Marker marker) {
                                      return Container(
                                        padding: EdgeInsets.all(7),
                                        margin: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text("Vous êtes ici !"),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              child: LoaderScreen(),
                              visible: !ready,
                            ),
                          ],
                        )),
                    Container(
                      height: Helper.getScreenHeight(context) * 0.09,
                      width: Helper.getScreenWidth(context),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.0),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 20,
                                  color: AppColor.blue,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SearchedMedicamentListDialog(
                                          initialProduits: initialProduits);
                                    },
                                  );
                                },
                                child: initialProduits.length > 0
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          "Liste des médicaments (${initialProduits.length})",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : Container()),
                          )
                        ],
                      ),
                    ),
                    ready
                        ? Positioned(
                            bottom: 20,
                            right: 40,
                            left: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    useSafeArea: true,
                                    showDragHandle: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 15, 5),
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              topRight: Radius.circular(40),
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Indicator(),
                                              const SizedBox(height: 15),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Circonscription"),
                                                  SelectCirconscriptionBloc(),
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Container(
                                                height: 5,
                                                color: Colors.grey.shade300,
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 7),
                                              ),
                                              const SizedBox(height: 16),
                                              Expanded(
                                                  child: SingleChildScrollView(
                                                child: Column(
                                                  children: tableauxOfficines
                                                      .map((element) {
                                                    OfficineModel officine =
                                                        element.keys.first;
                                                    List<ProduitModel>
                                                        produits = element[
                                                                element.keys
                                                                    .first] ??
                                                            [];

                                                    return GestureDetector(
                                                      onTap: () {
                                                        targetMarker(
                                                            officine.id);
                                                      },
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                        child: Column(
                                                          children: [
                                                            PharmacieItemCard(
                                                              officine:
                                                                  officine,
                                                              produits:
                                                                  produits,
                                                              initialProduits:
                                                                  initialProduits,
                                                              distance:
                                                                  distanceTableaux[
                                                                          officine] ??
                                                                      "",
                                                              ratio: ratioTableaux[
                                                                      officine]
                                                                  .toString(),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          3),
                                                              child: Divider(
                                                                color: AppColor
                                                                    .placeholder,
                                                                thickness: 1.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    'Voir la liste des pharmacies (${tableauxOfficines.length}) ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: 0.6),
                                  )),
                            ),
                          )
                        : Container()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
