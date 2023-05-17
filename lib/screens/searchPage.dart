import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/models/UtilisateurModel.dart';
import 'package:yebhofon/provider/OfficineProvider.dart';
import 'package:yebhofon/provider/ProduitInOfficineProvider.dart';
import 'package:yebhofon/provider/ProduitProvider.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/screens/searchPageBackground.dart';
import 'package:yebhofon/screens/searchPageExpanded.dart';
import 'package:yebhofon/screens/searchPagePreview.dart';
import 'package:yebhofon/utils/sharedpre.dart';

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
  List<ProduitModel> initialProduits = [];
  late List<double> myPosition = [];
  late List<String>? datasGetted = [];

  final GlobalKey _previewdKey = GlobalKey();
  final GlobalKey _backgroundKey = GlobalKey();
  final GlobalKey _expandedKey = GlobalKey();

  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  @override
  void initState() {
    super.initState();
    getData();

    sharedPreferencesService
        .watchString('produitsIDSelected')
        .listen((value) async {
      datasGetted =
          await sharedPreferencesService.getStringList('produitsIDSelected');
      setState(() {});
    });
  }

  Future<void> getData() async {
    await sharedPreferencesService.init();

    String? userId = await sharedPreferencesService.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    UtilisateurModel user = users[0];

    datasGetted =
        await sharedPreferencesService.getStringList('produitsIDSelected');
    tableauxOfficines = [];
    ratioTableaux = {};
    distanceTableaux = {};
    List<dynamic> datas =
        await ProduitInOfficineProvider.searchProduitsAvialableInOfficine({
      "circonscription": user.circonscription!.id,
      "produits": datasGetted
    });
    initialProduits =
        await ProduitProvider.specificAll({"produits": datasGetted});

    Position? position;
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      position = await Geolocator.getLastKnownPosition();
      print("L'utilisateur a refusé l'accès à la localisation");
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    myPosition = [position!.latitude, position.longitude];

    for (var element in datas) {
      List<OfficineModel> officines =
          await OfficineProvider.all({"id": element["officine"]});
      OfficineModel officine = officines[0];
      List<ProduitModel> produits =
          await ProduitProvider.specificAll({"produits": element["produits"]});

      tableauxOfficines.add({officine: produits});
      ratioTableaux[officine] = element["ratio"];
      double distance = element["distance"];
      distanceTableaux[officine] = distance < 1
          ? "${distance * 1000} m"
          : "${distance.toStringAsFixed(2)} km";
    }
    setState(() {});
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
            initialProduits: initialProduits,
            position: myPosition),
        duration: const Duration(milliseconds: 10),
        maxExtent: MediaQuery.of(context).size.height * 0.5,
        onDragging: (pos) {},
      ),
    );
  }
}
