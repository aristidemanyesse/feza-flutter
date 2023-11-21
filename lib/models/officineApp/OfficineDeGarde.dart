import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/officineApp/Garde.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:flutter/foundation.dart';
part 'OfficineDeGarde.freezed.dart';
part 'OfficineDeGarde.g.dart';

@freezed
class OfficineDeGarde with _$OfficineDeGarde {
  const factory OfficineDeGarde({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    Garde? garde,
    Officine? officine,
  }) = _OfficineDeGarde;

  factory OfficineDeGarde.fromJson(Map<String, Object?> json) =>
      _$OfficineDeGardeFromJson(json);

  static const String OfficineDeGardeFragment = """
  fragment OfficineDeGardeFragment on OfficineDeGardeGenericType {
    id
    createdAt
    updateAt
    deleted
    garde{
      ...GardeFragment
    }
    officine{
      ...OfficineFragment
    }
  }
  """;
}
