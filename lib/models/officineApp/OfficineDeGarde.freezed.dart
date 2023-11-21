// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'OfficineDeGarde.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfficineDeGarde _$OfficineDeGardeFromJson(Map<String, dynamic> json) {
  return _OfficineDeGarde.fromJson(json);
}

/// @nodoc
mixin _$OfficineDeGarde {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  Garde? get garde => throw _privateConstructorUsedError;
  Officine? get officine => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficineDeGardeCopyWith<OfficineDeGarde> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficineDeGardeCopyWith<$Res> {
  factory $OfficineDeGardeCopyWith(
          OfficineDeGarde value, $Res Function(OfficineDeGarde) then) =
      _$OfficineDeGardeCopyWithImpl<$Res, OfficineDeGarde>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      Garde? garde,
      Officine? officine});

  $GardeCopyWith<$Res>? get garde;
  $OfficineCopyWith<$Res>? get officine;
}

/// @nodoc
class _$OfficineDeGardeCopyWithImpl<$Res, $Val extends OfficineDeGarde>
    implements $OfficineDeGardeCopyWith<$Res> {
  _$OfficineDeGardeCopyWithImpl(this._value, this._then);

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
    Object? garde = freezed,
    Object? officine = freezed,
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
      garde: freezed == garde
          ? _value.garde
          : garde // ignore: cast_nullable_to_non_nullable
              as Garde?,
      officine: freezed == officine
          ? _value.officine
          : officine // ignore: cast_nullable_to_non_nullable
              as Officine?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GardeCopyWith<$Res>? get garde {
    if (_value.garde == null) {
      return null;
    }

    return $GardeCopyWith<$Res>(_value.garde!, (value) {
      return _then(_value.copyWith(garde: value) as $Val);
    });
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
}

/// @nodoc
abstract class _$$OfficineDeGardeImplCopyWith<$Res>
    implements $OfficineDeGardeCopyWith<$Res> {
  factory _$$OfficineDeGardeImplCopyWith(_$OfficineDeGardeImpl value,
          $Res Function(_$OfficineDeGardeImpl) then) =
      __$$OfficineDeGardeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      Garde? garde,
      Officine? officine});

  @override
  $GardeCopyWith<$Res>? get garde;
  @override
  $OfficineCopyWith<$Res>? get officine;
}

/// @nodoc
class __$$OfficineDeGardeImplCopyWithImpl<$Res>
    extends _$OfficineDeGardeCopyWithImpl<$Res, _$OfficineDeGardeImpl>
    implements _$$OfficineDeGardeImplCopyWith<$Res> {
  __$$OfficineDeGardeImplCopyWithImpl(
      _$OfficineDeGardeImpl _value, $Res Function(_$OfficineDeGardeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? garde = freezed,
    Object? officine = freezed,
  }) {
    return _then(_$OfficineDeGardeImpl(
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
      garde: freezed == garde
          ? _value.garde
          : garde // ignore: cast_nullable_to_non_nullable
              as Garde?,
      officine: freezed == officine
          ? _value.officine
          : officine // ignore: cast_nullable_to_non_nullable
              as Officine?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficineDeGardeImpl
    with DiagnosticableTreeMixin
    implements _OfficineDeGarde {
  const _$OfficineDeGardeImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.garde,
      this.officine});

  factory _$OfficineDeGardeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficineDeGardeImplFromJson(json);

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
  final Garde? garde;
  @override
  final Officine? officine;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfficineDeGarde(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, garde: $garde, officine: $officine)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfficineDeGarde'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('garde', garde))
      ..add(DiagnosticsProperty('officine', officine));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficineDeGardeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.garde, garde) || other.garde == garde) &&
            (identical(other.officine, officine) ||
                other.officine == officine));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updateAt, deleted, garde, officine);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficineDeGardeImplCopyWith<_$OfficineDeGardeImpl> get copyWith =>
      __$$OfficineDeGardeImplCopyWithImpl<_$OfficineDeGardeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficineDeGardeImplToJson(
      this,
    );
  }
}

abstract class _OfficineDeGarde implements OfficineDeGarde {
  const factory _OfficineDeGarde(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final Garde? garde,
      final Officine? officine}) = _$OfficineDeGardeImpl;

  factory _OfficineDeGarde.fromJson(Map<String, dynamic> json) =
      _$OfficineDeGardeImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  Garde? get garde;
  @override
  Officine? get officine;
  @override
  @JsonKey(ignore: true)
  _$$OfficineDeGardeImplCopyWith<_$OfficineDeGardeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
