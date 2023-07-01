import 'package:ipi/models/BaseModel.dart';

class TypeProduitModel extends BaseModel {
  TypeProduitModel({
    this.id,
    this.name,
    this.etiquette,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  String? name;
  String? etiquette;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory TypeProduitModel.fromJson(Map<String, dynamic> json) =>
      TypeProduitModel(
          id: json["id"],
          name: json["name"],
          etiquette: json["etiquette"],
          deleted: json["deleted"],
          protected: json["protected"],
          createdAt: json["createdAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "etiquette": etiquette,
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
