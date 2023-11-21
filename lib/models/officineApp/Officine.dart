import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/officineApp/Circonscription.dart';
import 'package:ipi/models/officineApp/TypeOfficine.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/OfficineSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'Officine.freezed.dart';
part 'Officine.g.dart';

@freezed
class Officine with _$Officine {
  const factory Officine({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(0.0) double lon,
    @Default(0.0) double lat,
    @Default("") String name,
    @Default("") String localisation,
    @Default("") String geometryJson,
    @Default("") String contact,
    @Default("") String contact2,
    @Default("") String image,
    @Default("") String image2,
    @Default("") String image3,
    TypeOfficine? type,
    Circonscription? circonscription,
  }) = _Officine;

  factory Officine.fromJson(Map<String, Object?> json) =>
      _$OfficineFromJson(json);

  static const String OfficineFragment = """
  fragment OfficineFragment on OfficineGenericType {
    id
    createdAt
    updateAt
    deleted
    lon
    lat
    name
    localisation
    geometryJson
    contact
    contact2
    image
    image2
    image3
    type{
      ...TypeOfficineFragment
    }
    circonscription{
      ...CirconscriptionFragment
    }
  }
  """;

  static Future<List<Officine>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(OfficineSchema.ALL, variables);
    dynamic list = datas["searchOfficine"]["results"];
    List<Officine> officines = [];
    for (var jsonTask in list) {
      Officine item = Officine.fromJson(jsonTask);
      officines.add(item);
    }
    return officines;
  }

  static Future<Map<String, dynamic>> officineDistance(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(OfficineSchema.OFFICINE_DISTANCE, variables);
    return datas["searchOfficineDistance"];
  }

  static Future<List<dynamic>> avialable(Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(OfficineSchema.OFFICINES_AVIALABLE, variables);
    return datas["searchOfficineAvialable"];
  }

  static Future<List<dynamic>> garde_avialable(
      Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(
        OfficineSchema.OFFICINES_GARDE_AVIALABLE, variables);
    return datas["searchOfficineGardeAvialable"];
  }
}
