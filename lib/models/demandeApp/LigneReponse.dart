import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/demandeApp/RdvLigneReponse.dart';
import 'package:ipi/models/demandeApp/SubsLigneReponse.dart';
import 'package:ipi/models/produitApp/Produit.dart';
import 'package:flutter/foundation.dart';
part 'LigneReponse.freezed.dart';
part 'LigneReponse.g.dart';

@freezed
class LigneReponse with _$LigneReponse {
  const factory LigneReponse({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(false) bool status,
    @Default(0) int quantite,
    @Default(0) int price,
    Produit? produit,
    @Default([]) List<SubsLigneReponse> lignesSub,
    @Default([]) List<RdvLigneReponse> rdvLigne,
  }) = _LigneReponse;

  factory LigneReponse.fromJson(Map<String, Object?> json) =>
      _$LigneReponseFromJson(json);

  static const String LigneReponseFragment = """
  fragment LigneReponseFragment on LigneReponseGenericType {
    id
    createdAt
    updateAt
    deleted
    status
    quantite
    price
    lignesSub{
      ...SubsLigneReponseFragment
    }
    produit{
      ...ProduitFragment
    }
    rdvLigne{
      ...RdvLigneReponseFragment
    }
  }
  """;
}
