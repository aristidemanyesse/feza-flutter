import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/models/coreApp/ResponseModel.dart';
import 'package:ipi/models/demandeApp/LigneDemande.dart';
import 'package:ipi/models/demandeApp/LigneReponse.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:ipi/models/demandeApp/RdvLigneReponse.dart';
import 'package:ipi/models/demandeApp/Reponse.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/DemandeSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
import 'package:ipi/widgets/pleaseWait.dart';
part 'Demande.freezed.dart';
part 'Demande.g.dart';

@freezed
class Demande with _$Demande {
  const Demande._();

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
    @Default(0) int news,
    @Default(false) bool propagating,
    @Default(false) bool isFinished,
    @Default(false) bool isSatisfied,
    @Default([]) List<LigneDemande> demandeLignes,
    @Default([]) List<OfficineDemande> demandeOfficine,
    Utilisateur? utilisateur,
  }) = _Demande;

  factory Demande.fromJson(Map<String, Object?> json) =>
      _$DemandeFromJson(json);

  int totalDemandesOfficines() {
    return demandeOfficine.length;
  }

  List<OfficineDemande> demandesOfficinesAnswered() {
    List<OfficineDemande> total = [];
    for (OfficineDemande item in demandeOfficine) {
      if (item.demandeReponse.length > 0) {
        total.add(item);
      }
    }
    return total;
  }

  List<Reponse> reponsesOfficines() {
    List<Reponse> total = [];
    for (OfficineDemande item in demandeOfficine) {
      total.addAll(item.demandeReponse);
    }
    return total;
  }

  List<RdvLigneReponse> ligneReponseWithRdv() {
    List<RdvLigneReponse> total = [];
    for (Reponse item in this.reponsesOfficines()) {
      for (LigneReponse elem in item.reponseLignes) {
        total.addAll(elem.rdvLigne);
      }
    }
    return total;
  }

  void deleteDemande() async {
    Get.dialog(PleaseWait());
    ResponseModel response = await Demande.update({
      "id": this.id,
      "utilisateur": this.utilisateur?.id,
      "status": this.isFinished,
      "deleted": true,
    });
    if (response.ok) {
      DemandeController demandeController = Get.find();
      demandeController.onInit();
      Get.back();
    }
  }

  void satisfiedDemande() async {
    ResponseModel response = await Demande.update({
      "id": this.id,
      "utilisateur": this.utilisateur?.id,
      "status": this.isFinished,
      "isSatisfied": true,
    });
    if (response.ok) {
      DemandeController demandeController = Get.find();
      demandeController.onInit();
    }
  }

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
    demandeLignes{
      ...LigneDemandeFragment
    }
    demandeOfficine{
      ...OfficineDemandeFragment
    }
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
