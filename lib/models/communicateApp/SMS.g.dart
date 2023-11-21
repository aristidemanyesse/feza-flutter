// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SMS.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SMSImpl _$$SMSImplFromJson(Map<String, dynamic> json) => _$SMSImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      token: json['token'] as String? ?? "",
      message: json['message'] as String? ?? "",
      number: json['number'] as String? ?? "",
      stats: json['stats'] as bool? ?? false,
    );

Map<String, dynamic> _$$SMSImplToJson(_$SMSImpl instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'token': instance.token,
      'message': instance.message,
      'number': instance.number,
      'stats': instance.stats,
    };
