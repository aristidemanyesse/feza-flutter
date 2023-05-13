import 'package:yebhofon/models/BaseModel.dart';
import 'package:yebhofon/models/CirconscriptionModel.dart';
import 'package:yebhofon/models/TypeOfficineModel.dart';

class OfficineModel extends BaseModel {
  OfficineModel({
    this.id,
    this.name,
    this.localisation,
    this.geometryJson,
    this.lon,
    this.lat,
    this.contact,
    this.contact2,
    this.type,
    this.circonscription,
    this.image,
    this.image2,
    this.image3,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  String? id;
  String? name;
  String? localisation;
  String? geometryJson;
  double? lon;
  double? lat;
  String? contact;
  String? contact2;
  TypeOfficineModel? type;
  CirconscriptionModel? circonscription;
  String? image;
  String? image2;
  String? image3;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory OfficineModel.fromJson(Map<String, dynamic> json) => OfficineModel(
      id: json["id"],
      name: json["name"],
      localisation: json["localisation"],
      geometryJson: json["geometryJson"],
      lon: json["lon"],
      lat: json["lat"],
      contact: json["contact"],
      contact2: json["contact2"],
      type: TypeOfficineModel.fromJson(json["type"]),
      circonscription: CirconscriptionModel.fromJson(json["circonscription"]),
      image: json["image"],
      image2: json["image2"],
      image3: json["image3"],
      deleted: json["deleted"],
      protected: json["protected"],
      createAt: json["createAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localisation": localisation,
        "geometryJson": geometryJson,
        "lon": lon,
        "lat": lat,
        "contact": contact,
        "contact2": contact2,
        "circonscription": circonscription?.toJson(),
        "type": type?.toJson(),
        "image": image,
        "image2": image2,
        "image3": image3,
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}
