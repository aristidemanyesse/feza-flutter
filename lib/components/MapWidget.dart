import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:ipi/components/mapPin.dart';
import 'package:ipi/components/mapPopupPin.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as Lotties;

import '../utils/utilities.dart';

class MapWidget extends StatefulWidget {
  MapWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> with TickerProviderStateMixin {
  MapWidgetController controller = Get.find();
  AppController appController = Get.find();
  OfficineController officineController = Get.find();

  @override
  void initState() {
    ever(controller.bounds, (bounds) {
      center(bounds);
    });

    ever(controller.center, (value) {
      controller.centerMapOnMe();
      LatLngBounds bounds = controller.bounds.value;
      center(bounds);
    });

    ever(officineController.routeCoordinates, (datas) {
      if (datas.points.length > 0) {
        controller.mapController.value
            .fitBounds(getBoundsFromCoordinates(datas.points));
      }
    });

    super.initState();
  }

//centrer la map au clic du bouton
  void center(bounds) {
    CenterZoom zoom =
        controller.mapController.value.centerZoomFitBounds(bounds);
    animatedMapMove(zoom.center, zoom.zoom);
  }

  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  void animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: controller.mapController.value.center.latitude,
        end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: controller.mapController.value.center.longitude,
        end: destLocation.longitude);
    final zoomTween = Tween<double>(
        begin: controller.mapController.value.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controll = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controll, curve: Curves.fastOutSlowIn);
    final startIdWithTarget =
        '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controll.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }

      hasTriggeredMove |= controller.mapController.value.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controll.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controll.dispose();
      }
    });
    controll.forward();
  }

  @override
  void dispose() {
    controller.onInit();
    appController.onInit();
    officineController.onInit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var markers = controller.markers;
      var distanceTableaux = officineController.distanceTableaux;
      var routeCoordinates = officineController.routeCoordinates.value;
      var popupLayerController = controller.popupLayerController.value;

      return FlutterMap(
        mapController: controller.mapController.value,
        options: MapOptions(
          center: controller.currentPosition.value,
          zoom: 14,
          minZoom: 6,
          maxZoom: 20,
          scrollWheelVelocity: 2.0,
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          onTap: (_, __) => popupLayerController.hideAllPopups(),
        ),
        children: [
          TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              subdomains: ['mt0', 'mt1', 'mt2', 'mt3']),
          Obx(() {
            return CircleLayer(
              circles: [
                CircleMarker(
                  point:
                      controller.currentPosition.value, // Coordonnées du cercle
                  radius: appController.radius.value * 1000,
                  useRadiusInMeter: true,
                  borderColor: Colors.grey,
                  borderStrokeWidth: 1.5,
                  color: Colors.transparent, // Couleur du cercle
                ),
              ],
            );
          }),
          PolylineLayer(
            polylines: [routeCoordinates],
          ),
          Obx(() {
            return PopupMarkerLayer(
              options: PopupMarkerLayerOptions(
                popupController: popupLayerController,
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
                    CustomMyMarker element = markers
                        .firstWhere((element) => element.point == marker.point);
                    return MapMinPharmaciePopup(
                      marker: marker,
                      officine: element.officine,
                      ratio: "",
                      distance: distanceTableaux[element.officine]!,
                      ittineraireFunction: () {
                        officineController.routeOfOfficine(element.officine);
                      },
                    );
                  },
                ),
              ),
            );
          }),
          Obx(() {
            return PopupMarkerLayer(
              options: PopupMarkerLayerOptions(
                markers: [
                  Marker(
                    point: controller.currentPosition.value,
                    width: 35,
                    height: 35,
                    builder: (context) => MyPinInMap(),
                    anchorPos: AnchorPos.align(AnchorAlign.top),
                  ),
                  Marker(
                    point: controller.currentPosition.value,
                    width: officineController.wait.value ? 250 : 0,
                    height: officineController.wait.value ? 250 : 0,
                    builder: (context) =>
                        Lotties.Lottie.asset("assets/lotties/search.json"),
                    anchorPos: AnchorPos.align(AnchorAlign.center),
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
            );
          }),
        ],
      );
    });
  }
}
