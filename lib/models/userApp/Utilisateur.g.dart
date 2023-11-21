// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Utilisateur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtilisateurImpl _$$UtilisateurImplFromJson(Map<String, dynamic> json) =>
    _$UtilisateurImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      fullname: json['fullname'] as String? ?? "",
      contact: json['contact'] as String? ?? "",
      otp: json['otp'] as String? ?? "",
      imei: json['imei'] as String? ?? "",
      isValide: json['isValide'] as bool? ?? false,
      geometryJson: json['geometryJson'] as String? ?? "",
      image: json['image'] as String? ?? "",
      circonscription: json['circonscription'] == null
          ? null
          : Circonscription.fromJson(
              json['circonscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UtilisateurImplToJson(_$UtilisateurImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'fullname': instance.fullname,
      'contact': instance.contact,
      'otp': instance.otp,
      'imei': instance.imei,
      'isValide': instance.isValide,
      'geometryJson': instance.geometryJson,
      'image': instance.image,
      'circonscription': instance.circonscription,
    };
