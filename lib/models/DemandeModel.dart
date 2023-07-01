import 'package:ipi/models/UtilisateurModel.dart';

class DemandeModel {
  DemandeModel({
    this.id,
    this.ordonnance,
    this.commentaire,
    this.status,
    this.utilisateur,
    this.base64,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  UtilisateurModel? utilisateur;
  bool? status;
  String? commentaire;
  String? ordonnance;
  String? base64;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory DemandeModel.fromJson(Map<String, dynamic> json) => DemandeModel(
      id: json["id"],
      commentaire: json["commentaire"],
      ordonnance: json["ordonnance"],
      base64: json["base64"],
      status: json["status"],
      utilisateur: UtilisateurModel.fromJson(json["utilisateur"]),
      deleted: json["deleted"],
      protected: json["protected"],
      createdAt: json["createdAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "commentaire": commentaire,
        "ordonnance": ordonnance,
        "base64": base64,
        "status": status,
        "utilisateur": utilisateur?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
