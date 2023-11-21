// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RdvLigneReponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RdvLigneReponseImpl _$$RdvLigneReponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RdvLigneReponseImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      valide: json['valide'] as bool? ?? false,
      read: json['read'] as bool? ?? false,
      validedDate: json['validedDate'] as String? ?? "",
      days: json['days'] as int? ?? 0,
      ligne: json['ligne'] == null
          ? null
          : LigneReponse.fromJson(json['ligne'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RdvLigneReponseImplToJson(
        _$RdvLigneReponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'valide': instance.valide,
      'read': instance.read,
      'validedDate': instance.validedDate,
      'days': instance.days,
      'ligne': instance.ligne,
    };
