import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/SuggestionItemCard.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/models/ProduitModel.dart';

class SearchBarGroup extends StatefulWidget {
  late bool scan = true;
  late bool camera = true;
  SearchBarGroup({Key? key, scan, camera}) : super(key: key);

  @override
  State<SearchBarGroup> createState() => SearchBarGroupState();
}

class SearchBarGroupState extends State<SearchBarGroup> {
  ProduitController controller = Get.find();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  late TextEditingController _textFieldController = new TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> nomsProduits = [];
  List<ProduitModel> produits = [];
  @override
  void initState() {
    nomsProduits = controller.nomsProduits;
    produits = controller.produits;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextField(
      autofocus: true,
      suggestionsAmount: 7,
      key: key,
      focusNode: _focusNode,
      controller: _textFieldController,
      itemBuilder: (context, item) {
        ProduitModel produitTrouve =
            produits.firstWhere((produit) => produit.name == item);
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
      suggestions: nomsProduits,
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
      itemSubmitted: (value) async {
        ProduitModel produitTrouve =
            produits.firstWhere((produit) => produit.name == value);
        controller.addProduitSelected(produitTrouve);
        FocusScope.of(context).requestFocus(_focusNode);
      },
    );
  }
}
