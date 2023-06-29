import 'package:flutter/material.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/schemas/DemandeSchema.dart';
import 'package:ipi/webservice/apiservice.dart';

class DemandeProvider extends ChangeNotifier {
  late List<DemandeModel> officines;

  static Future<List<DemandeModel>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(DemandeSchema.ALL, variables);
    dynamic list = datas["searchDemande"]["results"];
    List<DemandeModel> officines = [];
    for (var jsonTask in list) {
      DemandeModel item = DemandeModel.fromJson(jsonTask);
      officines.add(item);
    }
    return officines;
  }

  static Future<List<DemandeModel>> lignes_demande(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(DemandeSchema.LIGNE_DEMANDE, variables);
    return datas["searchLigneDemande"];
  }
}
