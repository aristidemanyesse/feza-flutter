// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Circonscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CirconscriptionImpl _$$CirconscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CirconscriptionImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      name: json['name'] as String? ?? "",
      geometryJson: json['geometryJson'] as String? ?? "",
    );

Map<String, dynamic> _$$CirconscriptionImplToJson(
        _$CirconscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'name': instance.name,
      'geometryJson': instance.geometryJson,
    };
