import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/provider/ProduitProvider.dart';
import 'package:yebhofon/widgets/SuggestionItemCard.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static const routeName = "/SearchBar";

  @override
  State<SearchBar> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  late TextEditingController _textFieldController = new TextEditingController();
  late List<ProduitModel> _produits = [];
  late AutoCompleteTextField<String> _textField;
  late List<String> _selectedOptions = [];
  late List<String> _selectedOptionsID = [];
  late List<String> _nomsProduits = [];

  Future<void> getData() async {
    ProduitProvider.all({}).then((datas) {
      setState(() {
        _produits = datas;
        _nomsProduits = _produits.map((produit) => produit.name).toList();
        _textField.updateSuggestions(_nomsProduits);
      });
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedOptions = prefs.getStringList('produitsSelected')!;
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
    await prefs.setStringList('produitsSelected', _selectedOptions);
    await prefs.setStringList('produitsIDSelected', _selectedOptionsID);
  }

  void removeInselectedOptionsID(String text) async {
    _selectedOptions.remove(text);
    selectedOptionsID();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: AppColor.secondary, width: 2)),
          child: GestureDetector(
            child: Icon(
              Icons.file_open_rounded,
              size: 20,
            ),
            onTap: () {
              this.getScanList();
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: AppColor.secondary, width: 2)),
          child: GestureDetector(
            child: Icon(
              Icons.barcode_reader,
              size: 20,
            ),
            onTap: () {
              this.getCodeBar();
            },
          ),
        )
      ],
    );
  }
}
