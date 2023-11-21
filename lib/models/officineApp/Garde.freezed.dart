// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Garde.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Garde _$GardeFromJson(Map<String, dynamic> json) {
  return _Garde.fromJson(json);
}

/// @nodoc
mixin _$Garde {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get debut => throw _privateConstructorUsedError;
  String get fin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GardeCopyWith<Garde> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GardeCopyWith<$Res> {
  factory $GardeCopyWith(Garde value, $Res Function(Garde) then) =
      _$GardeCopyWithImpl<$Res, Garde>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String debut,
      String fin});
}

/// @nodoc
class _$GardeCopyWithImpl<$Res, $Val extends Garde>
    implements $GardeCopyWith<$Res> {
  _$GardeCopyWithImpl(this._value, this._then);

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
    Object? debut = null,
    Object? fin = null,
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
      debut: null == debut
          ? _value.debut
          : debut // ignore: cast_nullable_to_non_nullable
              as String,
      fin: null == fin
          ? _value.fin
          : fin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GardeImplCopyWith<$Res> implements $GardeCopyWith<$Res> {
  factory _$$GardeImplCopyWith(
          _$GardeImpl value, $Res Function(_$GardeImpl) then) =
      __$$GardeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String debut,
      String fin});
}

/// @nodoc
class __$$GardeImplCopyWithImpl<$Res>
    extends _$GardeCopyWithImpl<$Res, _$GardeImpl>
    implements _$$GardeImplCopyWith<$Res> {
  __$$GardeImplCopyWithImpl(
      _$GardeImpl _value, $Res Function(_$GardeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? debut = null,
    Object? fin = null,
  }) {
    return _then(_$GardeImpl(
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
      debut: null == debut
          ? _value.debut
          : debut // ignore: cast_nullable_to_non_nullable
              as String,
      fin: null == fin
          ? _value.fin
          : fin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GardeImpl with DiagnosticableTreeMixin implements _Garde {
  const _$GardeImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.debut = "",
      this.fin = ""});

  factory _$GardeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GardeImplFromJson(json);

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
  final String debut;
  @override
  @JsonKey()
  final String fin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Garde(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, debut: $debut, fin: $fin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Garde'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('debut', debut))
      ..add(DiagnosticsProperty('fin', fin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GardeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.debut, debut) || other.debut == debut) &&
            (identical(other.fin, fin) || other.fin == fin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updateAt, deleted, debut, fin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GardeImplCopyWith<_$GardeImpl> get copyWith =>
      __$$GardeImplCopyWithImpl<_$GardeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GardeImplToJson(
      this,
    );
  }
}

abstract class _Garde implements Garde {
  const factory _Garde(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final String debut,
      final String fin}) = _$GardeImpl;

  factory _Garde.fromJson(Map<String, dynamic> json) = _$GardeImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  String get debut;
  @override
  String get fin;
  @override
  @JsonKey(ignore: true)
  _$$GardeImplCopyWith<_$GardeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
