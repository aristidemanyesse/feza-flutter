import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/demandeApp/LigneReponse.dart';
import 'package:flutter/foundation.dart';
part 'RdvLigneReponse.freezed.dart';
part 'RdvLigneReponse.g.dart';

@freezed
class RdvLigneReponse with _$RdvLigneReponse {
  const factory RdvLigneReponse({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(false) bool valide,
    @Default(false) bool read,
    @Default("") String validedDate,
    @Default(0) int days,
    LigneReponse? ligne,
  }) = _RdvLigneReponse;

  factory RdvLigneReponse.fromJson(Map<String, Object?> json) =>
      _$RdvLigneReponseFromJson(json);

  static const String RdvLigneReponseFragment = """
  fragment RdvLigneReponseFragment on RdvLigneReponseGenericType {
    id
    createdAt
    updateAt
    deleted
    valide
    read
    validedDate
    days
    ligne{
      ...LigneReponseFragment
    }
  }
  """;
}
