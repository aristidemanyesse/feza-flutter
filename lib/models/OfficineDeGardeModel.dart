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
    this.createdAt,
    this.updateAt,
  });

  String? id;
  GardeModel? garde;
  OfficineModel? officine;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory OfficineDeGardeModel.fromJson(Map<String, dynamic> json) =>
      OfficineDeGardeModel(
          id: json["id"],
          garde: GardeModel.fromJson(json["garde"]),
          officine: OfficineModel.fromJson(json["officine"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createdAt: json["createdAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "garde": garde?.toJson(),
        "officine": officine?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}
