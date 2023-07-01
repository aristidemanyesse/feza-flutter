import 'package:ipi/models/OfficineDemandeModel.dart';

class ReponseModel {
  ReponseModel({
    this.id,
    this.demande,
    this.commentaire,
    this.read,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  OfficineDemandeModel? demande;
  String? commentaire;
  bool? read;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory ReponseModel.fromJson(Map<String, dynamic> json) => ReponseModel(
      id: json["id"],
      read: json["read"],
      commentaire: json["commentaire"],
      demande: OfficineDemandeModel.fromJson(json["demande"]),
      deleted: json["deleted"],
      protected: json["protected"],
      createdAt: json["createdAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "read": read,
        "commentaire": commentaire,
        "demande": demande?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
