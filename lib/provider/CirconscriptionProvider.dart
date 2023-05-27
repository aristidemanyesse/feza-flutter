import 'package:flutter/material.dart';
import 'package:ipi/models/CirconscriptionModel.dart';
import 'package:ipi/schemas/CirconscriptionSchema.dart';
import 'package:ipi/webservice/apiservice.dart';

class CirconscriptionProvider extends ChangeNotifier {
  late List<CirconscriptionModel> circonscriptions;

  static Future<List<CirconscriptionModel>> all(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(CirconscriptionSchema.ALL, variables);
    dynamic list = datas["searchCirconscription"]["results"];
    List<CirconscriptionModel> circonscriptions = [];
    for (var jsonTask in list) {
      CirconscriptionModel item = CirconscriptionModel.fromJson(jsonTask);
      circonscriptions.add(item);
    }
    return circonscriptions;
  }

  Future<void> one(String userid) async {
    Map<String, dynamic> variables = {};
    Map<String, dynamic>? circonscriptions;
    circonscriptions =
        await ApiService.request(CirconscriptionSchema.ALL, variables);
    notifyListeners();
  }
}
