import 'package:ipi/models/BaseModel.dart';
import 'package:ipi/models/GardeModel.dart';
import 'package:ipi/models/OfficineModel.dart';

class OfficineDeGardeModel extends BaseModel {
  OfficineDeGardeModel({
    this.id,
    this.garde,
    this.officine,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  GardeModel? garde;
  OfficineModel? officine;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory OfficineDeGardeModel.fromJson(Map<String, dynamic> json) =>
      OfficineDeGardeModel(
          id: json["id"],
          garde: GardeModel.fromJson(json["garde"]),
          officine: OfficineModel.fromJson(json["officine"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createAt: json["createAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "garde": garde?.toJson(),
        "officine": officine?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
