// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProduitInOfficine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProduitInOfficineImpl _$$ProduitInOfficineImplFromJson(
        Map<String, dynamic> json) =>
    _$ProduitInOfficineImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      name: json['name'] as String? ?? "",
      etiquette: json['etiquette'] as String? ?? "",
      demande: json['demande'] == null
          ? null
          : OfficineDemande.fromJson(json['demande'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProduitInOfficineImplToJson(
        _$ProduitInOfficineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'name': instance.name,
      'etiquette': instance.etiquette,
      'demande': instance.demande,
    };
