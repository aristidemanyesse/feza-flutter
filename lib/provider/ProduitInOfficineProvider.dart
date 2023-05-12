import 'package:flutter/material.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/schemas/ProduitInOfficineSchema.dart';
import 'package:yebhofon/schemas/ProduitSchema.dart';
import 'package:yebhofon/webservice/apiservice.dart';

class ProduitInOfficineProvider extends ChangeNotifier {
  late List<ProduitModel> produits;

  static Future<List<ProduitModel>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(ProduitSchema.ALL, variables);
    dynamic list = datas["searchProduit"]["results"];
    List<ProduitModel> produits = [];
    for (var jsonTask in list) {
      ProduitModel item = ProduitModel.fromJson(jsonTask);
      produits.add(item);
    }
    return produits;
  }

  static Future<List<dynamic>> searchProduitsAvialableInOfficine(
      Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(
        ProduitInOfficineSchema.SEARCH_PRODUITS_AVIALABLE_IN_OFFICINE,
        variables);
    return datas["searchProduitsAvialableInOfficine"];
  }

  Future<void> one(String userid) async {
    Map<String, dynamic> variables = {};
    Map<String, dynamic>? produits;
    produits = await ApiService.request(ProduitSchema.ALL, variables);
    notifyListeners();
  }
}
