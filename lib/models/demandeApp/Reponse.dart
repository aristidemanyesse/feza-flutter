import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/demandeApp/LigneReponse.dart';
import 'package:ipi/models/demandeApp/RdvLigneReponse.dart';
import 'package:ipi/models/demandeApp/SubsLigneReponse.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/ReponseSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
import 'package:ipi/models/coreApp/ResponseModel.dart';
part 'Reponse.freezed.dart';
part 'Reponse.g.dart';

@freezed
class Reponse with _$Reponse {
  const Reponse._();

  const factory Reponse({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(false) bool read,
    @Default(0) int price,
    @Default("") String commentaire,
    @Default([]) List<LigneReponse> reponseLignes,
  }) = _Reponse;

  factory Reponse.fromJson(Map<String, Object?> json) =>
      _$ReponseFromJson(json);

  void updateReponse() async {
    await Reponse.update({
      "id": this.id,
      "read": true,
    });
  }

  static const String ReponseFragment = """
  fragment ReponseFragment on ReponseGenericType {
    id
    createdAt
    updateAt
    deleted
    read
    price
    commentaire
    reponseLignes{
      ...LigneReponseFragment
    }
  }
  """;

  static Future<List<Reponse>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(ReponseSchema.ALL, variables);
    dynamic list = datas["searchReponse"]["results"];
    List<Reponse> reponses = [];
    for (var jsonTask in list) {
      Reponse item = Reponse.fromJson(jsonTask);
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
      Reponse reponse = Reponse.fromJson(datas["updateReponse"]["reponse"]);
      response = ResponseModel(field: "", message: "", ok: true, data: reponse);
    } else {
      response = ResponseModel(
          field: datas["updateReponse"]["errors"][0]["field"],
          message: datas["updateReponse"]["errors"][0]["message"],
          ok: false,
          data: new Reponse());
    }
    return response;
  }

  static Future<List<LigneReponse>> allLignesReponse(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(ReponseSchema.LIGNE_REPONSE, variables);
    dynamic list = datas["searchLigneReponse"]["results"];
    List<LigneReponse> lignes = [];
    for (var jsonTask in list) {
      LigneReponse item = LigneReponse.fromJson(jsonTask);
      lignes.add(item);
    }
    return lignes;
  }

  static Future<List<SubsLigneReponse>> subsLigneReponse(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(ReponseSchema.SUBS_LIGNE_REPONSE, variables);
    dynamic list = datas["searchSubsLigneReponse"]["results"];
    List<SubsLigneReponse> lignes = [];
    for (var jsonTask in list) {
      SubsLigneReponse item = SubsLigneReponse.fromJson(jsonTask);
      lignes.add(item);
    }
    return lignes;
  }

  static Future<List<RdvLigneReponse>> rdvLigneReponse(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(ReponseSchema.RDV_LIGNE_REPONSE, variables);
    dynamic list = datas["searchRdvLigneReponse"]["results"];
    List<RdvLigneReponse> rdv = [];
    for (var jsonTask in list) {
      RdvLigneReponse item = RdvLigneReponse.fromJson(jsonTask);
      rdv.add(item);
    }
    return rdv;
  }
}
