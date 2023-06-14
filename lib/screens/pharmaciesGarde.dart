import 'dart:async';
import 'dart:convert';

import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:ipi/models/GardeModel.dart';
import 'package:ipi/models/OfficineDeGardeModel.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/GardeProvider.dart';
import 'package:ipi/provider/OfficineDEGardeProvider.dart';
import 'package:ipi/provider/OfficineProvider.dart';
import 'package:ipi/provider/ProduitInOfficineProvider.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/pharmaciesGardeBackground.dart';
import 'package:ipi/screens/pharmaciesGardeExpanded.dart';
import 'package:ipi/screens/pharmaciesGardePreview.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/noPharmacieAvialable.dart';
import 'package:latlong2/latlong.dart';

class PharmaciesGarde extends StatefulWidget {
  PharmaciesGarde({Key? key}) : super(key: key);
  static const routeName = "/searchPage";

  @override
  State<PharmaciesGarde> createState() => _PharmaciesGardeState();
}

class _PharmaciesGardeState extends State<PharmaciesGarde> {
  Map<OfficineModel, String> distanceTableaux = {};
  Map<String, dynamic> routesOfficines = {};
  late LatLng myPosition = LatLng(5.307600, -3.972112);

  final GlobalKey _previewdKey = GlobalKey();
  final GlobalKey _backgroundKey = GlobalKey();
  final GlobalKey _expandedKey = GlobalKey();

  late StreamSubscription<String> _sharedPreferencesSubscription;

  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _sharedPreferencesSubscription.cancel();
    super.dispose();
  }

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

    distanceTableaux = {};
    DateTime today = new DateTime.now().toLocal();
    List<GardeModel> gardes = await GardeProvider.all({
      "fin": "${today.year}-${today.month}-${today.day}",
      "circonscription": user.circonscription!.id
    });

    if (gardes.length > 0) {
      GardeModel garde = gardes[0];

      List<OfficineDeGardeModel> datas = await OfficineDeGardeProvider.all(
          {"garde": garde.id, "circonscription": user.circonscription!.id});

      for (var elem in datas) {
        distanceTableaux[elem.officine!] = "";
      }
      // double distance = element["distance"];
      //   distanceTableaux[officine] = distance < 1
      //       ? "${distance * 1000} m"
      //       : "${distance.toStringAsFixed(2)} km";

      if (distanceTableaux.length > 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return NoPharmacieAvialable();
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NoPharmacieAvialable();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableBottomSheet(
        minExtent: MediaQuery.of(context).size.height * 0.15,
        useSafeArea: false,
        curve: Curves.easeIn,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        previewWidget: PharmaciesGardePreview(
            key: _previewdKey, distanceTableaux: distanceTableaux),
        expandedWidget: PharmaciesGardeExpanded(
            key: _expandedKey,
            distanceTableaux: distanceTableaux,
            backgroundKey: _backgroundKey),
        backgroundWidget: PharmaciesGardeBackground(
            key: _backgroundKey,
            distanceTableaux: distanceTableaux,
            routesOfficines: routesOfficines,
            position: myPosition),
        duration: const Duration(milliseconds: 10),
        maxExtent: MediaQuery.of(context).size.height * 0.5,
        onDragging: (pos) {},
      ),
    );
  }
}
