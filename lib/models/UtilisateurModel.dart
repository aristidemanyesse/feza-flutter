import 'package:yebhofon/models/CirconscriptionModel.dart';

class UtilisateurModel {
  UtilisateurModel({
    this.id,
    this.fullname,
    this.contact,
    this.otp,
    this.imei,
    this.isValide,
    this.geometryJson,
    this.circonscription,
    this.image,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  String? fullname;
  String? contact;
  String? otp;
  String? imei;
  bool? isValide;
  String? geometryJson;
  CirconscriptionModel? circonscription;
  String? image;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  static UtilisateurModel fromJson(
          Map<String, dynamic> json) =>
      UtilisateurModel(
          id: json["id"],
          fullname: json["fullname"],
          contact: json["contact"],
          otp: json["otp"],
          imei: json["imei"],
          isValide: json["isValide"],
          geometryJson: json["geometryJson"],
          circonscription:
              CirconscriptionModel.fromJson(json["circonscription"]),
          image: json["image"],
          deleted: json["deleted"],
          protected: json["protected"],
          createAt: json["createAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "contact": contact,
        "otp": otp,
        "imei": imei,
        "isValide": isValide,
        "geometryJson": geometryJson,
        "image": image,
        "circonscription": circonscription?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
