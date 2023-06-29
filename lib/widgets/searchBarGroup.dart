import 'dart:async';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';

class SearchBarGroup extends StatefulWidget {
  static const routeName = "/SearchBarGroup";
  late bool scan = true;
  late bool camera = true;
  SearchBarGroup({Key? key, scan, camera}) : super(key: key);

  @override
  State<SearchBarGroup> createState() => SearchBarGroupState();
}

class SearchBarGroupState extends State<SearchBarGroup> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  late TextEditingController _textFieldController = new TextEditingController();
  late List<ProduitModel> _produits = [];
  late AutoCompleteTextField<String> _textField;
  late List<String> _selectedOptions = [];
  late List<String> _selectedOptionsID = [];
  late List<String> _nomsProduits = [];

  late StreamSubscription<String> _sharedPreferencesSubscription;
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  Future<void> getData() async {
    await sharedPreferencesService.init();
    _produits = await sharedPreferencesService.getProduitList('produits');
    _nomsProduits =
        await sharedPreferencesService.getStringList('nomsProduits');
    // _produits = await ProduitProvider.all({});
    // _nomsProduits = _produits.map((produit) => produit.name).toList();
    _textField.updateSuggestions(_nomsProduits);

    await sharedPreferencesService.init();
    _selectedOptions =
        await sharedPreferencesService.getStringList('produitsSelected');
    _sharedPreferencesSubscription = sharedPreferencesService
        .watchString('produitsSelected')
        .listen((value) {
      selectedOptionsID();
    });
  }

  Future<void> getCodeBar() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.BARCODE);
    var datas = await ProduitProvider.all({"codebarre": barcodeScanRes});
    _selectedOptions.add(datas[0].name);
    await sharedPreferencesService.setStringList(
        'produitsSelected', _selectedOptions);
  }

  @override
  void dispose() {
    _sharedPreferencesSubscription.cancel(); // Arrêter le StreamSubscription
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();

    _textField = AutoCompleteTextField(
      suggestionsAmount: 7,
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
        hintText: "Rechercher médicament...",
        hintStyle: TextStyle(
          color: AppColor.placeholder,
          fontSize: 14,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColor.blue,
        ),
        contentPadding: const EdgeInsets.only(
          top: 13,
        ),
      ),
      itemSubmitted: (selectedOption) async {
        _selectedOptions.add(selectedOption);
        await sharedPreferencesService.setStringList(
            'produitsSelected', _selectedOptions);
      },
    );
  }

  void selectedOptionsID() async {
    _selectedOptionsID = [];
    _selectedOptions =
        await sharedPreferencesService.getStringList('produitsSelected');
    for (var text in _selectedOptions) {
      ProduitModel produitTrouve =
          _produits.firstWhere((produit) => produit.name == text);
      _selectedOptionsID.add(produitTrouve.id!);
    }
    await sharedPreferencesService.setStringList(
        'produitsIDSelected', _selectedOptionsID);
  }

  @override
  Widget build(BuildContext context) {
    return _textField;
  }
}
