import 'package:flutter/material.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/schemas/UtilisateurSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

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

  static Future<ResponseModel> create(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(UtilisateurSchema.CREATE, variables);
    bool ok = datas["createUtilisateur"]["ok"];
    if (ok) {
      UtilisateurModel user =
          UtilisateurModel.fromJson(datas["createUtilisateur"]["utilisateur"]);
      response = ResponseModel(field: "", message: "", ok: true, data: user);
    } else {
      response = ResponseModel(
          field: datas["createUtilisateur"]["errors"][0]["field"],
          message: datas["createUtilisateur"]["errors"][0]["message"],
          ok: false,
          data: new UtilisateurModel());
    }
    return response;
  }

  static Future<ResponseModel> update(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(UtilisateurSchema.UPDATE, variables);
    bool ok = datas["updateUtilisateur"]["ok"];
    if (ok) {
      UtilisateurModel user =
          UtilisateurModel.fromJson(datas["updateUtilisateur"]["utilisateur"]);
      response = ResponseModel(field: "", message: "", ok: true, data: user);
    } else {
      response = ResponseModel(
          field: datas["updateUtilisateur"]["errors"][0]["field"],
          message: datas["updateUtilisateur"]["errors"][0]["message"],
          ok: false,
          data: new UtilisateurModel());
    }
    return response;
  }

  static Future<String> getUniqID() async {
    if (Platform.isIOS) {
      final udid =
          await const MethodChannel('plugins.flutter.io/unique_identifier')
              .invokeMethod<String>('getIdentifier');
      return udid ?? '';
    } else {
      var androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      String _androidId = androidDeviceInfo.androidId;
      return _androidId;
    }
  }
}
