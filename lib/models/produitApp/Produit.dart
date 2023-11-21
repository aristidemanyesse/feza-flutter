import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/produitApp/TypeProduit.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/ProduitSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'Produit.freezed.dart';
part 'Produit.g.dart';

@freezed
class Produit with _$Produit {
  const factory Produit({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(0) int price,
    @Default(false) bool onlyOrdonnance,
    @Default("") String name,
    @Default("") String description,
    @Default("") String codebarre,
    @Default("") String voies,
    @Default("") String forme,
    @Default("") String cis,
    @Default("") String image,
    TypeProduit? type,
  }) = _Produit;

  factory Produit.fromJson(Map<String, Object?> json) =>
      _$ProduitFromJson(json);

  static const String ProduitFragment = """
  fragment ProduitFragment on ProduitGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    price
    onlyOrdonnance
    description
    codebarre
    voies
    forme
    cis
    image
    type{
      ...TypeProduitFragment
    }
  }
  """;

  static Future<List<Produit>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(ProduitSchema.ALL, variables);
    dynamic list = datas["searchProduit"]["results"];
    List<Produit> produits = [];
    for (var jsonTask in list) {
      Produit item = Produit.fromJson(jsonTask);
      produits.add(item);
    }
    return produits;
  }

  static Future<List<Produit>> specificAll(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(ProduitSchema.SPECIFIC_ALL, variables);
    dynamic list = datas["searchProduits"];
    List<Produit> produits = [];
    for (var jsonTask in list) {
      Produit item = Produit.fromJson(jsonTask);
      produits.add(item);
    }
    return produits;
  }
}
