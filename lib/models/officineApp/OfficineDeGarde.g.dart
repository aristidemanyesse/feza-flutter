// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OfficineDeGarde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfficineDeGardeImpl _$$OfficineDeGardeImplFromJson(
        Map<String, dynamic> json) =>
    _$OfficineDeGardeImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      garde: json['garde'] == null
          ? null
          : Garde.fromJson(json['garde'] as Map<String, dynamic>),
      officine: json['officine'] == null
          ? null
          : Officine.fromJson(json['officine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OfficineDeGardeImplToJson(
        _$OfficineDeGardeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'garde': instance.garde,
      'officine': instance.officine,
    };
