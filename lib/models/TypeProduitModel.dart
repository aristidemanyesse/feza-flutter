import 'package:ipi/models/BaseModel.dart';

class TypeProduitModel extends BaseModel {
  TypeProduitModel({
    this.id,
    this.name,
    this.etiquette,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  String? name;
  String? etiquette;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory TypeProduitModel.fromJson(Map<String, dynamic> json) =>
      TypeProduitModel(
          id: json["id"],
          name: json["name"],
          etiquette: json["etiquette"],
          deleted: json["deleted"],
          protected: json["protected"],
          createAt: json["createAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "etiquette": etiquette,
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
