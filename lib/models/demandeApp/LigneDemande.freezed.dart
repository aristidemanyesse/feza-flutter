// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LigneDemande.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LigneDemande _$LigneDemandeFromJson(Map<String, dynamic> json) {
  return _LigneDemande.fromJson(json);
}

/// @nodoc
mixin _$LigneDemande {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int get quantite => throw _privateConstructorUsedError;
  String get base64 => throw _privateConstructorUsedError;
  Produit? get produit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LigneDemandeCopyWith<LigneDemande> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LigneDemandeCopyWith<$Res> {
  factory $LigneDemandeCopyWith(
          LigneDemande value, $Res Function(LigneDemande) then) =
      _$LigneDemandeCopyWithImpl<$Res, LigneDemande>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      int quantite,
      String base64,
      Produit? produit});

  $ProduitCopyWith<$Res>? get produit;
}

/// @nodoc
class _$LigneDemandeCopyWithImpl<$Res, $Val extends LigneDemande>
    implements $LigneDemandeCopyWith<$Res> {
  _$LigneDemandeCopyWithImpl(this._value, this._then);

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
    Object? base64 = null,
    Object? produit = freezed,
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
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      produit: freezed == produit
          ? _value.produit
          : produit // ignore: cast_nullable_to_non_nullable
              as Produit?,
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
}

/// @nodoc
abstract class _$$LigneDemandeImplCopyWith<$Res>
    implements $LigneDemandeCopyWith<$Res> {
  factory _$$LigneDemandeImplCopyWith(
          _$LigneDemandeImpl value, $Res Function(_$LigneDemandeImpl) then) =
      __$$LigneDemandeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      int quantite,
      String base64,
      Produit? produit});

  @override
  $ProduitCopyWith<$Res>? get produit;
}

/// @nodoc
class __$$LigneDemandeImplCopyWithImpl<$Res>
    extends _$LigneDemandeCopyWithImpl<$Res, _$LigneDemandeImpl>
    implements _$$LigneDemandeImplCopyWith<$Res> {
  __$$LigneDemandeImplCopyWithImpl(
      _$LigneDemandeImpl _value, $Res Function(_$LigneDemandeImpl) _then)
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
    Object? base64 = null,
    Object? produit = freezed,
  }) {
    return _then(_$LigneDemandeImpl(
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
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      produit: freezed == produit
          ? _value.produit
          : produit // ignore: cast_nullable_to_non_nullable
              as Produit?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LigneDemandeImpl with DiagnosticableTreeMixin implements _LigneDemande {
  const _$LigneDemandeImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.status = false,
      this.quantite = 0,
      this.base64 = "",
      this.produit});

  factory _$LigneDemandeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LigneDemandeImplFromJson(json);

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
  final String base64;
  @override
  final Produit? produit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LigneDemande(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, status: $status, quantite: $quantite, base64: $base64, produit: $produit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LigneDemande'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('quantite', quantite))
      ..add(DiagnosticsProperty('base64', base64))
      ..add(DiagnosticsProperty('produit', produit));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LigneDemandeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.quantite, quantite) ||
                other.quantite == quantite) &&
            (identical(other.base64, base64) || other.base64 == base64) &&
            (identical(other.produit, produit) || other.produit == produit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      status, quantite, base64, produit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LigneDemandeImplCopyWith<_$LigneDemandeImpl> get copyWith =>
      __$$LigneDemandeImplCopyWithImpl<_$LigneDemandeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LigneDemandeImplToJson(
      this,
    );
  }
}

abstract class _LigneDemande implements LigneDemande {
  const factory _LigneDemande(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final bool status,
      final int quantite,
      final String base64,
      final Produit? produit}) = _$LigneDemandeImpl;

  factory _LigneDemande.fromJson(Map<String, dynamic> json) =
      _$LigneDemandeImpl.fromJson;

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
  String get base64;
  @override
  Produit? get produit;
  @override
  @JsonKey(ignore: true)
  _$$LigneDemandeImplCopyWith<_$LigneDemandeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
