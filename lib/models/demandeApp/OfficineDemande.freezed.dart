// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'OfficineDemande.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfficineDemande _$OfficineDemandeFromJson(Map<String, dynamic> json) {
  return _OfficineDemande.fromJson(json);
}

/// @nodoc
mixin _$OfficineDemande {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get propagated => throw _privateConstructorUsedError;
  bool get isValided => throw _privateConstructorUsedError;
  Officine? get officine => throw _privateConstructorUsedError;
  Demande? get demande => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficineDemandeCopyWith<OfficineDemande> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficineDemandeCopyWith<$Res> {
  factory $OfficineDemandeCopyWith(
          OfficineDemande value, $Res Function(OfficineDemande) then) =
      _$OfficineDemandeCopyWithImpl<$Res, OfficineDemande>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool propagated,
      bool isValided,
      Officine? officine,
      Demande? demande});

  $OfficineCopyWith<$Res>? get officine;
  $DemandeCopyWith<$Res>? get demande;
}

/// @nodoc
class _$OfficineDemandeCopyWithImpl<$Res, $Val extends OfficineDemande>
    implements $OfficineDemandeCopyWith<$Res> {
  _$OfficineDemandeCopyWithImpl(this._value, this._then);

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
    Object? propagated = null,
    Object? isValided = null,
    Object? officine = freezed,
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
      propagated: null == propagated
          ? _value.propagated
          : propagated // ignore: cast_nullable_to_non_nullable
              as bool,
      isValided: null == isValided
          ? _value.isValided
          : isValided // ignore: cast_nullable_to_non_nullable
              as bool,
      officine: freezed == officine
          ? _value.officine
          : officine // ignore: cast_nullable_to_non_nullable
              as Officine?,
      demande: freezed == demande
          ? _value.demande
          : demande // ignore: cast_nullable_to_non_nullable
              as Demande?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficineCopyWith<$Res>? get officine {
    if (_value.officine == null) {
      return null;
    }

    return $OfficineCopyWith<$Res>(_value.officine!, (value) {
      return _then(_value.copyWith(officine: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DemandeCopyWith<$Res>? get demande {
    if (_value.demande == null) {
      return null;
    }

    return $DemandeCopyWith<$Res>(_value.demande!, (value) {
      return _then(_value.copyWith(demande: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfficineDemandeImplCopyWith<$Res>
    implements $OfficineDemandeCopyWith<$Res> {
  factory _$$OfficineDemandeImplCopyWith(_$OfficineDemandeImpl value,
          $Res Function(_$OfficineDemandeImpl) then) =
      __$$OfficineDemandeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool propagated,
      bool isValided,
      Officine? officine,
      Demande? demande});

  @override
  $OfficineCopyWith<$Res>? get officine;
  @override
  $DemandeCopyWith<$Res>? get demande;
}

/// @nodoc
class __$$OfficineDemandeImplCopyWithImpl<$Res>
    extends _$OfficineDemandeCopyWithImpl<$Res, _$OfficineDemandeImpl>
    implements _$$OfficineDemandeImplCopyWith<$Res> {
  __$$OfficineDemandeImplCopyWithImpl(
      _$OfficineDemandeImpl _value, $Res Function(_$OfficineDemandeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? propagated = null,
    Object? isValided = null,
    Object? officine = freezed,
    Object? demande = freezed,
  }) {
    return _then(_$OfficineDemandeImpl(
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
      propagated: null == propagated
          ? _value.propagated
          : propagated // ignore: cast_nullable_to_non_nullable
              as bool,
      isValided: null == isValided
          ? _value.isValided
          : isValided // ignore: cast_nullable_to_non_nullable
              as bool,
      officine: freezed == officine
          ? _value.officine
          : officine // ignore: cast_nullable_to_non_nullable
              as Officine?,
      demande: freezed == demande
          ? _value.demande
          : demande // ignore: cast_nullable_to_non_nullable
              as Demande?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficineDemandeImpl
    with DiagnosticableTreeMixin
    implements _OfficineDemande {
  const _$OfficineDemandeImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.propagated = false,
      this.isValided = false,
      this.officine,
      this.demande});

  factory _$OfficineDemandeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficineDemandeImplFromJson(json);

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
  final bool propagated;
  @override
  @JsonKey()
  final bool isValided;
  @override
  final Officine? officine;
  @override
  final Demande? demande;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfficineDemande(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, propagated: $propagated, isValided: $isValided, officine: $officine, demande: $demande)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfficineDemande'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('propagated', propagated))
      ..add(DiagnosticsProperty('isValided', isValided))
      ..add(DiagnosticsProperty('officine', officine))
      ..add(DiagnosticsProperty('demande', demande));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficineDemandeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.propagated, propagated) ||
                other.propagated == propagated) &&
            (identical(other.isValided, isValided) ||
                other.isValided == isValided) &&
            (identical(other.officine, officine) ||
                other.officine == officine) &&
            (identical(other.demande, demande) || other.demande == demande));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      propagated, isValided, officine, demande);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficineDemandeImplCopyWith<_$OfficineDemandeImpl> get copyWith =>
      __$$OfficineDemandeImplCopyWithImpl<_$OfficineDemandeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficineDemandeImplToJson(
      this,
    );
  }
}

abstract class _OfficineDemande implements OfficineDemande {
  const factory _OfficineDemande(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final bool propagated,
      final bool isValided,
      final Officine? officine,
      final Demande? demande}) = _$OfficineDemandeImpl;

  factory _OfficineDemande.fromJson(Map<String, dynamic> json) =
      _$OfficineDemandeImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  bool get propagated;
  @override
  bool get isValided;
  @override
  Officine? get officine;
  @override
  Demande? get demande;
  @override
  @JsonKey(ignore: true)
  _$$OfficineDemandeImplCopyWith<_$OfficineDemandeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
