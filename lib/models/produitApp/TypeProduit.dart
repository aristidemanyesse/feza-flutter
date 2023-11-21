import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'TypeProduit.freezed.dart';
part 'TypeProduit.g.dart';

@freezed
class TypeProduit with _$TypeProduit {
  const factory TypeProduit({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default("") String etiquette,
  }) = _TypeProduit;

  factory TypeProduit.fromJson(Map<String, Object?> json) =>
      _$TypeProduitFromJson(json);

  static const String TypeProduitFragment = """
  fragment TypeProduitFragment on TypeProduitGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    etiquette
  }
  """;
}
