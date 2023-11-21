import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/coreApp/ResponseModel.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/CommunicateSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'SMS.freezed.dart';
part 'SMS.g.dart';

@freezed
class SMS with _$SMS {
  const factory SMS({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String token,
    @Default("") String message,
    @Default("") String number,
    @Default(false) bool stats,
  }) = _SMS;

  factory SMS.fromJson(Map<String, Object?> json) => _$SMSFromJson(json);

  static const String SMSFragment = """
  fragment SMSFragment on SMSGenericType {
    id
    createdAt
    updateAt
    deleted
    token
    message
    number
    stats
  }
  """;

  static Future<ResponseModel> send_SMS(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(CommunicateSchema.SEND_SMS, variables);
    bool ok = datas["createSms"]["ok"];
    if (ok) {
      SMS sms = SMS.fromJson(datas["createSms"]["sms"]);
      response = ResponseModel(field: "", message: "", ok: true, data: sms);
    } else {
      response = ResponseModel(
          field: datas["createSms"]["errors"][0]["field"],
          message: datas["createSms"]["errors"][0]["message"],
          ok: false,
          data: new SMS());
    }
    return response;
  }
}
