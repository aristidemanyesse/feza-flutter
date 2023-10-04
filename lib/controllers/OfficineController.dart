import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/OfficineProvider.dart';
import 'package:ipi/widgets/noPharmacieAvialable.dart';
import 'package:latlong2/latlong.dart';

class OfficineController extends GetxController {
  final box = GetStorage();

  UtilisateurController userController = Get.find();
  AppController appController = Get.find();

  RxList<OfficineModel> officines = RxList<OfficineModel>([]);
  RxMap<OfficineModel, String> distanceTableaux =
      RxMap<OfficineModel, String>({});
  RxMap<String, dynamic> routesOfficines = <String, dynamic>{}.obs;
  Rx<Polyline> routeCoordinates = Rx<Polyline>(Polyline(points: []));
  RxBool garde = false.obs;
  RxBool wait = false.obs;

  void onInit() {
    super.onInit();
  }

  bool containsOfficine(List<OfficineModel> officines, OfficineModel officine) {
    return officines.any((element) => element.id == officine.id);
  }

  void officinesInZone(LatLng center) async {
    if (!wait.value) {
      wait.value = true;
      routeCoordinates.value = Polyline(points: []);

      distanceTableaux.value = {};
      routesOfficines.value = {};
      officines.value = [];

      UtilisateurModel? user = userController.currentUser.value;
      if (user == null) {
        wait.value = false;
        return;
      }

      List<dynamic> datas = [];
      if (garde.value) {
        datas = await OfficineProvider.garde_avialable({
          "circonscription": (user.circonscription == null &&
                  !appController.searchByAround.value)
              ? ""
              : user.circonscription!.id,
          "distance":
              appController.searchByAround.value || user.circonscription == null
                  ? appController.radius.value
                  : 0,
          "longitude": center.longitude,
          "latitude": center.latitude
        });
      } else {
        datas = await OfficineProvider.avialable({
          "circonscription": (user.circonscription == null &&
                  !appController.searchByAround.value)
              ? ""
              : user.circonscription!.id,
          "distance":
              appController.searchByAround.value || user.circonscription == null
                  ? appController.radius.value
                  : 0,
          "longitude": center.longitude,
          "latitude": center.latitude
        });
      }

      if (datas.length > 0) {
        for (var element in datas) {
          var offs = await OfficineProvider.all({"id": element["officine"]});
          OfficineModel officine = offs[0];
          if (!containsOfficine(officines, officine)) {
            officines.add(officine);
          }

          double ladistance = element["distance"];
          distanceTableaux[officine] = ladistance < 1000
              ? "$ladistance m"
              : "${(ladistance / 1000).toStringAsFixed(2)} km";

          routesOfficines[officine.id!] = jsonDecode(element["route"]);
        }
      } else {
        Get.dialog(NoPharmacieAvialable());
      }
      wait.value = false;
    }
  }

  void routeOfOfficine(OfficineModel officine) async {
    var geojson = routesOfficines[officine.id];
    List<LatLng> points = [];
    for (var element in jsonDecode(geojson)["geometry"]["coordinates"]) {
      points.add(LatLng(element[1], element[0]));
    }
    routeCoordinates.value = Polyline(
      points: points,
      isDotted: true,
      color: Colors.white,
      borderColor: Colors.black,
      borderStrokeWidth: 3,
      strokeWidth: 3,
      useStrokeWidthInMeter: true,
    );
  }
}
