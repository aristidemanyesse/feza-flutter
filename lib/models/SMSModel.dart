import 'package:ipi/models/BaseModel.dart';

class SMSModel extends BaseModel {
  SMSModel({
    this.id,
    this.token,
    this.message,
    this.number,
    this.stats,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  String? token;
  String? message;
  String? number;
  bool? stats;
  String? createdAt;
  String? updateAt;

  factory SMSModel.fromJson(Map<String, dynamic> json) => SMSModel(
      id: json["id"],
      token: json["token"],
      message: json["message"],
      number: json["number"],
      stats: json["stats"],
      createdAt: json["createdAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "message": message,
        "number": number,
        "stats": stats,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
