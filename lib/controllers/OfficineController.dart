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

  Rx<List<OfficineModel>> officines = Rx<List<OfficineModel>>([]);
  Rx<Map<OfficineModel, String>> distanceTableaux =
      Rx<Map<OfficineModel, String>>({});
  Rx<Map<String, dynamic>> routesOfficines = Rx({});
  Rx<Polyline> routeCoordinates = Rx<Polyline>(Polyline(points: []));
  RxBool wait = false.obs;

  void onInit() {
    super.onInit();
  }

  void officinesInZone(LatLng center) async {
    wait.value = true;
    UtilisateurModel? user = userController.currentUser.value;
    if (user == null) {
      wait.value = false;
      return;
    }

    List<dynamic> datas = await OfficineProvider.avialable({
      "circonscription":
          (user.circonscription == null && !appController.searchByAround.value)
              ? ""
              : user.circonscription!.id,
      "distance":
          appController.searchByAround.value || user.circonscription == null
              ? appController.radius.value
              : 0,
      "longitude": center.longitude,
      "latitude": center.latitude
    });

    distanceTableaux.value = {};
    routesOfficines.value = {};
    if (datas.length > 0) {
      List<OfficineModel> tab = [];
      for (var element in datas) {
        var offs = await OfficineProvider.all({"id": element["officine"]});
        OfficineModel officine = offs[0];
        tab.add(officine);

        double ladistance = element["distance"];
        distanceTableaux.value[officine] = ladistance < 1000
            ? "$ladistance m"
            : "${(ladistance / 1000).toStringAsFixed(2)} km";

        routesOfficines.value[officine.id!] = jsonDecode(element["route"]);
      }
      officines.value = tab;
    } else {
      Get.dialog(NoPharmacieAvialable());
    }
    wait.value = false;
  }

  void routeOfOfficine(OfficineModel officine) async {
    var geojson = routesOfficines.value[officine.id];
    List<LatLng> points = [];
    for (var element in jsonDecode(geojson)["geometry"]["coordinates"]) {
      points.add(LatLng(element[1], element[0]));
    }
    routeCoordinates.value = Polyline(
        points: points,
        color: Colors.orange,
        borderStrokeWidth: 3,
        strokeWidth: 3,
        borderColor: Colors.white);

    // mpController.mapController.value
    //     .fitBounds(getBoundsFromCoordinates(routeCoordinates.value.points));
  }
}
