// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ResponsableOfficine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponsableOfficine _$ResponsableOfficineFromJson(Map<String, dynamic> json) {
  return _ResponsableOfficine.fromJson(json);
}

/// @nodoc
mixin _$ResponsableOfficine {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  Officine? get officine => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponsableOfficineCopyWith<ResponsableOfficine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponsableOfficineCopyWith<$Res> {
  factory $ResponsableOfficineCopyWith(
          ResponsableOfficine value, $Res Function(ResponsableOfficine) then) =
      _$ResponsableOfficineCopyWithImpl<$Res, ResponsableOfficine>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      double lon,
      double lat,
      Officine? officine});

  $OfficineCopyWith<$Res>? get officine;
}

/// @nodoc
class _$ResponsableOfficineCopyWithImpl<$Res, $Val extends ResponsableOfficine>
    implements $ResponsableOfficineCopyWith<$Res> {
  _$ResponsableOfficineCopyWithImpl(this._value, this._then);

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
    Object? lon = null,
    Object? lat = null,
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
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      officine: freezed == officine
          ? _value.officine
          : officine // ignore: cast_nullable_to_non_nullable
              as Officine?,
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
}

/// @nodoc
abstract class _$$ResponsableOfficineImplCopyWith<$Res>
    implements $ResponsableOfficineCopyWith<$Res> {
  factory _$$ResponsableOfficineImplCopyWith(_$ResponsableOfficineImpl value,
          $Res Function(_$ResponsableOfficineImpl) then) =
      __$$ResponsableOfficineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      double lon,
      double lat,
      Officine? officine});

  @override
  $OfficineCopyWith<$Res>? get officine;
}

/// @nodoc
class __$$ResponsableOfficineImplCopyWithImpl<$Res>
    extends _$ResponsableOfficineCopyWithImpl<$Res, _$ResponsableOfficineImpl>
    implements _$$ResponsableOfficineImplCopyWith<$Res> {
  __$$ResponsableOfficineImplCopyWithImpl(_$ResponsableOfficineImpl _value,
      $Res Function(_$ResponsableOfficineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? lon = null,
    Object? lat = null,
    Object? officine = freezed,
  }) {
    return _then(_$ResponsableOfficineImpl(
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
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      officine: freezed == officine
          ? _value.officine
          : officine // ignore: cast_nullable_to_non_nullable
              as Officine?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponsableOfficineImpl
    with DiagnosticableTreeMixin
    implements _ResponsableOfficine {
  const _$ResponsableOfficineImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.lon = 0.0,
      this.lat = 0.0,
      this.officine});

  factory _$ResponsableOfficineImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponsableOfficineImplFromJson(json);

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
  final double lon;
  @override
  @JsonKey()
  final double lat;
  @override
  final Officine? officine;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponsableOfficine(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, lon: $lon, lat: $lat, officine: $officine)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResponsableOfficine'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('lon', lon))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('officine', officine));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponsableOfficineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.officine, officine) ||
                other.officine == officine));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updateAt, deleted, lon, lat, officine);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponsableOfficineImplCopyWith<_$ResponsableOfficineImpl> get copyWith =>
      __$$ResponsableOfficineImplCopyWithImpl<_$ResponsableOfficineImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponsableOfficineImplToJson(
      this,
    );
  }
}

abstract class _ResponsableOfficine implements ResponsableOfficine {
  const factory _ResponsableOfficine(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final double lon,
      final double lat,
      final Officine? officine}) = _$ResponsableOfficineImpl;

  factory _ResponsableOfficine.fromJson(Map<String, dynamic> json) =
      _$ResponsableOfficineImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  double get lon;
  @override
  double get lat;
  @override
  Officine? get officine;
  @override
  @JsonKey(ignore: true)
  _$$ResponsableOfficineImplCopyWith<_$ResponsableOfficineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
