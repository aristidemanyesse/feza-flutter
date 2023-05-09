import 'package:flutter/material.dart';
import 'package:yebhofon/model/UtilisateurModel.dart';
import 'package:yebhofon/schemas/UtilisateurSchema.dart';
import 'package:yebhofon/webservice/apiservice.dart';

class UtilisateurProvider extends ChangeNotifier {
  UtilisateurModel utilisateurs = UtilisateurModel();

  static Future<List<UtilisateurModel>> all(
      Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(UtilisateurSchema.ALL, variables);
    dynamic list = datas["searchUtilisateur"]["results"];
    List<UtilisateurModel> utilisateurs = [];
    for (var jsonTask in list) {
      UtilisateurModel item = UtilisateurModel.fromJson(jsonTask);
      utilisateurs.add(item);
    }
    return utilisateurs;
  }

  Future<void> one(String userid) async {
    Map<String, dynamic> variables = {};
    Map<String, dynamic>? utilisateurs;
    utilisateurs = await ApiService.request(UtilisateurSchema.ALL, variables);
    notifyListeners();
  }
}
