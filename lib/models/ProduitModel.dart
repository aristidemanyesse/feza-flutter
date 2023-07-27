import 'package:ipi/models/TypeProduitModel.dart';

class ProduitModel {
  ProduitModel({
    this.id,
    required this.name,
    required this.description,
    required this.codebarre,
    this.onlyOrdonnance,
    this.image,
    this.price,
    this.type,
    this.cis,
    this.forme,
    this.voies,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  String name;
  String description;
  String codebarre;
  String? cis;
  String? forme;
  String? voies;
  int? price;
  bool? onlyOrdonnance;
  String? image;
  TypeProduitModel? type;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory ProduitModel.fromJson(Map<String, dynamic> json) => ProduitModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      codebarre: json["codebarre"],
      onlyOrdonnance: json["onlyOrdonnance"],
      image: json["image"],
      price: json["price"],
      cis: json["cis"],
      forme: json["forme"],
      voies: json["voies"],
      type: TypeProduitModel.fromJson(json["type"]),
      deleted: json["deleted"],
      protected: json["protected"],
      createdAt: json["createdAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "codebarre": codebarre,
        "price": price,
        "cis": cis,
        "forme": forme,
        "voies": voies,
        "onlyOrdonnance": onlyOrdonnance,
        "image": image,
        "type": type?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
