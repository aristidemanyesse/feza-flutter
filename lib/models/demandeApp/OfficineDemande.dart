import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/models/demandeApp/Reponse.dart';
import 'package:ipi/models/officineApp/Officine.dart';
part 'OfficineDemande.freezed.dart';
part 'OfficineDemande.g.dart';

@freezed
class OfficineDemande with _$OfficineDemande {
  const OfficineDemande._();

  const factory OfficineDemande({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(false) bool propagated,
    @Default(false) bool isValided,
    @Default([]) List<Reponse> demandeReponse,
    Officine? officine,
  }) = _OfficineDemande;

  factory OfficineDemande.fromJson(Map<String, Object?> json) =>
      _$OfficineDemandeFromJson(json);

  static const String OfficineDemandeFragment = """
  fragment OfficineDemandeFragment on OfficineDemandeGenericType {
    id
    createdAt
    updateAt
    deleted
    propagated
    isValided
    officine{
      ...OfficineFragment
    }
    demandeReponse{
      ...ReponseFragment
    }
  }
  """;
}
