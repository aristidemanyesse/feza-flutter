// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReponseImpl _$$ReponseImplFromJson(Map<String, dynamic> json) =>
    _$ReponseImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      read: json['read'] as bool? ?? false,
      price: json['price'] as int? ?? 0,
      commentaire: json['commentaire'] as String? ?? "",
      reponseLignes: (json['reponseLignes'] as List<dynamic>?)
              ?.map((e) => LigneReponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReponseImplToJson(_$ReponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'read': instance.read,
      'price': instance.price,
      'commentaire': instance.commentaire,
      'reponseLignes': instance.reponseLignes,
    };
