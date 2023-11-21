// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SMS.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SMS _$SMSFromJson(Map<String, dynamic> json) {
  return _SMS.fromJson(json);
}

/// @nodoc
mixin _$SMS {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  bool get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SMSCopyWith<SMS> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SMSCopyWith<$Res> {
  factory $SMSCopyWith(SMS value, $Res Function(SMS) then) =
      _$SMSCopyWithImpl<$Res, SMS>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String token,
      String message,
      String number,
      bool stats});
}

/// @nodoc
class _$SMSCopyWithImpl<$Res, $Val extends SMS> implements $SMSCopyWith<$Res> {
  _$SMSCopyWithImpl(this._value, this._then);

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
    Object? token = null,
    Object? message = null,
    Object? number = null,
    Object? stats = null,
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
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SMSImplCopyWith<$Res> implements $SMSCopyWith<$Res> {
  factory _$$SMSImplCopyWith(_$SMSImpl value, $Res Function(_$SMSImpl) then) =
      __$$SMSImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String token,
      String message,
      String number,
      bool stats});
}

/// @nodoc
class __$$SMSImplCopyWithImpl<$Res> extends _$SMSCopyWithImpl<$Res, _$SMSImpl>
    implements _$$SMSImplCopyWith<$Res> {
  __$$SMSImplCopyWithImpl(_$SMSImpl _value, $Res Function(_$SMSImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? token = null,
    Object? message = null,
    Object? number = null,
    Object? stats = null,
  }) {
    return _then(_$SMSImpl(
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
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SMSImpl with DiagnosticableTreeMixin implements _SMS {
  const _$SMSImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.token = "",
      this.message = "",
      this.number = "",
      this.stats = false});

  factory _$SMSImpl.fromJson(Map<String, dynamic> json) =>
      _$$SMSImplFromJson(json);

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
  final String token;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String number;
  @override
  @JsonKey()
  final bool stats;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SMS(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, token: $token, message: $message, number: $number, stats: $stats)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SMS'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('stats', stats));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SMSImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      token, message, number, stats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SMSImplCopyWith<_$SMSImpl> get copyWith =>
      __$$SMSImplCopyWithImpl<_$SMSImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SMSImplToJson(
      this,
    );
  }
}

abstract class _SMS implements SMS {
  const factory _SMS(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final String token,
      final String message,
      final String number,
      final bool stats}) = _$SMSImpl;

  factory _SMS.fromJson(Map<String, dynamic> json) = _$SMSImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  String get token;
  @override
  String get message;
  @override
  String get number;
  @override
  bool get stats;
  @override
  @JsonKey(ignore: true)
  _$$SMSImplCopyWith<_$SMSImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
