import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';
import 'package:ipi/widgets/noPharmacieAvialable.dart';
import 'package:latlong2/latlong.dart';

class OfficineController extends GetxController {
  final box = GetStorage();

  UtilisateurController userController = Get.find();
  AppController appController = Get.find();

  RxList<Officine> officines = RxList<Officine>([]);
  RxMap<Officine, String> distanceTableaux = RxMap<Officine, String>({});
  RxMap<String, dynamic> routesOfficines = <String, dynamic>{}.obs;
  Rx<Polyline> routeCoordinates = Rx<Polyline>(Polyline(points: []));
  RxBool garde = false.obs;
  RxBool wait = false.obs;

  void onInit() {
    super.onInit();
  }

  bool containsOfficine(List<Officine> officines, Officine officine) {
    return officines.any((element) => element.id == officine.id);
  }

  void officinesInZone(LatLng center) async {
    if (!wait.value) {
      wait.value = true;
      routeCoordinates.value = Polyline(points: []);

      distanceTableaux.value = {};
      routesOfficines.value = {};
      officines.value = [];

      Utilisateur? user = userController.currentUser.value;
      if (user == null) {
        wait.value = false;
        return;
      }

      List<dynamic> datas = [];
      if (garde.value) {
        datas = await Officine.garde_avialable({
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
        datas = await Officine.avialable({
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
          var offs = await Officine.all({"id": element["officine"]});
          Officine officine = offs[0];
          if (!containsOfficine(officines, officine)) {
            officines.add(officine);
          }

          double ladistance = element["distance"];
          distanceTableaux[officine] = ladistance < 1000
              ? "$ladistance m"
              : "${(ladistance / 1000).toStringAsFixed(2)} km";

          routesOfficines[officine.id] = jsonDecode(element["route"]);
        }
      } else {
        Get.dialog(NoPharmacieAvialable());
      }
      wait.value = false;
    }
  }

  void routeOfOfficine(Officine officine) async {
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
