import 'package:flutter/material.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/models/SMSModel.dart';
import 'package:ipi/schemas/OfficineSchema.dart';
import 'package:ipi/webservice/apiservice.dart';

import '../schemas/CommunicateSchema.dart';

class CommunicateProvider {
  static Future<ResponseModel> send_SMS(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(CommunicateSchema.SEND_SMS, variables);
    bool ok = datas["createSms"]["ok"];
    if (ok) {
      SMSModel sms = SMSModel.fromJson(datas["createSms"]["sms"]);
      response = ResponseModel(field: "", message: "", ok: true, data: sms);
    } else {
      response = ResponseModel(
          field: datas["createSms"]["errors"][0]["field"],
          message: datas["createSms"]["errors"][0]["message"],
          ok: false,
          data: new SMSModel());
    }
    return response;
  }
}
