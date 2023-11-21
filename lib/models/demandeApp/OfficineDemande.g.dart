// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OfficineDemande.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfficineDemandeImpl _$$OfficineDemandeImplFromJson(
        Map<String, dynamic> json) =>
    _$OfficineDemandeImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      propagated: json['propagated'] as bool? ?? false,
      isValided: json['isValided'] as bool? ?? false,
      officine: json['officine'] == null
          ? null
          : Officine.fromJson(json['officine'] as Map<String, dynamic>),
      demande: json['demande'] == null
          ? null
          : Demande.fromJson(json['demande'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OfficineDemandeImplToJson(
        _$OfficineDemandeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'propagated': instance.propagated,
      'isValided': instance.isValided,
      'officine': instance.officine,
      'demande': instance.demande,
    };
