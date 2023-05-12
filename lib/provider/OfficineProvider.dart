import 'package:flutter/material.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/schemas/OfficineSchema.dart';
import 'package:yebhofon/webservice/apiservice.dart';

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
}
