// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Demande.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DemandeImpl _$$DemandeImplFromJson(Map<String, dynamic> json) =>
    _$DemandeImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      ordonnance: json['ordonnance'] as String? ?? "",
      base64: json['base64'] as String? ?? "",
      commentaire: json['commentaire'] as String? ?? "",
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      propagating: json['propagating'] as bool? ?? false,
      isFinished: json['isFinished'] as bool? ?? false,
      isSatisfied: json['isSatisfied'] as bool? ?? false,
      utilisateur: json['utilisateur'] == null
          ? null
          : Utilisateur.fromJson(json['utilisateur'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DemandeImplToJson(_$DemandeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'status': instance.status,
      'ordonnance': instance.ordonnance,
      'base64': instance.base64,
      'commentaire': instance.commentaire,
      'lat': instance.lat,
      'lon': instance.lon,
      'propagating': instance.propagating,
      'isFinished': instance.isFinished,
      'isSatisfied': instance.isSatisfied,
      'utilisateur': instance.utilisateur,
    };
