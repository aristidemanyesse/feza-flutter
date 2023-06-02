import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/menuScreen.dart';
import 'package:ipi/screens/searchPage.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';
import 'package:ipi/widgets/confirmExitDialog.dart';
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
    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
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
                            Navigator.of(context).pushNamed(
                                MenuScreen.routeName,
                                arguments: {"user": user});
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
                    height: 40,
                  ),
                  Center(
                    child: SearchBarGroup(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Center(
                      child: Container(
                        height: Helper.getScreenHeight(context) * 0.45,
                        margin: EdgeInsets.all(10),
                        child: _selectedOptions.isEmpty
                            ? Text(
                                "Saisissez le médicament que vous recherchez\n ou appuyer sur @ pour scanner votre ordonnance ou le code barre du medicament",
                                textAlign: TextAlign.center,
                                style: TextStyle(height: 1.5),
                              )
                            : Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            Helper.getScreenHeight(context) *
                                                0.45,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children:
                                                _selectedOptions.map((text) {
                                              ProduitModel? produitTrouve;
                                              if (_produits.isNotEmpty) {
                                                produitTrouve = _produits
                                                    .firstWhere((produit) =>
                                                        produit.name == text);
                                              }

                                              return Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: SuggestionItemCard(
                                                            produit: produitTrouve ??
                                                                ProduitModel(
                                                                    name: "",
                                                                    description:
                                                                        "",
                                                                    image: "",
                                                                    codebarre:
                                                                        ""))),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        removeInselectedOptionsID(
                                                            text);
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .delete_forever_outlined,
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
                                                            'produitsSelected',
                                                            []);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 7),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.delete_forever,
                                                          size: 22,
                                                          color: Colors
                                                              .red.shade400,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "Vider",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors.red
                                                                  .shade400),
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
                                ],
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _selectedOptions.length > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(SearchPage.routeName);
                              },
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
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
        onWillPop: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmExitDialog();
            },
          );
          return Future.value(false);
        });
  }
}
