import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/ProduitModel.dart';

class LigneDemandeModel {
  LigneDemandeModel({
    this.id,
    this.demande,
    this.produit,
    this.quantite = 1,
    this.status,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  DemandeModel? demande;
  ProduitModel? produit;
  int? quantite;
  bool? status;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory LigneDemandeModel.fromJson(Map<String, dynamic> json) =>
      LigneDemandeModel(
          id: json["id"],
          status: json["status"],
          quantite: json["quantite"],
          demande: DemandeModel.fromJson(json["demande"]),
          produit: ProduitModel.fromJson(json["produit"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createdAt: json["createdAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "demande": demande?.toJson(),
        "produit": produit?.toJson(),
        "quantite": quantite,
        "status": status,
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
