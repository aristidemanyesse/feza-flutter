import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:flutter/foundation.dart';
part 'ResponsableOfficine.freezed.dart';
part 'ResponsableOfficine.g.dart';

@freezed
class ResponsableOfficine with _$ResponsableOfficine {
  const factory ResponsableOfficine({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(0.0) double lon,
    @Default(0.0) double lat,
    Officine? officine,
  }) = _ResponsableOfficine;

  factory ResponsableOfficine.fromJson(Map<String, Object?> json) =>
      _$ResponsableOfficineFromJson(json);

  static const String ResponsableOfficineFragment = """
  fragment ResponsableOfficineFragment on ResponsableOfficineGenericType {
    id
    createdAt
    updateAt
    deleted
    lon
    lat
    officine{
      ...OfficineFragment
    }
  }
  """;
}
