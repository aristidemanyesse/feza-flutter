import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/ReponseModel.dart';

class LigneReponseModel {
  LigneReponseModel({
    this.id,
    this.reponse,
    this.produit,
    this.status,
    this.price,
    this.quantite,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  ReponseModel? reponse;
  ProduitModel? produit;
  bool? status;
  int? price;
  int? quantite;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory LigneReponseModel.fromJson(Map<String, dynamic> json) =>
      LigneReponseModel(
          id: json["id"],
          status: json["status"],
          price: json["price"],
          quantite: json["quantite"],
          reponse: ReponseModel.fromJson(json["reponse"]),
          produit: ProduitModel.fromJson(json["produit"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createdAt: json["createdAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "reponse": reponse?.toJson(),
        "produit": produit?.toJson(),
        "status": status,
        "price": price,
        "quantite": quantite,
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
