// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'RdvLigneReponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RdvLigneReponse _$RdvLigneReponseFromJson(Map<String, dynamic> json) {
  return _RdvLigneReponse.fromJson(json);
}

/// @nodoc
mixin _$RdvLigneReponse {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get valide => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String get validedDate => throw _privateConstructorUsedError;
  int get days => throw _privateConstructorUsedError;
  LigneReponse? get ligne => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RdvLigneReponseCopyWith<RdvLigneReponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RdvLigneReponseCopyWith<$Res> {
  factory $RdvLigneReponseCopyWith(
          RdvLigneReponse value, $Res Function(RdvLigneReponse) then) =
      _$RdvLigneReponseCopyWithImpl<$Res, RdvLigneReponse>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool valide,
      bool read,
      String validedDate,
      int days,
      LigneReponse? ligne});

  $LigneReponseCopyWith<$Res>? get ligne;
}

/// @nodoc
class _$RdvLigneReponseCopyWithImpl<$Res, $Val extends RdvLigneReponse>
    implements $RdvLigneReponseCopyWith<$Res> {
  _$RdvLigneReponseCopyWithImpl(this._value, this._then);

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
    Object? valide = null,
    Object? read = null,
    Object? validedDate = null,
    Object? days = null,
    Object? ligne = freezed,
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
      valide: null == valide
          ? _value.valide
          : valide // ignore: cast_nullable_to_non_nullable
              as bool,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      validedDate: null == validedDate
          ? _value.validedDate
          : validedDate // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      ligne: freezed == ligne
          ? _value.ligne
          : ligne // ignore: cast_nullable_to_non_nullable
              as LigneReponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LigneReponseCopyWith<$Res>? get ligne {
    if (_value.ligne == null) {
      return null;
    }

    return $LigneReponseCopyWith<$Res>(_value.ligne!, (value) {
      return _then(_value.copyWith(ligne: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RdvLigneReponseImplCopyWith<$Res>
    implements $RdvLigneReponseCopyWith<$Res> {
  factory _$$RdvLigneReponseImplCopyWith(_$RdvLigneReponseImpl value,
          $Res Function(_$RdvLigneReponseImpl) then) =
      __$$RdvLigneReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool valide,
      bool read,
      String validedDate,
      int days,
      LigneReponse? ligne});

  @override
  $LigneReponseCopyWith<$Res>? get ligne;
}

/// @nodoc
class __$$RdvLigneReponseImplCopyWithImpl<$Res>
    extends _$RdvLigneReponseCopyWithImpl<$Res, _$RdvLigneReponseImpl>
    implements _$$RdvLigneReponseImplCopyWith<$Res> {
  __$$RdvLigneReponseImplCopyWithImpl(
      _$RdvLigneReponseImpl _value, $Res Function(_$RdvLigneReponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? valide = null,
    Object? read = null,
    Object? validedDate = null,
    Object? days = null,
    Object? ligne = freezed,
  }) {
    return _then(_$RdvLigneReponseImpl(
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
      valide: null == valide
          ? _value.valide
          : valide // ignore: cast_nullable_to_non_nullable
              as bool,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      validedDate: null == validedDate
          ? _value.validedDate
          : validedDate // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      ligne: freezed == ligne
          ? _value.ligne
          : ligne // ignore: cast_nullable_to_non_nullable
              as LigneReponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RdvLigneReponseImpl
    with DiagnosticableTreeMixin
    implements _RdvLigneReponse {
  const _$RdvLigneReponseImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.valide = false,
      this.read = false,
      this.validedDate = "",
      this.days = 0,
      this.ligne});

  factory _$RdvLigneReponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RdvLigneReponseImplFromJson(json);

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
  final bool valide;
  @override
  @JsonKey()
  final bool read;
  @override
  @JsonKey()
  final String validedDate;
  @override
  @JsonKey()
  final int days;
  @override
  final LigneReponse? ligne;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RdvLigneReponse(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, valide: $valide, read: $read, validedDate: $validedDate, days: $days, ligne: $ligne)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RdvLigneReponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('valide', valide))
      ..add(DiagnosticsProperty('read', read))
      ..add(DiagnosticsProperty('validedDate', validedDate))
      ..add(DiagnosticsProperty('days', days))
      ..add(DiagnosticsProperty('ligne', ligne));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RdvLigneReponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.valide, valide) || other.valide == valide) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.validedDate, validedDate) ||
                other.validedDate == validedDate) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.ligne, ligne) || other.ligne == ligne));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      valide, read, validedDate, days, ligne);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RdvLigneReponseImplCopyWith<_$RdvLigneReponseImpl> get copyWith =>
      __$$RdvLigneReponseImplCopyWithImpl<_$RdvLigneReponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RdvLigneReponseImplToJson(
      this,
    );
  }
}

abstract class _RdvLigneReponse implements RdvLigneReponse {
  const factory _RdvLigneReponse(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final bool valide,
      final bool read,
      final String validedDate,
      final int days,
      final LigneReponse? ligne}) = _$RdvLigneReponseImpl;

  factory _RdvLigneReponse.fromJson(Map<String, dynamic> json) =
      _$RdvLigneReponseImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  bool get valide;
  @override
  bool get read;
  @override
  String get validedDate;
  @override
  int get days;
  @override
  LigneReponse? get ligne;
  @override
  @JsonKey(ignore: true)
  _$$RdvLigneReponseImplCopyWith<_$RdvLigneReponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
