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
}
