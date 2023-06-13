import 'dart:async';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/ChooseMLMethod.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';
import 'package:ipi/widgets/testPage.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';

class SearchBarGroup extends StatefulWidget {
  static const routeName = "/SearchBarGroup";
  SearchBarGroup({Key? key}) : super(key: key);

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

  TextRecognition? _textRecognition = TextRecognition();

  Future<void> getData() async {
    _produits = await ProduitProvider.all({});
    _nomsProduits = _produits.map((produit) => produit.name).toList();
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
        "#ff6666", "Annuler", true, ScanMode.BARCODE);
    var datas = await ProduitProvider.all({"codebarre": barcodeScanRes});
    _selectedOptions.add(datas[0].name);
    await sharedPreferencesService.setStringList(
        'produitsSelected', _selectedOptions);
  }

  void getScanList() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChooseMLMethod();
      },
    );
    Navigator.of(context).pushNamed(TextRecognizerView.routeName);
  }

  @override
  void dispose() {
    _textRecognition?.dispose();
    _sharedPreferencesSubscription.cancel(); // Arrêter le StreamSubscription
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();

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
        hintText: "Rechercher médicament...",
        hintStyle: TextStyle(
          color: AppColor.placeholder,
          fontSize: 14,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColor.blue,
        ),
        suffix: Container(
          margin: EdgeInsets.only(right: 15, top: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.barcode_reader,
                  size: 22,
                  color: Colors.blue.shade400,
                ),
                onTap: () {
                  this.getCodeBar();
                },
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                child: Icon(
                  Icons.file_open_rounded,
                  size: 22,
                  color: Colors.blue.shade400,
                ),
                onTap: () {
                  this.getScanList();
                },
              ),
            ],
          ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: _textField,
        ),
        SizedBox(
          width: 10,
        ),
        // Container(
        //   margin: EdgeInsets.only(right: 10),
        //   padding: EdgeInsets.all(5),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(15)),
        //       border: Border.all(color: AppColor.secondary, width: 2)),
        //   child: GestureDetector(
        //     child: Icon(
        //       Icons.file_open_rounded,
        //       size: 20,
        //     ),
        //     onTap: () {
        //       this.getScanList();
        //     },
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.all(5),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(15)),
        //       border: Border.all(color: AppColor.secondary, width: 2)),
        //   child: GestureDetector(
        //     child: Icon(
        //       Icons.barcode_reader,
        //       size: 20,
        //     ),
        //     onTap: () {
        //       this.getCodeBar();
        //     },
        //   ),
        // ),
      ],
    );
  }
}
