// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Officine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfficineImpl _$$OfficineImplFromJson(Map<String, dynamic> json) =>
    _$OfficineImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      name: json['name'] as String? ?? "",
      localisation: json['localisation'] as String? ?? "",
      geometryJson: json['geometryJson'] as String? ?? "",
      contact: json['contact'] as String? ?? "",
      contact2: json['contact2'] as String? ?? "",
      image: json['image'] as String? ?? "",
      image2: json['image2'] as String? ?? "",
      image3: json['image3'] as String? ?? "",
      type: json['type'] == null
          ? null
          : TypeOfficine.fromJson(json['type'] as Map<String, dynamic>),
      circonscription: json['circonscription'] == null
          ? null
          : Circonscription.fromJson(
              json['circonscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OfficineImplToJson(_$OfficineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'lon': instance.lon,
      'lat': instance.lat,
      'name': instance.name,
      'localisation': instance.localisation,
      'geometryJson': instance.geometryJson,
      'contact': instance.contact,
      'contact2': instance.contact2,
      'image': instance.image,
      'image2': instance.image2,
      'image3': instance.image3,
      'type': instance.type,
      'circonscription': instance.circonscription,
    };
