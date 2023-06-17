import 'dart:async';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/provider/ProduitProvider.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';
import 'package:ipi/widgets/painters.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

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

  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

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
        "#ff6666", "Annuler", false, ScanMode.BARCODE);
    var datas = await ProduitProvider.all({"codebarre": barcodeScanRes});
    _selectedOptions.add(datas[0].name);
    await sharedPreferencesService.setStringList(
        'produitsSelected', _selectedOptions);
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

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(recognizedText,
          inputImage.metadata!.size, inputImage.metadata!.rotation);
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Recognized text:\n\n${recognizedText.text}';
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
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
        //       // this.getScanList();
        //       showDialog(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return ChooseMLMethod(
        //             title: 'Text Detector',
        //             customPaint: _customPaint,
        //             text: _text,
        //             onImage: (inputImage) {
        //               processImage(inputImage);
        //             },
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(color: AppColor.secondary, width: 2)),
          child: GestureDetector(
            child: Icon(
              Icons.barcode_reader,
              size: 26,
            ),
            onTap: () {
              this.getCodeBar();
            },
          ),
        ),
      ],
    );
  }
}
