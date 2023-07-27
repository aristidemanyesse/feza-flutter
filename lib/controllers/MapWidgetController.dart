import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ipi/components/mapPin.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:latlong2/latlong.dart';

class MapWidgetController extends GetxController {
  AppController appController = Get.find();
  OfficineController officineController = Get.find();

  Rx<MapController> mapController = Rx<MapController>(MapController());
  final Rx<PopupController> popupLayerController =
      Rx<PopupController>(PopupController());
  Rx<LatLng> currentPosition = Rx<LatLng>(LatLng(5.260298, -3.9522842));
  Rx<LatLngBounds> bounds = Rx<LatLngBounds>(
      LatLngBounds(LatLng(5.260298, -3.9522842), LatLng(5.260298, -3.9522842)));

  RxList<CustomMyMarker> markers = RxList<CustomMyMarker>([]);
  RxList<LatLng> markersLatLng = RxList<LatLng>([]);

  RxBool center = false.obs;

  void onInit() {
    getLocation();

    ever(appController.radius, (value) {
      markers.value = [];
      markersLatLng.value = [];
      centerMapOnMe();
      officineController.officinesInZone(currentPosition.value);
    });

    ever(appController.searchByAround, (value) {
      if (value) {
        centerMapOnMe();
      }
      markers.value = [];
      markersLatLng.value = [];
      officineController.officinesInZone(currentPosition.value);
    });

    ever(officineController.officines, (datas) {
      if (datas.length > 0) {
        markers.value = [];
        markersLatLng.value = [];
        for (OfficineModel officine in datas) {
          markers.add(
              CustomMyMarker(LatLng(officine.lon!, officine.lat!), officine));
          markersLatLng.add(LatLng(officine.lon!, officine.lat!));
          bounds.value = LatLngBounds.fromPoints(markersLatLng);
        }
      }
    });

    super.onInit();
  }

  void getLocation() async {
    Position? position;
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      position = await Geolocator.getLastKnownPosition();
      print("L'utilisateur a refusé l'accès à la localisation");
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    currentPosition.value = LatLng(position!.latitude, position.longitude);
  }

  void centerMapOnMe() {
    Distance distance = Distance();
    LatLng p1 = distance.offset(
        currentPosition.value, appController.radius.value * 1000 * 2, 0.0);
    LatLng p2 = distance.offset(
        currentPosition.value, -appController.radius.value * 1000 * 2, 0.0);

    markersLatLng.value = [currentPosition.value, p1, p2];
    for (OfficineModel officine in officineController.officines) {
      markersLatLng.add(LatLng(officine.lon!, officine.lat!));
    }
    bounds.value = LatLngBounds.fromPoints(markersLatLng);
  }

//pour recentrer la map
  void changeCenter() {
    center.value = !center.value;
  }
}
