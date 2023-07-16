import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/OfficineProvider.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/loader.dart';
import 'package:ipi/widgets/noPharmacieAvialable.dart';
import 'package:ipi/widgets/pharmacieItemCard2.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';
import 'package:ipi/widgets/selectDistanceBloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/mapPin.dart';
import 'package:ipi/widgets/mapPopupPin.dart';
import 'package:flutter_map/plugin_api.dart';
import 'dart:convert';

class PharmaciesGarde extends StatefulWidget {
  static const routeName = "/PharmaciesGarde";

  PharmaciesGarde({
    Key? key,
  }) : super(key: key);

  @override
  State<PharmaciesGarde> createState() => PharmaciesGardeState();
}

class PharmaciesGardeState extends State<PharmaciesGarde>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  late StreamSubscription<String> _sharedPreferencesSubscription;

  MapController mapController = MapController();
  final PopupController _popupLayerController = PopupController();

  List<CustomMyMarker> markers = [];
  List<LatLng> markersLatLng = [];
  late Map<OfficineModel, String> distanceTableaux = {};

  List<OfficineModel> officines = [];
  late Map<String, dynamic> routesOfficines = {};
  Polyline routeCoordinates = Polyline(points: []);

  late UtilisateurModel user = UtilisateurModel();
  late LatLng myPosition = LatLng(5.307600, -3.972112);
  int distance = 1;
  bool isZone = false;
  bool ready = true;

  @override
  void initState() {
    getData();
    officinesAvialable();

    _sharedPreferencesSubscription =
        sharedPreferencesService.watchString('distance').listen((value) {
      // setState(() {
      //   distance = int.parse(value);
      // });
      officinesAvialable();
      locateMe();
    });

    _sharedPreferencesSubscription =
        sharedPreferencesService.watchString('circonscription').listen((value) {
      officinesAvialable();
    });

    super.initState();
  }

  @override
  void dispose() {
    _sharedPreferencesSubscription.cancel();
    super.dispose();
  }

  void getData() async {
    await sharedPreferencesService.init();
    distance = int.parse(await sharedPreferencesService.getString('distance'));
  }

  void officinesAvialable() async {
    setState(() {
      ready = false;
      markers = [];
      distanceTableaux = {};
      markersLatLng = [];
    });

    List<dynamic> datas = await OfficineProvider.garde_avialable({
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
        ready = true;
        officines;
      });
    } else {
      setState(() {
        ready = true;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NoPharmacieAvialable();
        },
      );
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              height: Helper.getScreenHeight(context) * 0.85,
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: myPosition,
                      zoom: 13,
                      minZoom: 6,
                      maxZoom: 22,
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
                                ratio: "",
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
                          markers: [
                            Marker(
                              point: myPosition,
                              width: 35,
                              height: 35,
                              builder: (context) => MyPinInMap(),
                              anchorPos: AnchorPos.align(AnchorAlign.top),
                            )
                          ],
                          popupDisplayOptions: PopupDisplayOptions(
                              builder: (BuildContext context, Marker marker) {
                            return Container(
                              padding: EdgeInsets.all(7),
                              margin: EdgeInsets.all(7),
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
                        title: "IPI recherche les pharmacies de garde ..."),
                    visible: !ready,
                  ),
                  Positioned(
                    top: 7,
                    child: SafeArea(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: AppColor.blue, width: 1),
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
                    ),
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.25,
              maxChildSize: 0.6,
              minChildSize: 0.25,
              builder: (context, scrollController) {
                return ListView(
                  controller: scrollController,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                      height: Helper.getScreenHeight(context) * 0.6,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Indicator(),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!isZone) {
                                        isZone = true;
                                        getData();
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
                                      !isZone
                                          ? Positioned(
                                              top: 0,
                                              right: 0,
                                              left: 0,
                                              bottom: 0,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff464646)
                                                          .withOpacity(0.7),
                                                      Color(0xffd1d1d1)
                                                          .withOpacity(0.7)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isZone) {
                                        isZone = false;
                                        getData();
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
                                      isZone
                                          ? Positioned(
                                              top: 0,
                                              right: 0,
                                              left: 0,
                                              bottom: 0,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff464646)
                                                          .withOpacity(0.7),
                                                      Color(0xffd1d1d1)
                                                          .withOpacity(0.7)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children:
                                      distanceTableaux.keys.map((officine) {
                                    return GestureDetector(
                                      onTap: () {
                                        // targetMarker(officine.id);
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            PharmacieItemCard2(
                                              officine: officine,
                                              distance:
                                                  distanceTableaux[officine] ??
                                                      "",
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 3),
                                              child: Divider(
                                                color: AppColor.placeholder,
                                                thickness: 1.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
