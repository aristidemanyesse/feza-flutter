import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/searchBarGroup.dart';

class ProduitsListe extends StatefulWidget {
  static const routeName = "/ProduitsListe";
  ProduitsListe({Key? key}) : super(key: key);

  @override
  State<ProduitsListe> createState() => ProduitsListeState();
}

class ProduitsListeState extends State<ProduitsListe> {
  late StreamSubscription<String> _sharedPreferencesSubscription;

  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  UtilisateurModel? user;
  late List<ProduitModel> _produits = [];
  late List<String> _selectedOptions = [];

  @override
  void initState() {
    super.initState();
    getData();
    _sharedPreferencesSubscription = sharedPreferencesService
        .watchString('produitsSelected')
        .listen((value) async {
      _selectedOptions =
          await sharedPreferencesService.getStringList('produitsSelected');
      setState(() {});
    });
  }

  @override
  void dispose() {
    _sharedPreferencesSubscription.cancel(); // Arrêter le StreamSubscription
    super.dispose();
  }

  Future<void> getData() async {
    await sharedPreferencesService.init();
    _selectedOptions =
        await sharedPreferencesService.getStringList('produitsSelected');
    String? userId = await sharedPreferencesService.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    user = users[0];
    _produits = await sharedPreferencesService.getProduitList('produits');
    setState(() {});
  }

  void removeInselectedOptionsID(String text) async {
    _selectedOptions.remove(text);
    await sharedPreferencesService.setStringList(
        'produitsSelected', _selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
      margin: EdgeInsets.fromLTRB(3, 50, 3, 0),
      decoration: ShapeDecoration(
        color: Color.fromARGB(255, 245, 239, 235),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
      child: Column(
        children: [
          Indicator(),
          SizedBox(
            height: 20,
          ),
          SearchBarGroup(),
          const SizedBox(height: 10),
          Container(
            height: 3,
            color: Colors.grey.shade300,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: _selectedOptions.map((text) {
                ProduitModel? produitTrouve;
                if (_produits.isNotEmpty) {
                  produitTrouve =
                      _produits.firstWhere((produit) => produit.name == text);
                }
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: SuggestionItemCard(
                              produit: produitTrouve ??
                                  ProduitModel(
                                      name: "",
                                      description: "",
                                      image: "",
                                      codebarre: ""))),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          removeInselectedOptionsID(text);
                        },
                        child: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                          size: 27,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Terminer",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
