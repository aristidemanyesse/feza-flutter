import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';

class DemandeModel {
  DemandeModel({
    this.id,
    this.ordonnance,
    this.commentaire,
    this.status,
    this.utilisateur,
    this.officine,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  UtilisateurModel? utilisateur;
  OfficineModel? officine;
  bool? status;
  String? commentaire;
  String? ordonnance;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory DemandeModel.fromJson(Map<String, dynamic> json) => DemandeModel(
      id: json["id"],
      commentaire: json["commentaire"],
      ordonnance: json["ordonnance"],
      status: json["status"],
      utilisateur: UtilisateurModel.fromJson(json["utilisateur"]),
      officine: OfficineModel.fromJson(json["officine"]),
      deleted: json["deleted"],
      protected: json["protected"],
      createAt: json["createAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "commentaire": commentaire,
        "ordonnance": ordonnance,
        "status": status,
        "officine": officine?.toJson(),
        "utilisateur": utilisateur?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
