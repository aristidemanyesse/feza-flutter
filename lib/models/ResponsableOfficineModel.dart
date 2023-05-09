// To parse this JSON data, do
//
//     final ResponsableOfficineModel = ResponsableOfficineModelFromJson(jsonString);

import 'dart:convert';

ResponsableOfficineModel responsableOfficineModelFromJson(String str) =>
    ResponsableOfficineModel.fromJson(json.decode(str));

String responsableOfficineModelToJson(ResponsableOfficineModel data) =>
    json.encode(data.toJson());

class ResponsableOfficineModel {
  ResponsableOfficineModel({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory ResponsableOfficineModel.fromJson(Map<String, dynamic> json) =>
      ResponsableOfficineModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
