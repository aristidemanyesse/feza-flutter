import 'package:flutter/material.dart';
import 'package:ipi/models/GardeModel.dart';
import 'package:ipi/schemas/OfficineSchema.dart';
import 'package:ipi/webservice/apiservice.dart';

class GardeProvider extends ChangeNotifier {
  late List<GardeModel> gardes;

  static Future<List<GardeModel>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(OfficineSchema.ALL, variables);
    dynamic list = datas["searchGarde"]["results"];
    List<GardeModel> gardes = [];
    for (var jsonTask in list) {
      GardeModel item = GardeModel.fromJson(jsonTask);
      gardes.add(item);
    }
    return gardes;
  }
}
