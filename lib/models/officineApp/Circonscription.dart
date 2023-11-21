import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/CirconscriptionSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'Circonscription.freezed.dart';
part 'Circonscription.g.dart';

@freezed
class Circonscription with _$Circonscription {
  const factory Circonscription({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default("") String geometryJson,
  }) = _Circonscription;

  factory Circonscription.fromJson(Map<String, Object?> json) =>
      _$CirconscriptionFromJson(json);

  static const String CirconscriptionFragment = """
  fragment CirconscriptionFragment on CirconscriptionGenericType {
    id
    updateAt
    createdAt
    deleted
    name
    geometryJson
  }
  """;

  static Future<List<Circonscription>> all(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(CirconscriptionSchema.ALL, variables);
    dynamic list = datas["searchCirconscription"]["results"];
    List<Circonscription> circonscriptions = [];
    for (var jsonTask in list) {
      Circonscription item = Circonscription.fromJson(jsonTask);
      circonscriptions.add(item);
    }
    return circonscriptions;
  }
}
