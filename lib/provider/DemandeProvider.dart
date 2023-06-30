import 'package:flutter/material.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/LigneDemandeModel.dart';
import 'package:ipi/models/ResponseModel.dart';
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

  static Future<ResponseModel> createDemande(
      Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(DemandeSchema.CREATE_DEMANDE, variables);
    bool ok = datas["createDemande"]["ok"];
    if (ok) {
      DemandeModel demande =
          DemandeModel.fromJson(datas["createDemande"]["demande"]);
      response = ResponseModel(field: "", message: "", ok: true, data: demande);
    } else {
      response = ResponseModel(
          field: datas["createDemande"]["errors"][0]["field"],
          message: datas["createDemande"]["errors"][0]["message"],
          ok: false,
          data: new DemandeModel());
    }
    return response;
  }

  static Future<ResponseModel> createLigneDemande(
      Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(DemandeSchema.CREATE_LIGNE_DEMANDE, variables);
    bool ok = datas["createLigneDemande"]["ok"];
    if (ok) {
      LigneDemandeModel ligne = LigneDemandeModel.fromJson(
          datas["createLigneDemande"]["lignedemande"]);
      response = ResponseModel(field: "", message: "", ok: true, data: ligne);
    } else {
      response = ResponseModel(
          field: datas["createLigneDemande"]["errors"][0]["field"],
          message: datas["createLigneDemande"]["errors"][0]["message"],
          ok: false,
          data: new LigneDemandeModel());
    }
    return response;
  }

  static Future<List<DemandeModel>> lignesDemande(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(DemandeSchema.LIGNE_DEMANDE, variables);
    return datas["searchLigneDemande"];
  }
}
