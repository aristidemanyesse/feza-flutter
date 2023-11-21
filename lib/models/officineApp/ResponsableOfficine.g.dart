// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponsableOfficine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponsableOfficineImpl _$$ResponsableOfficineImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponsableOfficineImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      officine: json['officine'] == null
          ? null
          : Officine.fromJson(json['officine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponsableOfficineImplToJson(
        _$ResponsableOfficineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'lon': instance.lon,
      'lat': instance.lat,
      'officine': instance.officine,
    };
