import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/screens/searchPage.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';
import 'package:ipi/widgets/searchBarGroup.dart';
import '../utils/helper.dart';

class SearchedMedicamentListDialog extends StatefulWidget {
  const SearchedMedicamentListDialog({Key? key, required this.initialProduits})
      : super(key: key);
  static const routeName = "/rearchedMedicamentListDialog";
  final List<ProduitModel> initialProduits;

  @override
  State<SearchedMedicamentListDialog> createState() =>
      _SearchedMedicamentListDialogState();
}

class _SearchedMedicamentListDialogState
    extends State<SearchedMedicamentListDialog> {
  _SearchedMedicamentListDialogState();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  GlobalKey searchBarGroupkey = GlobalKey();
  UtilisateurModel? user;
  late List<ProduitModel> _produits = [];
  late List<String> _selectedOptions = [];

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
    _sharedPreferencesSubscription.cancel(); // Arrêter le StreamSubscription
    super.dispose();
  }

  Future<void> getData() async {
    await sharedPreferencesService.init();
    _sharedPreferencesSubscription = sharedPreferencesService
        .watchString('produitsSelected')
        .listen((value) async {
      _selectedOptions =
          await sharedPreferencesService.getStringList('produitsSelected');
      setState(() {});
    });

    _selectedOptions =
        await sharedPreferencesService.getStringList('produitsSelected');
    _produits = await ProduitProvider.all({});
    setState(() {});
  }

  void removeInselectedOptionsID(String text) async {
    _selectedOptions.remove(text);
    await sharedPreferencesService.setStringList(
        'produitsSelected', _selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: Helper.getScreenHeight(context) * 0.55,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.85)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Helper.getAssetName("pharma1.png", "icons"),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "Liste des médicaments".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            height: 1.3,
                            color: Colors.green.shade900),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SearchBarGroup(key: searchBarGroupkey),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: _selectedOptions.length == 0
                      ? Center(
                          child: Text(
                            "Saisissez le médicament que vous recherchez\n ou appuyer sur @ pour scanner votre ordonnance ou le code barre du medicament",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.5),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: _selectedOptions.map((text) {
                              ProduitModel produitTrouve = _produits.firstWhere(
                                  (produit) => produit.name == text);
                              return Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: SuggestionItemCard(
                                            produit: produitTrouve)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        removeInselectedOptionsID(text);
                                      },
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                        size: 26,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                (_selectedOptions.length > 0)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: Helper.getScreenWidth(context) * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white54,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search,
                                    size: 17, color: AppColor.blue),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.of(context)
                                          .pushNamed(SearchPage.routeName);
                                    },
                                    child: Text(
                                      "Refaire la recherche",
                                      style: TextStyle(fontSize: 13),
                                    ))
                              ],
                            ),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }
}
