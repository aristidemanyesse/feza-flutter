// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Officine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Officine _$OfficineFromJson(Map<String, dynamic> json) {
  return _Officine.fromJson(json);
}

/// @nodoc
mixin _$Officine {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get localisation => throw _privateConstructorUsedError;
  String get geometryJson => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get contact2 => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get image2 => throw _privateConstructorUsedError;
  String get image3 => throw _privateConstructorUsedError;
  TypeOfficine? get type => throw _privateConstructorUsedError;
  Circonscription? get circonscription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficineCopyWith<Officine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficineCopyWith<$Res> {
  factory $OfficineCopyWith(Officine value, $Res Function(Officine) then) =
      _$OfficineCopyWithImpl<$Res, Officine>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      double lon,
      double lat,
      String name,
      String localisation,
      String geometryJson,
      String contact,
      String contact2,
      String image,
      String image2,
      String image3,
      TypeOfficine? type,
      Circonscription? circonscription});

  $TypeOfficineCopyWith<$Res>? get type;
  $CirconscriptionCopyWith<$Res>? get circonscription;
}

/// @nodoc
class _$OfficineCopyWithImpl<$Res, $Val extends Officine>
    implements $OfficineCopyWith<$Res> {
  _$OfficineCopyWithImpl(this._value, this._then);

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
    Object? name = null,
    Object? localisation = null,
    Object? geometryJson = null,
    Object? contact = null,
    Object? contact2 = null,
    Object? image = null,
    Object? image2 = null,
    Object? image3 = null,
    Object? type = freezed,
    Object? circonscription = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localisation: null == localisation
          ? _value.localisation
          : localisation // ignore: cast_nullable_to_non_nullable
              as String,
      geometryJson: null == geometryJson
          ? _value.geometryJson
          : geometryJson // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      contact2: null == contact2
          ? _value.contact2
          : contact2 // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      image2: null == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as String,
      image3: null == image3
          ? _value.image3
          : image3 // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeOfficine?,
      circonscription: freezed == circonscription
          ? _value.circonscription
          : circonscription // ignore: cast_nullable_to_non_nullable
              as Circonscription?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeOfficineCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $TypeOfficineCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CirconscriptionCopyWith<$Res>? get circonscription {
    if (_value.circonscription == null) {
      return null;
    }

    return $CirconscriptionCopyWith<$Res>(_value.circonscription!, (value) {
      return _then(_value.copyWith(circonscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfficineImplCopyWith<$Res>
    implements $OfficineCopyWith<$Res> {
  factory _$$OfficineImplCopyWith(
          _$OfficineImpl value, $Res Function(_$OfficineImpl) then) =
      __$$OfficineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      double lon,
      double lat,
      String name,
      String localisation,
      String geometryJson,
      String contact,
      String contact2,
      String image,
      String image2,
      String image3,
      TypeOfficine? type,
      Circonscription? circonscription});

  @override
  $TypeOfficineCopyWith<$Res>? get type;
  @override
  $CirconscriptionCopyWith<$Res>? get circonscription;
}

/// @nodoc
class __$$OfficineImplCopyWithImpl<$Res>
    extends _$OfficineCopyWithImpl<$Res, _$OfficineImpl>
    implements _$$OfficineImplCopyWith<$Res> {
  __$$OfficineImplCopyWithImpl(
      _$OfficineImpl _value, $Res Function(_$OfficineImpl) _then)
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
    Object? name = null,
    Object? localisation = null,
    Object? geometryJson = null,
    Object? contact = null,
    Object? contact2 = null,
    Object? image = null,
    Object? image2 = null,
    Object? image3 = null,
    Object? type = freezed,
    Object? circonscription = freezed,
  }) {
    return _then(_$OfficineImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localisation: null == localisation
          ? _value.localisation
          : localisation // ignore: cast_nullable_to_non_nullable
              as String,
      geometryJson: null == geometryJson
          ? _value.geometryJson
          : geometryJson // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      contact2: null == contact2
          ? _value.contact2
          : contact2 // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      image2: null == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as String,
      image3: null == image3
          ? _value.image3
          : image3 // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeOfficine?,
      circonscription: freezed == circonscription
          ? _value.circonscription
          : circonscription // ignore: cast_nullable_to_non_nullable
              as Circonscription?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficineImpl with DiagnosticableTreeMixin implements _Officine {
  const _$OfficineImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.lon = 0.0,
      this.lat = 0.0,
      this.name = "",
      this.localisation = "",
      this.geometryJson = "",
      this.contact = "",
      this.contact2 = "",
      this.image = "",
      this.image2 = "",
      this.image3 = "",
      this.type,
      this.circonscription});

  factory _$OfficineImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficineImplFromJson(json);

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
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String localisation;
  @override
  @JsonKey()
  final String geometryJson;
  @override
  @JsonKey()
  final String contact;
  @override
  @JsonKey()
  final String contact2;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String image2;
  @override
  @JsonKey()
  final String image3;
  @override
  final TypeOfficine? type;
  @override
  final Circonscription? circonscription;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Officine(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, lon: $lon, lat: $lat, name: $name, localisation: $localisation, geometryJson: $geometryJson, contact: $contact, contact2: $contact2, image: $image, image2: $image2, image3: $image3, type: $type, circonscription: $circonscription)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Officine'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('lon', lon))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('localisation', localisation))
      ..add(DiagnosticsProperty('geometryJson', geometryJson))
      ..add(DiagnosticsProperty('contact', contact))
      ..add(DiagnosticsProperty('contact2', contact2))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('image2', image2))
      ..add(DiagnosticsProperty('image3', image3))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('circonscription', circonscription));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localisation, localisation) ||
                other.localisation == localisation) &&
            (identical(other.geometryJson, geometryJson) ||
                other.geometryJson == geometryJson) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.contact2, contact2) ||
                other.contact2 == contact2) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.image2, image2) || other.image2 == image2) &&
            (identical(other.image3, image3) || other.image3 == image3) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.circonscription, circonscription) ||
                other.circonscription == circonscription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updateAt,
      deleted,
      lon,
      lat,
      name,
      localisation,
      geometryJson,
      contact,
      contact2,
      image,
      image2,
      image3,
      type,
      circonscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficineImplCopyWith<_$OfficineImpl> get copyWith =>
      __$$OfficineImplCopyWithImpl<_$OfficineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficineImplToJson(
      this,
    );
  }
}

abstract class _Officine implements Officine {
  const factory _Officine(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final double lon,
      final double lat,
      final String name,
      final String localisation,
      final String geometryJson,
      final String contact,
      final String contact2,
      final String image,
      final String image2,
      final String image3,
      final TypeOfficine? type,
      final Circonscription? circonscription}) = _$OfficineImpl;

  factory _Officine.fromJson(Map<String, dynamic> json) =
      _$OfficineImpl.fromJson;

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
  String get name;
  @override
  String get localisation;
  @override
  String get geometryJson;
  @override
  String get contact;
  @override
  String get contact2;
  @override
  String get image;
  @override
  String get image2;
  @override
  String get image3;
  @override
  TypeOfficine? get type;
  @override
  Circonscription? get circonscription;
  @override
  @JsonKey(ignore: true)
  _$$OfficineImplCopyWith<_$OfficineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
