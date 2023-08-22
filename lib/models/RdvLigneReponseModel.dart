import 'package:ipi/models/LigneReponseModel.dart';

class RdvLigneReponseModel {
  RdvLigneReponseModel({
    this.id,
    this.ligne,
    this.days,
    this.read,
    this.valide,
    this.validedDate,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  LigneReponseModel? ligne;
  int? days;
  bool? valide;
  bool? read;
  String? validedDate;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory RdvLigneReponseModel.fromJson(Map<String, dynamic> json) =>
      RdvLigneReponseModel(
          id: json["id"],
          ligne: LigneReponseModel.fromJson(json["ligne"]),
          days: json["days"],
          read: json["read"],
          validedDate: json["validedDate"],
          valide: json["valide"],
          deleted: json["deleted"],
          protected: json["protected"],
          createdAt: json["createdAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "ligne": ligne?.toJson(),
        "days": days,
        "read": read,
        "validedDate": validedDate,
        "valide": valide,
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
