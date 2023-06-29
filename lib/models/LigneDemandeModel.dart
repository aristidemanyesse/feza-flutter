import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/ProduitModel.dart';

class LigneDemandeModel {
  LigneDemandeModel({
    this.id,
    this.demande,
    this.produit,
    this.status,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  DemandeModel? demande;
  ProduitModel? produit;
  bool? status;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory LigneDemandeModel.fromJson(Map<String, dynamic> json) =>
      LigneDemandeModel(
          id: json["id"],
          status: json["status"],
          demande: DemandeModel.fromJson(json["demande"]),
          produit: ProduitModel.fromJson(json["officine"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createAt: json["createAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "demande": demande?.toJson(),
        "produit": produit?.toJson(),
        "status": status,
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
