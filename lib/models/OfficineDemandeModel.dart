import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/OfficineModel.dart';

class OfficineDemandeModel {
  OfficineDemandeModel({
    this.id,
    this.demande,
    this.officine,
    this.propagated,
    this.isValided,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  DemandeModel? demande;
  OfficineModel? officine;
  bool? isValided;
  bool? propagated;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory OfficineDemandeModel.fromJson(Map<String, dynamic> json) =>
      OfficineDemandeModel(
          id: json["id"],
          propagated: json["propagated"],
          isValided: json["isValided"],
          demande: DemandeModel.fromJson(json["demande"]),
          officine: OfficineModel.fromJson(json["officine"]),
          deleted: json["deleted"],
          protected: json["protected"],
          createAt: json["createAt"],
          updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "isValided": isValided,
        "propagated": propagated,
        "officine": officine?.toJson(),
        "demande": demande?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
