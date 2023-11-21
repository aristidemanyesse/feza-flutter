// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubsLigneReponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubsLigneReponseImpl _$$SubsLigneReponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SubsLigneReponseImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      price: json['price'] as int? ?? 0,
      quantite: json['quantite'] as int? ?? 0,
      produit: json['produit'] == null
          ? null
          : Produit.fromJson(json['produit'] as Map<String, dynamic>),
      demande: json['demande'] == null
          ? null
          : LigneReponse.fromJson(json['demande'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubsLigneReponseImplToJson(
        _$SubsLigneReponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'status': instance.status,
      'price': instance.price,
      'quantite': instance.quantite,
      'produit': instance.produit,
      'demande': instance.demande,
    };
