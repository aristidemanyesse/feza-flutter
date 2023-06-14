import 'package:ipi/models/TypeProduitModel.dart';

class ProduitModel {
  ProduitModel({
    this.id,
    required this.name,
    required this.description,
    required this.codebarre,
    this.onlyOrdonnance,
    this.image,
    this.type,
    this.cis,
    this.forme,
    this.voies,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  String name;
  String description;
  String codebarre;
  String? cis;
  String? forme;
  String? voies;
  bool? onlyOrdonnance;
  String? image;
  TypeProduitModel? type;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory ProduitModel.fromJson(Map<String, dynamic> json) => ProduitModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      codebarre: json["codebarre"],
      onlyOrdonnance: json["onlyOrdonnance"],
      image: json["image"],
      cis: json["cis"],
      forme: json["forme"],
      voies: json["voies"],
      type: TypeProduitModel.fromJson(json["type"]),
      deleted: json["deleted"],
      protected: json["protected"],
      createAt: json["createAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "codebarre": codebarre,
        "cis": cis,
        "forme": forme,
        "voies": voies,
        "onlyOrdonnance": onlyOrdonnance,
        "image": image,
        "type": type?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };

  static dynamic toJsonMap(ProduitModel element) => element.toJson();
  static dynamic fromJsonMap(Map<String, dynamic> json) =>
      ProduitModel.fromJson(json);
}
