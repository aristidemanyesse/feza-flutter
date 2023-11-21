import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:flutter/foundation.dart';
import 'package:ipi/schemas/ProduitInOfficineSchema.dart';
import 'package:ipi/webservice/apiservice.dart';
part 'ProduitInOfficine.freezed.dart';
part 'ProduitInOfficine.g.dart';

@freezed
class ProduitInOfficine with _$ProduitInOfficine {
  const factory ProduitInOfficine({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default("") String etiquette,
    OfficineDemande? demande,
  }) = _ProduitInOfficine;

  factory ProduitInOfficine.fromJson(Map<String, Object?> json) =>
      _$ProduitInOfficineFromJson(json);

  static const String ProduitFragment = """
  fragment ProduitFragment on TypeOfficineGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    etiquette
    type{
      ...TypeProduitFragment
    }
  }
  """;

  static Future<List<dynamic>> searchProduitsAvialableInOfficine(
      Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(
        ProduitInOfficineSchema.SEARCH_PRODUITS_AVIALABLE_IN_OFFICINE,
        variables);
    return datas["searchProduitsAvialableInOfficine"];
  }
}
