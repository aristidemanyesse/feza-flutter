import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = "/searchPage";

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines = [];
  Map<OfficineModel, int> ratioTableaux = {};
  List<ProduitModel> initialProduits = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    UtilisateurModel user = users[0];

    List<String>? datasGetted = prefs.getStringList('produits');
    tableauxOfficines = [];
    ratioTableaux = {};
    List<dynamic> datas =
        await ProduitInOfficineProvider.searchProduitsAvialableInOfficine({
      "circonscription": user.circonscription!.id,
      "produits": datasGetted
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
        previewWidget: SearchPagePreview(tableauxOfficines: tableauxOfficines),
        expandedWidget: SearchPageExpanded(
            ratioTableaux: ratioTableaux,
            tableauxOfficines: tableauxOfficines,
            initialProduits: initialProduits),
        backgroundWidget: SearchPageBackground(
            tableauxOfficines: tableauxOfficines,
            initialProduits: initialProduits),
        duration: const Duration(milliseconds: 10),
        maxExtent: MediaQuery.of(context).size.height * 0.5,
        onDragging: (pos) {},
      ),
    );
  }
}
