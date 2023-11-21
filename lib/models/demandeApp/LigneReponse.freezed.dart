// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LigneReponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LigneReponse _$LigneReponseFromJson(Map<String, dynamic> json) {
  return _LigneReponse.fromJson(json);
}

/// @nodoc
mixin _$LigneReponse {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int get quantite => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  Produit? get produit => throw _privateConstructorUsedError;
  Reponse? get reponse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LigneReponseCopyWith<LigneReponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LigneReponseCopyWith<$Res> {
  factory $LigneReponseCopyWith(
          LigneReponse value, $Res Function(LigneReponse) then) =
      _$LigneReponseCopyWithImpl<$Res, LigneReponse>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      int quantite,
      int price,
      Produit? produit,
      Reponse? reponse});

  $ProduitCopyWith<$Res>? get produit;
  $ReponseCopyWith<$Res>? get reponse;
}

/// @nodoc
class _$LigneReponseCopyWithImpl<$Res, $Val extends LigneReponse>
    implements $LigneReponseCopyWith<$Res> {
  _$LigneReponseCopyWithImpl(this._value, this._then);

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
    Object? quantite = null,
    Object? price = null,
    Object? produit = freezed,
    Object? reponse = freezed,
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
      quantite: null == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      produit: freezed == produit
          ? _value.produit
          : produit // ignore: cast_nullable_to_non_nullable
              as Produit?,
      reponse: freezed == reponse
          ? _value.reponse
          : reponse // ignore: cast_nullable_to_non_nullable
              as Reponse?,
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
  $ReponseCopyWith<$Res>? get reponse {
    if (_value.reponse == null) {
      return null;
    }

    return $ReponseCopyWith<$Res>(_value.reponse!, (value) {
      return _then(_value.copyWith(reponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LigneReponseImplCopyWith<$Res>
    implements $LigneReponseCopyWith<$Res> {
  factory _$$LigneReponseImplCopyWith(
          _$LigneReponseImpl value, $Res Function(_$LigneReponseImpl) then) =
      __$$LigneReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      int quantite,
      int price,
      Produit? produit,
      Reponse? reponse});

  @override
  $ProduitCopyWith<$Res>? get produit;
  @override
  $ReponseCopyWith<$Res>? get reponse;
}

/// @nodoc
class __$$LigneReponseImplCopyWithImpl<$Res>
    extends _$LigneReponseCopyWithImpl<$Res, _$LigneReponseImpl>
    implements _$$LigneReponseImplCopyWith<$Res> {
  __$$LigneReponseImplCopyWithImpl(
      _$LigneReponseImpl _value, $Res Function(_$LigneReponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? status = null,
    Object? quantite = null,
    Object? price = null,
    Object? produit = freezed,
    Object? reponse = freezed,
  }) {
    return _then(_$LigneReponseImpl(
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
      quantite: null == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      produit: freezed == produit
          ? _value.produit
          : produit // ignore: cast_nullable_to_non_nullable
              as Produit?,
      reponse: freezed == reponse
          ? _value.reponse
          : reponse // ignore: cast_nullable_to_non_nullable
              as Reponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LigneReponseImpl with DiagnosticableTreeMixin implements _LigneReponse {
  const _$LigneReponseImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.status = false,
      this.quantite = 0,
      this.price = 0,
      this.produit,
      this.reponse});

  factory _$LigneReponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LigneReponseImplFromJson(json);

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
  final int quantite;
  @override
  @JsonKey()
  final int price;
  @override
  final Produit? produit;
  @override
  final Reponse? reponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LigneReponse(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, status: $status, quantite: $quantite, price: $price, produit: $produit, reponse: $reponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LigneReponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('quantite', quantite))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('produit', produit))
      ..add(DiagnosticsProperty('reponse', reponse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LigneReponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.quantite, quantite) ||
                other.quantite == quantite) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.produit, produit) || other.produit == produit) &&
            (identical(other.reponse, reponse) || other.reponse == reponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      status, quantite, price, produit, reponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LigneReponseImplCopyWith<_$LigneReponseImpl> get copyWith =>
      __$$LigneReponseImplCopyWithImpl<_$LigneReponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LigneReponseImplToJson(
      this,
    );
  }
}

abstract class _LigneReponse implements LigneReponse {
  const factory _LigneReponse(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final bool status,
      final int quantite,
      final int price,
      final Produit? produit,
      final Reponse? reponse}) = _$LigneReponseImpl;

  factory _LigneReponse.fromJson(Map<String, dynamic> json) =
      _$LigneReponseImpl.fromJson;

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
  int get quantite;
  @override
  int get price;
  @override
  Produit? get produit;
  @override
  Reponse? get reponse;
  @override
  @JsonKey(ignore: true)
  _$$LigneReponseImplCopyWith<_$LigneReponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
