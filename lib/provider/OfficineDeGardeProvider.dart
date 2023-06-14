import 'package:flutter/material.dart';
import 'package:ipi/models/OfficineDeGardeModel.dart';
import 'package:ipi/schemas/OfficineDeGardeSchema.dart';
import 'package:ipi/webservice/apiservice.dart';

class OfficineDeGardeProvider extends ChangeNotifier {
  late List<OfficineDeGardeModel> officines;

  static Future<List<OfficineDeGardeModel>> all(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(OfficineDeGardeSchema.ALL, variables);
    dynamic list = datas["searchOfficineDeGarde"]["results"];
    List<OfficineDeGardeModel> officines = [];
    for (var jsonTask in list) {
      OfficineDeGardeModel item = OfficineDeGardeModel.fromJson(jsonTask);
      officines.add(item);
    }
    return officines;
  }
}
