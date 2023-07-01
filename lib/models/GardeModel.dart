import 'package:ipi/models/BaseModel.dart';

class GardeModel extends BaseModel {
  GardeModel({
    this.id,
    this.debut,
    this.fin,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  String? debut;
  String? fin;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory GardeModel.fromJson(Map<String, dynamic> json) => GardeModel(
      id: json["id"],
      debut: json["debut"],
      fin: json["fin"],
      deleted: json["deleted"],
      protected: json["protected"],
      createdAt: json["createdAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "debut": debut,
        "fin": fin,
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
