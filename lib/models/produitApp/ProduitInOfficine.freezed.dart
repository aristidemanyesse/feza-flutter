// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ProduitInOfficine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProduitInOfficine _$ProduitInOfficineFromJson(Map<String, dynamic> json) {
  return _ProduitInOfficine.fromJson(json);
}

/// @nodoc
mixin _$ProduitInOfficine {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get etiquette => throw _privateConstructorUsedError;
  OfficineDemande? get demande => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProduitInOfficineCopyWith<ProduitInOfficine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProduitInOfficineCopyWith<$Res> {
  factory $ProduitInOfficineCopyWith(
          ProduitInOfficine value, $Res Function(ProduitInOfficine) then) =
      _$ProduitInOfficineCopyWithImpl<$Res, ProduitInOfficine>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String name,
      String etiquette,
      OfficineDemande? demande});

  $OfficineDemandeCopyWith<$Res>? get demande;
}

/// @nodoc
class _$ProduitInOfficineCopyWithImpl<$Res, $Val extends ProduitInOfficine>
    implements $ProduitInOfficineCopyWith<$Res> {
  _$ProduitInOfficineCopyWithImpl(this._value, this._then);

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
    Object? name = null,
    Object? etiquette = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      etiquette: null == etiquette
          ? _value.etiquette
          : etiquette // ignore: cast_nullable_to_non_nullable
              as String,
      demande: freezed == demande
          ? _value.demande
          : demande // ignore: cast_nullable_to_non_nullable
              as OfficineDemande?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficineDemandeCopyWith<$Res>? get demande {
    if (_value.demande == null) {
      return null;
    }

    return $OfficineDemandeCopyWith<$Res>(_value.demande!, (value) {
      return _then(_value.copyWith(demande: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProduitInOfficineImplCopyWith<$Res>
    implements $ProduitInOfficineCopyWith<$Res> {
  factory _$$ProduitInOfficineImplCopyWith(_$ProduitInOfficineImpl value,
          $Res Function(_$ProduitInOfficineImpl) then) =
      __$$ProduitInOfficineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String name,
      String etiquette,
      OfficineDemande? demande});

  @override
  $OfficineDemandeCopyWith<$Res>? get demande;
}

/// @nodoc
class __$$ProduitInOfficineImplCopyWithImpl<$Res>
    extends _$ProduitInOfficineCopyWithImpl<$Res, _$ProduitInOfficineImpl>
    implements _$$ProduitInOfficineImplCopyWith<$Res> {
  __$$ProduitInOfficineImplCopyWithImpl(_$ProduitInOfficineImpl _value,
      $Res Function(_$ProduitInOfficineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? name = null,
    Object? etiquette = null,
    Object? demande = freezed,
  }) {
    return _then(_$ProduitInOfficineImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      etiquette: null == etiquette
          ? _value.etiquette
          : etiquette // ignore: cast_nullable_to_non_nullable
              as String,
      demande: freezed == demande
          ? _value.demande
          : demande // ignore: cast_nullable_to_non_nullable
              as OfficineDemande?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProduitInOfficineImpl
    with DiagnosticableTreeMixin
    implements _ProduitInOfficine {
  const _$ProduitInOfficineImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.name = "",
      this.etiquette = "",
      this.demande});

  factory _$ProduitInOfficineImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProduitInOfficineImplFromJson(json);

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
  final String name;
  @override
  @JsonKey()
  final String etiquette;
  @override
  final OfficineDemande? demande;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProduitInOfficine(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, name: $name, etiquette: $etiquette, demande: $demande)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProduitInOfficine'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('etiquette', etiquette))
      ..add(DiagnosticsProperty('demande', demande));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProduitInOfficineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.etiquette, etiquette) ||
                other.etiquette == etiquette) &&
            (identical(other.demande, demande) || other.demande == demande));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updateAt, deleted, name, etiquette, demande);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProduitInOfficineImplCopyWith<_$ProduitInOfficineImpl> get copyWith =>
      __$$ProduitInOfficineImplCopyWithImpl<_$ProduitInOfficineImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProduitInOfficineImplToJson(
      this,
    );
  }
}

abstract class _ProduitInOfficine implements ProduitInOfficine {
  const factory _ProduitInOfficine(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final String name,
      final String etiquette,
      final OfficineDemande? demande}) = _$ProduitInOfficineImpl;

  factory _ProduitInOfficine.fromJson(Map<String, dynamic> json) =
      _$ProduitInOfficineImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  String get name;
  @override
  String get etiquette;
  @override
  OfficineDemande? get demande;
  @override
  @JsonKey(ignore: true)
  _$$ProduitInOfficineImplCopyWith<_$ProduitInOfficineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
