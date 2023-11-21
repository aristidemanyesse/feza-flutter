import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:flutter/foundation.dart';
part 'TypeOfficine.freezed.dart';
part 'TypeOfficine.g.dart';

@freezed
class TypeOfficine with _$TypeOfficine {
  const factory TypeOfficine({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default("") String etiquette,
  }) = _TypeOfficine;

  factory TypeOfficine.fromJson(Map<String, Object?> json) =>
      _$TypeOfficineFromJson(json);

  static const String TypeOfficineFragment = """
  fragment TypeOfficineFragment on TypeOfficineGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    etiquette
  }
  """;
}
