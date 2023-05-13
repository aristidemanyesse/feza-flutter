import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/models/UtilisateurModel.dart';
import 'package:yebhofon/provider/ProduitProvider.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/screens/searchPage.dart';
import 'package:yebhofon/widgets/SuggestionItemCard.dart';
import 'package:yebhofon/widgets/ligneProduitAvialable.dart';
import 'package:yebhofon/widgets/searchBar.dart';
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
  UtilisateurModel? user;
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

  Future<String> getCodeBar() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.DEFAULT);
    print("----------------- $barcodeScanRes");
    return barcodeScanRes;
  }

  Future<String> getScanList() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.DEFAULT);
    print("----------------- $barcodeScanRes");
    return barcodeScanRes;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _textField,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: AppColor.secondary, width: 2)),
                      child: GestureDetector(
                        child: Icon(
                          Icons.file_open_rounded,
                          size: 23,
                        ),
                        onTap: () {
                          this.getScanList();
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: AppColor.secondary, width: 2)),
                      child: GestureDetector(
                        child: Icon(
                          Icons.barcode_reader,
                          size: 23,
                        ),
                        onTap: () {
                          this.getCodeBar();
                        },
                      ),
                    )
                  ],
                ),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: widget.initialProduits.map((item) {
                        return LigneSearched(title: item.name);
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
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
                          Icon(Icons.search, size: 17, color: AppColor.blue),
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
              ],
            ),
          ),
        ));
  }
}
