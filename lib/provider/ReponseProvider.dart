import 'package:flutter/material.dart';
import 'package:ipi/models/LigneReponseModel.dart';
import 'package:ipi/models/RdvLigneReponseModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/models/SubsLigneReponseModel.dart';
import 'package:ipi/schemas/ReponseSchema.dart';
import 'package:ipi/webservice/apiservice.dart';

class ReponseProvider extends ChangeNotifier {
  late List<ReponseModel> reponses;

  static Future<List<ReponseModel>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(ReponseSchema.ALL, variables);
    dynamic list = datas["searchReponse"]["results"];
    List<ReponseModel> reponses = [];
    for (var jsonTask in list) {
      ReponseModel item = ReponseModel.fromJson(jsonTask);
      reponses.add(item);
    }
    return reponses;
  }

  static Future<ResponseModel> update(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(ReponseSchema.UPDATE_REPONSE, variables);
    bool ok = datas["updateReponse"]["ok"];
    if (ok) {
      ReponseModel reponse =
          ReponseModel.fromJson(datas["updateReponse"]["reponse"]);
      response = ResponseModel(field: "", message: "", ok: true, data: reponse);
    } else {
      response = ResponseModel(
          field: datas["updateReponse"]["errors"][0]["field"],
          message: datas["updateReponse"]["errors"][0]["message"],
          ok: false,
          data: new ReponseModel());
    }
    return response;
  }

  static Future<List<LigneReponseModel>> allLignesReponse(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(ReponseSchema.LIGNE_REPONSE, variables);
    dynamic list = datas["searchLigneReponse"]["results"];
    List<LigneReponseModel> lignes = [];
    for (var jsonTask in list) {
      LigneReponseModel item = LigneReponseModel.fromJson(jsonTask);
      lignes.add(item);
    }
    return lignes;
  }

  static Future<List<SubsLigneReponseModel>> subsLigneReponse(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(ReponseSchema.SUBS_LIGNE_REPONSE, variables);
    dynamic list = datas["searchSubsLigneReponse"]["results"];
    List<SubsLigneReponseModel> lignes = [];
    for (var jsonTask in list) {
      SubsLigneReponseModel item = SubsLigneReponseModel.fromJson(jsonTask);
      lignes.add(item);
    }
    return lignes;
  }

  static Future<List<RdvLigneReponseModel>> rdvLigneReponse(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(ReponseSchema.RDV_LIGNE_REPONSE, variables);
    dynamic list = datas["searchRdvLigneReponse"]["results"];
    List<RdvLigneReponseModel> rdv = [];
    for (var jsonTask in list) {
      RdvLigneReponseModel item = RdvLigneReponseModel.fromJson(jsonTask);
      rdv.add(item);
    }
    return rdv;
  }
}
