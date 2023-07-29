import 'package:ipi/models/LigneReponseModel.dart';
import 'package:ipi/models/ProduitModel.dart';

class SubsLigneReponseModel {
  SubsLigneReponseModel({
    this.id,
    this.ligne,
    this.produit,
    this.price,
    this.quantite,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  LigneReponseModel? ligne;
  ProduitModel? produit;
  bool? status;
  int? price;
  int? quantite;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory SubsLigneReponseModel.fromJson(Map<String, dynamic> json) =>
      SubsLigneReponseModel(
          id: json["id"],
          price: json["price"],
          quantite: json["quantite"],
          ligne: LigneReponseModel.fromJson(json["ligne"]),
          produit: ProduitModel.fromJson(json["produit"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createdAt: json["createdAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "ligne": ligne?.toJson(),
        "produit": produit?.toJson(),
        "price": price,
        "quantite": quantite,
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
