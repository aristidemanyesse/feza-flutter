import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/coreApp/ResponseModel.dart';
import 'package:ipi/models/demandeApp/LigneDemande.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/DemandeSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'Demande.freezed.dart';
part 'Demande.g.dart';

@freezed
class Demande with _$Demande {
  const factory Demande({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(false) bool status,
    @Default("") String ordonnance,
    @Default("") String base64,
    @Default("") String commentaire,
    @Default(0.0) double lat,
    @Default(0.0) double lon,
    @Default(false) bool propagating,
    @Default(false) bool isFinished,
    @Default(false) bool isSatisfied,
    Utilisateur? utilisateur,
  }) = _Demande;

  factory Demande.fromJson(Map<String, Object?> json) =>
      _$DemandeFromJson(json);

  static const String DemandeFragment = """
  fragment DemandeFragment on DemandeGenericType {
    id
    createdAt
    updateAt
    deleted
    status
    ordonnance
    base64
    commentaire
    lat
    lon
    propagating
    isFinished
    isSatisfied
    utilisateur{
      ...UtilisateurFragment
    }
  }
  """;

  static Future<List<Demande>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(DemandeSchema.ALL, variables);
    dynamic list = datas["searchDemande"]["results"];
    List<Demande> officines = [];
    for (var jsonTask in list) {
      Demande item = Demande.fromJson(jsonTask);
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
      Demande demande = Demande.fromJson(datas["createDemande"]["demande"]);
      response = ResponseModel(field: "", message: "", ok: true, data: demande);
    } else {
      response = ResponseModel(
          field: datas["createDemande"]["errors"][0]["field"],
          message: datas["createDemande"]["errors"][0]["message"],
          ok: false,
          data: new Demande());
    }
    return response;
  }

  static Future<ResponseModel> update(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(DemandeSchema.UPDATE_DEMANDE, variables);
    bool ok = datas["updateDemande"]["ok"];
    if (ok) {
      Demande user = Demande.fromJson(datas["updateDemande"]["demande"]);
      response = ResponseModel(field: "", message: "", ok: true, data: user);
    } else {
      response = ResponseModel(
          field: datas["updateDemande"]["errors"][0]["field"],
          message: datas["updateDemande"]["errors"][0]["message"],
          ok: false,
          data: new Demande());
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
      LigneDemande ligne =
          LigneDemande.fromJson(datas["createLigneDemande"]["lignedemande"]);
      response = ResponseModel(field: "", message: "", ok: true, data: ligne);
    } else {
      response = ResponseModel(
          field: datas["createLigneDemande"]["errors"][0]["field"],
          message: datas["createLigneDemande"]["errors"][0]["message"],
          ok: false,
          data: new LigneDemande());
    }
    return response;
  }

  static Future<List<LigneDemande>> allLignesDemande(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(DemandeSchema.LIGNE_DEMANDE, variables);
    dynamic list = datas["searchLigneDemande"]["results"];
    List<LigneDemande> lignes = [];
    for (var jsonTask in list) {
      LigneDemande item = LigneDemande.fromJson(jsonTask);
      lignes.add(item);
    }
    return lignes;
  }

  static Future<ResponseModel> createOfficineDemande(
      Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas = await ApiService.request(
        DemandeSchema.CREATE_OFFICINE_DEMANDE, variables);
    bool ok = datas["createOfficineDemande"]["ok"];
    if (ok) {
      OfficineDemande officine = OfficineDemande.fromJson(
          datas["createOfficineDemande"]["officinedemande"]);
      response =
          ResponseModel(field: "", message: "", ok: true, data: officine);
    } else {
      response = ResponseModel(
          field: datas["createOfficineDemande"]["errors"][0]["field"],
          message: datas["createOfficineDemande"]["errors"][0]["message"],
          ok: false,
          data: new OfficineDemande());
    }
    return response;
  }

  static Future<List<OfficineDemande>> allOfficinesDemande(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(DemandeSchema.OFFICINE_DEMANDE, variables);
    dynamic list = datas["searchOfficineDemande"]["results"];
    List<OfficineDemande> officines = [];
    for (var jsonTask in list) {
      OfficineDemande item = OfficineDemande.fromJson(jsonTask);
      officines.add(item);
    }
    return officines;
  }
}
