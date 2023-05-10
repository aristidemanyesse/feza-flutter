import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:yebhofon/models/CirconscriptionModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/provider/CirconscriptionProvider.dart';
import 'package:yebhofon/provider/ProduitProvider.dart';
import 'package:yebhofon/screens/menuScreen.dart';
import 'package:yebhofon/screens/searchPage.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:yebhofon/widgets/SuggestionItemCard.dart';
import 'package:yebhofon/widgets/searchedMedicamentListDialog.dart';
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

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  late TextEditingController _textFieldController = new TextEditingController();
  late List<ProduitModel> _produits = [];
  late List<CirconscriptionModel> _circonscriptions = [];
  late AutoCompleteTextField<String> _textField;
  late List<String> _selectedOptions = [];
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
        });
      },
    );

    getData();
  }

  Future<void> getData() async {
    ProduitProvider.all({}).then((datas) {
      setState(() {
        _produits = datas;
        _nomsProduits = _produits.map((produit) => produit.name).toList();
        _textField.updateSuggestions(_nomsProduits);
      });
    });

    CirconscriptionProvider.all({}).then((datas) {
      setState(() {
        _circonscriptions = datas;
      });
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
                          "Shadrak !",
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: SizedBox(
                            width: 150,
                            child: DropdownButton(
                              value: "Port-Bouet",
                              items: _circonscriptions.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item.name),
                                  value: item.id,
                                );
                              }).toList(),
                              icon: Image.asset(
                                Helper.getAssetName(
                                    "dropdown_filled.png", "virtual"),
                              ),
                              style: Helper.getTheme(context).headlineMedium,
                              onChanged: (value) {
                                print(value);
                              },
                            ),
                          ),
                        ),
                      ),
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
          Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    Key? key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: _image,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context)
                      .headlineMedium
                      ?.copyWith(color: AppColor.primary),
                ),
                Row(
                  children: [
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Western Food"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.blue,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('(124) Ratings')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class LastSearchItem extends StatelessWidget {
  const LastSearchItem({
    Key? key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 60,
              height: 50,
              child: _image,
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _name,
                style: Helper.getTheme(context)
                    .labelMedium
                    ?.copyWith(color: AppColor.primary),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text("Cafe"),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: AppColor.blue,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Western Food"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({
    Key? key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 300,
            height: 200,
            child: _image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headlineMedium
              ?.copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
            Text("Cafe"),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColor.blue,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Western Food"),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              Helper.getAssetName("star_filled.png", "virtual"),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "4.9",
              style: TextStyle(
                color: AppColor.blue,
              ),
            )
          ],
        )
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required String name,
    required Image image,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _name,
                      style: Helper.getTheme(context).displaySmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.blue,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("(124 ratings)"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Western Food"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required Image image,
    required String name,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headlineMedium
              ?.copyWith(color: AppColor.primary, fontSize: 16),
        ),
      ],
    );
  }
}
