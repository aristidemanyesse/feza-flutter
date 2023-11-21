// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SubsLigneReponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubsLigneReponse _$SubsLigneReponseFromJson(Map<String, dynamic> json) {
  return _SubsLigneReponse.fromJson(json);
}

/// @nodoc
mixin _$SubsLigneReponse {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantite => throw _privateConstructorUsedError;
  Produit? get produit => throw _privateConstructorUsedError;
  LigneReponse? get demande => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubsLigneReponseCopyWith<SubsLigneReponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubsLigneReponseCopyWith<$Res> {
  factory $SubsLigneReponseCopyWith(
          SubsLigneReponse value, $Res Function(SubsLigneReponse) then) =
      _$SubsLigneReponseCopyWithImpl<$Res, SubsLigneReponse>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      int price,
      int quantite,
      Produit? produit,
      LigneReponse? demande});

  $ProduitCopyWith<$Res>? get produit;
  $LigneReponseCopyWith<$Res>? get demande;
}

/// @nodoc
class _$SubsLigneReponseCopyWithImpl<$Res, $Val extends SubsLigneReponse>
    implements $SubsLigneReponseCopyWith<$Res> {
  _$SubsLigneReponseCopyWithImpl(this._value, this._then);

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
    Object? status = null,
    Object? price = null,
    Object? quantite = null,
    Object? produit = freezed,
    Object? demande = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantite: null == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as int,
      produit: freezed == produit
          ? _value.produit
          : produit // ignore: cast_nullable_to_non_nullable
              as Produit?,
      demande: freezed == demande
          ? _value.demande
          : demande // ignore: cast_nullable_to_non_nullable
              as LigneReponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProduitCopyWith<$Res>? get produit {
    if (_value.produit == null) {
      return null;
    }

    return $ProduitCopyWith<$Res>(_value.produit!, (value) {
      return _then(_value.copyWith(produit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LigneReponseCopyWith<$Res>? get demande {
    if (_value.demande == null) {
      return null;
    }

    return $LigneReponseCopyWith<$Res>(_value.demande!, (value) {
      return _then(_value.copyWith(demande: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubsLigneReponseImplCopyWith<$Res>
    implements $SubsLigneReponseCopyWith<$Res> {
  factory _$$SubsLigneReponseImplCopyWith(_$SubsLigneReponseImpl value,
          $Res Function(_$SubsLigneReponseImpl) then) =
      __$$SubsLigneReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      int price,
      int quantite,
      Produit? produit,
      LigneReponse? demande});

  @override
  $ProduitCopyWith<$Res>? get produit;
  @override
  $LigneReponseCopyWith<$Res>? get demande;
}

/// @nodoc
class __$$SubsLigneReponseImplCopyWithImpl<$Res>
    extends _$SubsLigneReponseCopyWithImpl<$Res, _$SubsLigneReponseImpl>
    implements _$$SubsLigneReponseImplCopyWith<$Res> {
  __$$SubsLigneReponseImplCopyWithImpl(_$SubsLigneReponseImpl _value,
      $Res Function(_$SubsLigneReponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? status = null,
    Object? price = null,
    Object? quantite = null,
    Object? produit = freezed,
    Object? demande = freezed,
  }) {
    return _then(_$SubsLigneReponseImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantite: null == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as int,
      produit: freezed == produit
          ? _value.produit
          : produit // ignore: cast_nullable_to_non_nullable
              as Produit?,
      demande: freezed == demande
          ? _value.demande
          : demande // ignore: cast_nullable_to_non_nullable
              as LigneReponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubsLigneReponseImpl
    with DiagnosticableTreeMixin
    implements _SubsLigneReponse {
  const _$SubsLigneReponseImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.status = false,
      this.price = 0,
      this.quantite = 0,
      this.produit,
      this.demande});

  factory _$SubsLigneReponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubsLigneReponseImplFromJson(json);

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
  final bool status;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final int quantite;
  @override
  final Produit? produit;
  @override
  final LigneReponse? demande;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubsLigneReponse(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, status: $status, price: $price, quantite: $quantite, produit: $produit, demande: $demande)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubsLigneReponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('quantite', quantite))
      ..add(DiagnosticsProperty('produit', produit))
      ..add(DiagnosticsProperty('demande', demande));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubsLigneReponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantite, quantite) ||
                other.quantite == quantite) &&
            (identical(other.produit, produit) || other.produit == produit) &&
            (identical(other.demande, demande) || other.demande == demande));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      status, price, quantite, produit, demande);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubsLigneReponseImplCopyWith<_$SubsLigneReponseImpl> get copyWith =>
      __$$SubsLigneReponseImplCopyWithImpl<_$SubsLigneReponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubsLigneReponseImplToJson(
      this,
    );
  }
}

abstract class _SubsLigneReponse implements SubsLigneReponse {
  const factory _SubsLigneReponse(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final bool status,
      final int price,
      final int quantite,
      final Produit? produit,
      final LigneReponse? demande}) = _$SubsLigneReponseImpl;

  factory _SubsLigneReponse.fromJson(Map<String, dynamic> json) =
      _$SubsLigneReponseImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  bool get status;
  @override
  int get price;
  @override
  int get quantite;
  @override
  Produit? get produit;
  @override
  LigneReponse? get demande;
  @override
  @JsonKey(ignore: true)
  _$$SubsLigneReponseImplCopyWith<_$SubsLigneReponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
