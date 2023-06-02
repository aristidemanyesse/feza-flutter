import 'dart:async';

import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/OfficineProvider.dart';
import 'package:ipi/provider/ProduitInOfficineProvider.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/searchPageBackground.dart';
import 'package:ipi/screens/searchPageExpanded.dart';
import 'package:ipi/screens/searchPagePreview.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'dart:convert';

import 'package:latlong2/latlong.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  static const routeName = "/searchPage";

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines = [];
  Map<OfficineModel, int> ratioTableaux = {};
  Map<OfficineModel, String> distanceTableaux = {};
  Map<String, dynamic> routesOfficines = {};
  List<ProduitModel> initialProduits = [];
  late LatLng myPosition = LatLng(5.307600, -3.972112);
  late List<String>? datasGetted = [];

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

    _sharedPreferencesSubscription = sharedPreferencesService
        .watchString('produitsIDSelected')
        .listen((value) async {
      datasGetted =
          await sharedPreferencesService.getStringList('produitsIDSelected');
      setState(() {});
    });
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

    datasGetted =
        await sharedPreferencesService.getStringList('produitsIDSelected');
    tableauxOfficines = [];
    ratioTableaux = {};
    distanceTableaux = {};
    List<dynamic> datas =
        await ProduitInOfficineProvider.searchProduitsAvialableInOfficine({
      "circonscription": user.circonscription!.id,
      "produits": datasGetted,
      "longitude": myPosition.longitude,
      "latitude": myPosition.latitude
    });
    initialProduits =
        await ProduitProvider.specificAll({"produits": datasGetted});

    for (var element in datas) {
      List<OfficineModel> officines =
          await OfficineProvider.all({"id": element["officine"]});
      OfficineModel officine = officines[0];
      List<ProduitModel> produits =
          await ProduitProvider.specificAll({"produits": element["produits"]});

      tableauxOfficines.add({officine: produits});
      ratioTableaux[officine] = element["ratio"];
      routesOfficines[officine.id!] = jsonDecode(element["route"]);

      double distance = element["distance"];
      distanceTableaux[officine] = distance < 1
          ? "${distance * 1000} m"
          : "${distance.toStringAsFixed(2)} km";
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
        previewWidget: SearchPagePreview(
            key: _previewdKey, tableauxOfficines: tableauxOfficines),
        expandedWidget: SearchPageExpanded(
            key: _expandedKey,
            ratioTableaux: ratioTableaux,
            distanceTableaux: distanceTableaux,
            tableauxOfficines: tableauxOfficines,
            initialProduits: initialProduits,
            backgroundKey: _backgroundKey),
        backgroundWidget: SearchPageBackground(
            key: _backgroundKey,
            tableauxOfficines: tableauxOfficines,
            ratioTableaux: ratioTableaux,
            distanceTableaux: distanceTableaux,
            initialProduits: initialProduits,
            routesOfficines: routesOfficines,
            position: myPosition),
        duration: const Duration(milliseconds: 10),
        maxExtent: MediaQuery.of(context).size.height * 0.5,
        onDragging: (pos) {},
      ),
    );
  }
}
