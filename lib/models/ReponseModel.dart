import 'package:ipi/models/DemandeModel.dart';

class ReponseModel {
  ReponseModel({
    this.id,
    this.demande,
    this.commentaire,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  DemandeModel? demande;
  String? commentaire;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory ReponseModel.fromJson(Map<String, dynamic> json) => ReponseModel(
      id: json["id"],
      commentaire: json["commentaire"],
      demande: DemandeModel.fromJson(json["demande"]),
      deleted: json["deleted"],
      protected: json["protected"],
      createAt: json["createAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "commentaire": commentaire,
        "demande": demande?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
