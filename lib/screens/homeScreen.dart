import 'dart:async';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/material.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/menuScreen.dart';
import 'package:ipi/screens/searchPage.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';
import 'package:ipi/widgets/searchBarGroup.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  UtilisateurModel? user;
  late List<ProduitModel> _produits = [];
  late List<String> _selectedOptions = [];

  @override
  void initState() {
    getData();
    super.initState();
    sharedPreferencesService
        .watchString('produitsSelected')
        .listen((value) async {
      _selectedOptions =
          await sharedPreferencesService.getStringList('produitsSelected');
      setState(() {});
    });
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
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          body: Container(
            height: Helper.getScreenHeight(context),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Helper.getAssetName("pharma.png", "icons"),
                          width: 35,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Bonjour ",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                        Text(
                          user?.fullname ?? "",
                          style: Helper.getTheme(context)
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " !",
                          style: Helper.getTheme(context)
                              .headlineSmall
                              ?.copyWith(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(MenuScreen.routeName);
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text("Circonscription actuelle"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SelectCirconscriptionBloc(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      SearchBarGroup(),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: _selectedOptions.isEmpty
                          ? Text(
                              "Saisissez le médicament que vous recherchez\n ou appuyer sur @ pour scanner votre ordonnance ou le code barre du medicament",
                              textAlign: TextAlign.center,
                              style: TextStyle(height: 1.5),
                            )
                          : Container(
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: _selectedOptions.map((text) {
                                        ProduitModel produitTrouve =
                                            _produits.firstWhere((produit) =>
                                                produit.name == text);
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
                                                  removeInselectedOptionsID(
                                                      text);
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
                                  SizedBox(
                                    height: 25,
                                  ),
                                  _selectedOptions.length > 2
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                _selectedOptions = [];
                                                await sharedPreferencesService
                                                    .setStringList(
                                                        'produitsSelected', []);
                                                setState(() {});
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 7),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete_forever,
                                                      size: 24,
                                                      color:
                                                          Colors.red.shade400,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Vider",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .red.shade400),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Helper.getScreenHeight(context) * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(SearchPage.routeName);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColor.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Rechercher ${_selectedOptions.length} médicament(s)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
    ;
  }
}
