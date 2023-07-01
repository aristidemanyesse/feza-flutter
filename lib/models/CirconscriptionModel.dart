import 'package:ipi/models/BaseModel.dart';

class CirconscriptionModel extends BaseModel {
  CirconscriptionModel({
    this.id,
    required this.name,
    this.geometryJson,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  String name;
  String? geometryJson;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory CirconscriptionModel.fromJson(Map<String, dynamic> json) =>
      CirconscriptionModel(
          id: json["id"],
          name: json["name"],
          geometryJson: json["geometryJson"],
          deleted: json["deleted"],
          protected: json["protected"],
          createdAt: json["createdAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "geometryJson": geometryJson,
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
