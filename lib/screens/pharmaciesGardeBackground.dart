import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/loader.dart';
import 'package:ipi/widgets/mapPopupPin.dart';
import 'package:latlong2/latlong.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/mapPin.dart';
import 'package:location/location.dart';

class PharmaciesGardeBackground extends StatefulWidget {
  static const routeName = "/PharmaciesGardeBackground";
  final Map<String, dynamic> routesOfficines;
  final Map<OfficineModel, String> distanceTableaux;
  late LatLng position = LatLng(5.307600, -3.972112);

  PharmaciesGardeBackground(
      {Key? key,
      required this.routesOfficines,
      required this.distanceTableaux,
      required this.position})
      : super(key: key);

  @override
  State<PharmaciesGardeBackground> createState() =>
      PharmaciesGardeBackgroundState();
}

class PharmaciesGardeBackgroundState extends State<PharmaciesGardeBackground>
    with TickerProviderStateMixin {
  MapController mapController = MapController();
  final PopupController _popupLayerController = PopupController();
  LatLng center = LatLng(5.260298, -3.9522842);
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  List<CustomMyMarker> allMarkers = [];
  List<LatLng> allMarkersLatLng = [];
  Polyline routeCoordinates = Polyline(points: []);
  bool ready = false;

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
  void didUpdateWidget(covariant PharmaciesGardeBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Vérifiez si widget.tableauxOfficines est disponible
    if (widget.distanceTableaux.isNotEmpty) {
      // Les données sont disponibles, vous pouvez exécuter votre code ici
      center = widget.position;
      for (var item in widget.distanceTableaux.keys) {
        OfficineModel officine = item;
        allMarkers.add(
            CustomMyMarker(LatLng(officine.lon!, officine.lat!), officine));
        allMarkersLatLng.add(LatLng(officine.lon!, officine.lat!));
      }
      // Calculer les limites des marqueurs
      LatLngBounds bounds = LatLngBounds.fromPoints(allMarkersLatLng);
      final centerZoom = mapController.centerZoomFitBounds(bounds);
      _animatedMapMove(centerZoom.center, centerZoom.zoom);
      setState(() {
        ready = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void targetMarker(String? id) {
    for (var marker in allMarkers) {
      if (marker.officine.id == id) {
        scrollToContainer(id!);
        _animatedMapMove(marker.point, 13);
      }
    }
  }

  void scrollToContainer(String index) async {
    await sharedPreferencesService.init();
    await sharedPreferencesService.setString('scrollToContainerIndex', index);
    var geojson = widget.routesOfficines[index];
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

// ignore: missing_return
  Future<String?> hello() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return "";
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return "";
      }
    }

    _locationData = await location.getLocation();

    location.enableBackgroundMode(enable: true);

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });
    return null;
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
                      child: !ready
                          ? LoaderScreen()
                          : FlutterMap(
                              mapController: mapController,
                              options: MapOptions(
                                center: center,
                                zoom: 13,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName:
                                      'dev.fleaflet.flutter_map.example',
                                ),
                                PolylineLayer(
                                  polylines: [routeCoordinates],
                                ),
                                PopupMarkerLayerWidget(
                                  options: PopupMarkerLayerOptions(
                                    // popupController: _popupLayerController,
                                    markers: [
                                      Marker(
                                        point: center,
                                        width: 25,
                                        height: 25,
                                        builder: (context) => MyPinInMap(),
                                        anchorPos:
                                            AnchorPos.align(AnchorAlign.top),
                                      )
                                    ],
                                    markerRotateAlignment:
                                        PopupMarkerLayerOptions
                                            .rotationAlignmentFor(
                                                AnchorAlign.top),
                                    popupBuilder:
                                        (BuildContext context, Marker marker) {
                                      return Container(
                                        padding: EdgeInsets.all(7),
                                        margin: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text("Vous êtes ici !"),
                                      );
                                    },
                                  ),
                                ),
                                PopupMarkerLayerWidget(
                                  options: PopupMarkerLayerOptions(
                                    // popupController: _popupLayerController,
                                    markers: allMarkers
                                        .map((element) => Marker(
                                              point: element.point,
                                              width: 17,
                                              height: 17,
                                              builder: (context) =>
                                                  PharmacieMapPin(),
                                              anchorPos: AnchorPos.align(
                                                  AnchorAlign.top),
                                            ))
                                        .toList(),
                                    markerRotateAlignment:
                                        PopupMarkerLayerOptions
                                            .rotationAlignmentFor(
                                                AnchorAlign.top),
                                    popupBuilder:
                                        (BuildContext context, Marker marker) {
                                      CustomMyMarker element =
                                          allMarkers.firstWhere((element) =>
                                              element.point == marker.point);
                                      return MapMinPharmaciePopup(
                                        marker: marker,
                                        officine: element.officine,
                                        ratio: "",
                                        distance: widget.distanceTableaux[
                                            element.officine]!,
                                        ittineraireFunction: () {
                                          scrollToContainer(
                                              element.officine.id!);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Container(
                      height: Helper.getScreenHeight(context) * 0.08,
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
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
