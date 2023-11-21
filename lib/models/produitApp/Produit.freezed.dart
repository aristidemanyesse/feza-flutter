// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Produit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Produit _$ProduitFromJson(Map<String, dynamic> json) {
  return _Produit.fromJson(json);
}

/// @nodoc
mixin _$Produit {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  bool get onlyOrdonnance => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get codebarre => throw _privateConstructorUsedError;
  String get voies => throw _privateConstructorUsedError;
  String get forme => throw _privateConstructorUsedError;
  String get cis => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  TypeProduit? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProduitCopyWith<Produit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProduitCopyWith<$Res> {
  factory $ProduitCopyWith(Produit value, $Res Function(Produit) then) =
      _$ProduitCopyWithImpl<$Res, Produit>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      int price,
      bool onlyOrdonnance,
      String name,
      String description,
      String codebarre,
      String voies,
      String forme,
      String cis,
      String image,
      TypeProduit? type});

  $TypeProduitCopyWith<$Res>? get type;
}

/// @nodoc
class _$ProduitCopyWithImpl<$Res, $Val extends Produit>
    implements $ProduitCopyWith<$Res> {
  _$ProduitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? price = null,
    Object? onlyOrdonnance = null,
    Object? name = null,
    Object? description = null,
    Object? codebarre = null,
    Object? voies = null,
    Object? forme = null,
    Object? cis = null,
    Object? image = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      onlyOrdonnance: null == onlyOrdonnance
          ? _value.onlyOrdonnance
          : onlyOrdonnance // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      codebarre: null == codebarre
          ? _value.codebarre
          : codebarre // ignore: cast_nullable_to_non_nullable
              as String,
      voies: null == voies
          ? _value.voies
          : voies // ignore: cast_nullable_to_non_nullable
              as String,
      forme: null == forme
          ? _value.forme
          : forme // ignore: cast_nullable_to_non_nullable
              as String,
      cis: null == cis
          ? _value.cis
          : cis // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeProduit?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeProduitCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $TypeProduitCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProduitImplCopyWith<$Res> implements $ProduitCopyWith<$Res> {
  factory _$$ProduitImplCopyWith(
          _$ProduitImpl value, $Res Function(_$ProduitImpl) then) =
      __$$ProduitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      int price,
      bool onlyOrdonnance,
      String name,
      String description,
      String codebarre,
      String voies,
      String forme,
      String cis,
      String image,
      TypeProduit? type});

  @override
  $TypeProduitCopyWith<$Res>? get type;
}

/// @nodoc
class __$$ProduitImplCopyWithImpl<$Res>
    extends _$ProduitCopyWithImpl<$Res, _$ProduitImpl>
    implements _$$ProduitImplCopyWith<$Res> {
  __$$ProduitImplCopyWithImpl(
      _$ProduitImpl _value, $Res Function(_$ProduitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? price = null,
    Object? onlyOrdonnance = null,
    Object? name = null,
    Object? description = null,
    Object? codebarre = null,
    Object? voies = null,
    Object? forme = null,
    Object? cis = null,
    Object? image = null,
    Object? type = freezed,
  }) {
    return _then(_$ProduitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      onlyOrdonnance: null == onlyOrdonnance
          ? _value.onlyOrdonnance
          : onlyOrdonnance // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      codebarre: null == codebarre
          ? _value.codebarre
          : codebarre // ignore: cast_nullable_to_non_nullable
              as String,
      voies: null == voies
          ? _value.voies
          : voies // ignore: cast_nullable_to_non_nullable
              as String,
      forme: null == forme
          ? _value.forme
          : forme // ignore: cast_nullable_to_non_nullable
              as String,
      cis: null == cis
          ? _value.cis
          : cis // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeProduit?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProduitImpl with DiagnosticableTreeMixin implements _Produit {
  const _$ProduitImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.price = 0,
      this.onlyOrdonnance = false,
      this.name = "",
      this.description = "",
      this.codebarre = "",
      this.voies = "",
      this.forme = "",
      this.cis = "",
      this.image = "",
      this.type});

  factory _$ProduitImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProduitImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updateAt;
  @override
  @JsonKey()
  final bool deleted;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final bool onlyOrdonnance;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String codebarre;
  @override
  @JsonKey()
  final String voies;
  @override
  @JsonKey()
  final String forme;
  @override
  @JsonKey()
  final String cis;
  @override
  @JsonKey()
  final String image;
  @override
  final TypeProduit? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Produit(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, price: $price, onlyOrdonnance: $onlyOrdonnance, name: $name, description: $description, codebarre: $codebarre, voies: $voies, forme: $forme, cis: $cis, image: $image, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Produit'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('onlyOrdonnance', onlyOrdonnance))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('codebarre', codebarre))
      ..add(DiagnosticsProperty('voies', voies))
      ..add(DiagnosticsProperty('forme', forme))
      ..add(DiagnosticsProperty('cis', cis))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProduitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.onlyOrdonnance, onlyOrdonnance) ||
                other.onlyOrdonnance == onlyOrdonnance) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.codebarre, codebarre) ||
                other.codebarre == codebarre) &&
            (identical(other.voies, voies) || other.voies == voies) &&
            (identical(other.forme, forme) || other.forme == forme) &&
            (identical(other.cis, cis) || other.cis == cis) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updateAt,
      deleted,
      price,
      onlyOrdonnance,
      name,
      description,
      codebarre,
      voies,
      forme,
      cis,
      image,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProduitImplCopyWith<_$ProduitImpl> get copyWith =>
      __$$ProduitImplCopyWithImpl<_$ProduitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProduitImplToJson(
      this,
    );
  }
}

abstract class _Produit implements Produit {
  const factory _Produit(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final int price,
      final bool onlyOrdonnance,
      final String name,
      final String description,
      final String codebarre,
      final String voies,
      final String forme,
      final String cis,
      final String image,
      final TypeProduit? type}) = _$ProduitImpl;

  factory _Produit.fromJson(Map<String, dynamic> json) = _$ProduitImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  int get price;
  @override
  bool get onlyOrdonnance;
  @override
  String get name;
  @override
  String get description;
  @override
  String get codebarre;
  @override
  String get voies;
  @override
  String get forme;
  @override
  String get cis;
  @override
  String get image;
  @override
  TypeProduit? get type;
  @override
  @JsonKey(ignore: true)
  _$$ProduitImplCopyWith<_$ProduitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
