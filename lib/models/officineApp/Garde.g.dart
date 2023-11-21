// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Garde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GardeImpl _$$GardeImplFromJson(Map<String, dynamic> json) => _$GardeImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      debut: json['debut'] as String? ?? "",
      fin: json['fin'] as String? ?? "",
    );

Map<String, dynamic> _$$GardeImplToJson(_$GardeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'debut': instance.debut,
      'fin': instance.fin,
    };
