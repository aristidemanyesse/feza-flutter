import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/GardeSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'Garde.freezed.dart';
part 'Garde.g.dart';

@freezed
class Garde with _$Garde {
  const factory Garde({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String debut,
    @Default("") String fin,
  }) = _Garde;

  factory Garde.fromJson(Map<String, Object?> json) => _$GardeFromJson(json);

  static const String GardeFragment = """
  fragment GardeFragment on GardeGenericType {
    id
    createdAt
    updateAt
    deleted
    debut
    fin
  }
  """;

  static Future<List<Garde>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(GardeSchema.ALL, variables);
    dynamic list = datas["searchGarde"]["results"];
    List<Garde> gardes = [];
    for (var jsonTask in list) {
      Garde item = Garde.fromJson(jsonTask);
      gardes.add(item);
    }
    return gardes;
  }
}
