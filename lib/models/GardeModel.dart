import 'package:ipi/models/BaseModel.dart';

class GardeModel extends BaseModel {
  GardeModel({
    this.id,
    this.debut,
    this.fin,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  String? debut;
  String? fin;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory GardeModel.fromJson(Map<String, dynamic> json) => GardeModel(
      id: json["id"],
      debut: json["debut"],
      fin: json["fin"],
      deleted: json["deleted"],
      protected: json["protected"],
      createAt: json["createAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "debut": debut,
        "fin": fin,
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
