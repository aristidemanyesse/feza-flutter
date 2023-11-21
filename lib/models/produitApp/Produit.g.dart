// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Produit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProduitImpl _$$ProduitImplFromJson(Map<String, dynamic> json) =>
    _$ProduitImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      price: json['price'] as int? ?? 0,
      onlyOrdonnance: json['onlyOrdonnance'] as bool? ?? false,
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      codebarre: json['codebarre'] as String? ?? "",
      voies: json['voies'] as String? ?? "",
      forme: json['forme'] as String? ?? "",
      cis: json['cis'] as String? ?? "",
      image: json['image'] as String? ?? "",
      type: json['type'] == null
          ? null
          : TypeProduit.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProduitImplToJson(_$ProduitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'price': instance.price,
      'onlyOrdonnance': instance.onlyOrdonnance,
      'name': instance.name,
      'description': instance.description,
      'codebarre': instance.codebarre,
      'voies': instance.voies,
      'forme': instance.forme,
      'cis': instance.cis,
      'image': instance.image,
      'type': instance.type,
    };
