import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/coreApp/ResponseModel.dart';
import 'package:ipi/models/officineApp/Circonscription.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/UtilisateurSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'Utilisateur.freezed.dart';
part 'Utilisateur.g.dart';

@freezed
class Utilisateur with _$Utilisateur {
  const factory Utilisateur({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String fullname,
    @Default("") String contact,
    @Default("") String otp,
    @Default("") String imei,
    @Default(false) bool isValide,
    @Default("") String geometryJson,
    @Default("") String image,
    Circonscription? circonscription,
  }) = _Utilisateur;

  factory Utilisateur.fromJson(Map<String, Object?> json) =>
      _$UtilisateurFromJson(json);

  static const String UtilisateurFragment = """
  fragment UtilisateurFragment on UtilisateurGenericType {
    id
    fullname
    contact
    imei
    createdAt
    image
    isValide
    otp
    geometryJson
    circonscription {
      ...CirconscriptionFragment
    }
  }
  """;

  static Future<List<Utilisateur>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(UtilisateurSchema.ALL, variables);
    List<Utilisateur> items = [];
    for (var jsonTask in datas["searchUtilisateur"]["results"]) {
      items.add(Utilisateur.fromJson(jsonTask));
    }
    return items;
  }

  static Future<ResponseModel> create(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(UtilisateurSchema.CREATE, variables);
    bool ok = datas["createUtilisateur"]["ok"];
    if (ok) {
      Utilisateur user =
          Utilisateur.fromJson(datas["createUtilisateur"]["utilisateur"]);
      response = ResponseModel(field: "", message: "", ok: true, data: user);
    } else {
      response = ResponseModel(
          field: datas["createUtilisateur"]["errors"][0]["field"],
          message: datas["createUtilisateur"]["errors"][0]["message"],
          ok: false,
          data: new Utilisateur());
    }
    return response;
  }

  static Future<ResponseModel> update(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(UtilisateurSchema.UPDATE, variables);
    bool ok = datas["updateUtilisateur"]["ok"];
    if (ok) {
      Utilisateur user =
          Utilisateur.fromJson(datas["updateUtilisateur"]["utilisateur"]);
      response = ResponseModel(field: "", message: "", ok: true, data: user);
    } else {
      response = ResponseModel(
          field: datas["updateUtilisateur"]["errors"][0]["field"],
          message: datas["updateUtilisateur"]["errors"][0]["message"],
          ok: false,
          data: new Utilisateur());
    }
    return response;
  }
}
