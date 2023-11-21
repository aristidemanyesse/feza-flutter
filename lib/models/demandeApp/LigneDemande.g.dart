// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LigneDemande.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LigneDemandeImpl _$$LigneDemandeImplFromJson(Map<String, dynamic> json) =>
    _$LigneDemandeImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      quantite: json['quantite'] as int? ?? 0,
      base64: json['base64'] as String? ?? "",
      produit: json['produit'] == null
          ? null
          : Produit.fromJson(json['produit'] as Map<String, dynamic>),
      demande: json['demande'] == null
          ? null
          : Demande.fromJson(json['demande'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LigneDemandeImplToJson(_$LigneDemandeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'status': instance.status,
      'quantite': instance.quantite,
      'base64': instance.base64,
      'produit': instance.produit,
      'demande': instance.demande,
    };
