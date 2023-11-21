import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/produitApp/Produit.dart';
import 'package:flutter/foundation.dart';
part 'LigneDemande.freezed.dart';
part 'LigneDemande.g.dart';

@freezed
class LigneDemande with _$LigneDemande {
  const factory LigneDemande({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(false) bool status,
    @Default(0) int quantite,
    @Default("") String base64,
    Produit? produit,
  }) = _LigneDemande;

  factory LigneDemande.fromJson(Map<String, Object?> json) =>
      _$LigneDemandeFromJson(json);

  static const String LigneDemandeFragment = """
  fragment LigneDemandeFragment on LigneDemandeGenericType {
    id
    status
    quantite
    produit{
      ...ProduitFragment
    }
  }
  """;
}
