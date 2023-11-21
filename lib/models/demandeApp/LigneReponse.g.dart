// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LigneReponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LigneReponseImpl _$$LigneReponseImplFromJson(Map<String, dynamic> json) =>
    _$LigneReponseImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      quantite: json['quantite'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      produit: json['produit'] == null
          ? null
          : Produit.fromJson(json['produit'] as Map<String, dynamic>),
      lignesSub: (json['lignesSub'] as List<dynamic>?)
              ?.map((e) => SubsLigneReponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rdvLigne: (json['rdvLigne'] as List<dynamic>?)
              ?.map((e) => RdvLigneReponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LigneReponseImplToJson(_$LigneReponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'status': instance.status,
      'quantite': instance.quantite,
      'price': instance.price,
      'produit': instance.produit,
      'lignesSub': instance.lignesSub,
      'rdvLigne': instance.rdvLigne,
    };
