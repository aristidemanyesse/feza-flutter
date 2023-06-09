import 'package:flutter/material.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/schemas/OfficineSchema.dart';
import 'package:ipi/webservice/apiservice.dart';

class OfficineProvider extends ChangeNotifier {
  late List<OfficineModel> officines;

  static Future<List<OfficineModel>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(OfficineSchema.ALL, variables);
    dynamic list = datas["searchOfficine"]["results"];
    List<OfficineModel> officines = [];
    for (var jsonTask in list) {
      OfficineModel item = OfficineModel.fromJson(jsonTask);
      officines.add(item);
    }
    return officines;
  }

  static Future<List<OfficineModel>> officineDistance(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(OfficineSchema.OFFICINE_DISTANCE, variables);
    return datas["searchOfficineDistance"];
  }

  static Future<List<dynamic>> avialable(Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(OfficineSchema.OFFICINES_AVIALABLE, variables);
    return datas["searchOfficineAvialable"];
  }
}
