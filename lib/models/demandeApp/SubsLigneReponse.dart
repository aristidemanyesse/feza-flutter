import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/demandeApp/LigneReponse.dart';
import 'package:ipi/models/produitApp/Produit.dart';
import 'package:flutter/foundation.dart';
part 'SubsLigneReponse.freezed.dart';
part 'SubsLigneReponse.g.dart';

@freezed
class SubsLigneReponse with _$SubsLigneReponse {
  const factory SubsLigneReponse({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(false) bool status,
    @Default(0) int price,
    @Default(0) int quantite,
    Produit? produit,
    LigneReponse? demande,
  }) = _SubsLigneReponse;

  factory SubsLigneReponse.fromJson(Map<String, Object?> json) =>
      _$SubsLigneReponseFromJson(json);

  static const String SubsLigneReponseFragment = """
  fragment SubsLigneReponseFragment on SubsLigneReponseGenericType {
    id
    createdAt
    updateAt
    deleted
    status
    price
    quantite
    produit{
      ...ProduitFragment
    }
    ligne{
      ...LigneReponseFragment
    }
  }
  """;
}
