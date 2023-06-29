import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/ProduitModel.dart';

class LigneReponseModel {
  LigneReponseModel({
    this.id,
    this.reponse,
    this.produit,
    this.status,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  DemandeModel? reponse;
  ProduitModel? produit;
  bool? status;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory LigneReponseModel.fromJson(Map<String, dynamic> json) =>
      LigneReponseModel(
          id: json["id"],
          status: json["status"],
          reponse: DemandeModel.fromJson(json["reponse"]),
          produit: ProduitModel.fromJson(json["officine"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createAt: json["createAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "reponse": reponse?.toJson(),
        "produit": produit?.toJson(),
        "status": status,
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
