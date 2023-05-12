import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yebhofon/models/CirconscriptionModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/models/ResponseModel.dart';
import 'package:yebhofon/models/UtilisateurModel.dart';
import 'package:yebhofon/provider/CirconscriptionProvider.dart';
import 'package:yebhofon/provider/ProduitProvider.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/screens/menuScreen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:yebhofon/screens/searchPage.dart';
import 'package:yebhofon/widgets/SuggestionItemCard.dart';
import 'package:yebhofon/widgets/circonscriptionChoicesDialog.dart';
import 'package:yebhofon/widgets/selectCirconscriptionBloc.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool home = true;
  UtilisateurModel? user;
  late String? circonscriptionActuelle;

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  late TextEditingController _textFieldController = new TextEditingController();
  late List<ProduitModel> _produits = [];
  late AutoCompleteTextField<String> _textField;
  late List<String> _selectedOptions = [];
  late List<String> _selectedOptionsID = [];
  late List<String> _nomsProduits = [];

  @override
  void initState() {
    super.initState();
    _textField = AutoCompleteTextField(
      key: key,
      controller: _textFieldController,
      itemBuilder: (context, item) {
        ProduitModel produitTrouve =
            _produits.firstWhere((produit) => produit.name == item);
        return SuggestionItemCard(produit: produitTrouve);
      },
      itemFilter: (suggestion, query) {
        return suggestion.toLowerCase().contains(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      keyboardType: TextInputType.name,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      suggestions: _nomsProduits,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: AppColor.blue, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: AppColor.secondary, width: 1.0),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColor.blue,
        ),
        hintText: "Rechercher médicament...",
        hintStyle: TextStyle(
          color: AppColor.placeholder,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.only(
          top: 10,
        ),
      ),
      itemSubmitted: (selectedOption) {
        setState(() {
          _selectedOptions.add(selectedOption);
          selectedOptionsID();
        });
      },
    );
    getData();
  }

  void selectedOptionsID() async {
    _selectedOptionsID = [];
    for (var text in _selectedOptions) {
      ProduitModel produitTrouve =
          _produits.firstWhere((produit) => produit.name == text);
      _selectedOptionsID.add(produitTrouve.id!);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('produits', _selectedOptionsID);
  }

  Future<void> getData() async {
    ProduitProvider.all({}).then((datas) {
      setState(() {
        _produits = datas;
        _nomsProduits = _produits.map((produit) => produit.name).toList();
        _textField.updateSuggestions(_nomsProduits);
      });
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    setState(() {
      user = users[0];
    });
  }

  Future<String> getCodeBar(context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.DEFAULT);
    debugPrint("----------------- $barcodeScanRes");
    Navigator.of(context).pushNamed(SearchPage.routeName);
    return barcodeScanRes;
  }

  Future<String> getScanList(context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.DEFAULT);
    debugPrint("----------------- $barcodeScanRes");
    Navigator.of(context).pushNamed(SearchPage.routeName);
    return barcodeScanRes;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Stack(children: [
          Container(
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
                          Navigator.of(context)
                              .pushReplacementNamed(MenuScreen.routeName);
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
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: _textField),
                          ),
                          SizedBox(height: 16),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                    color: AppColor.secondary, width: 2)),
                            child: GestureDetector(
                              child: Icon(Icons.file_open_rounded),
                              onTap: () {
                                this.getScanList(context);
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                    color: AppColor.secondary, width: 2)),
                            child: GestureDetector(
                              child: Icon(Icons.barcode_reader),
                              onTap: () {
                                this.getCodeBar(context);
                              },
                            ),
                          )
                        ],
                      ),
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
                    child: _selectedOptions.length == 0
                        ? Text(
                            "Saisissez le médicament que vous recherchez\n ou appuyer sur @ pour scanner votre ordonnance ou le code barre du medicament",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.5),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: _selectedOptions.map((text) {
                                ProduitModel produitTrouve =
                                    _produits.firstWhere(
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
                                          setState(() {
                                            _selectedOptions.remove(text);
                                            selectedOptionsID();
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                  )),
                ),
                SizedBox(
                  height: Helper.getScreenHeight(context) * 0.05,
                )
              ],
            ),
          ),
          (_selectedOptions.length > 0)
              ? Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(SearchPage.routeName);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
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
                                "Rechercher",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
              : Container()
        ]),
      ),
    );
  }
}
