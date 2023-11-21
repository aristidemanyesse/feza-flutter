// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Utilisateur.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Utilisateur _$UtilisateurFromJson(Map<String, dynamic> json) {
  return _Utilisateur.fromJson(json);
}

/// @nodoc
mixin _$Utilisateur {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  String get imei => throw _privateConstructorUsedError;
  bool get isValide => throw _privateConstructorUsedError;
  String get geometryJson => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  Circonscription? get circonscription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UtilisateurCopyWith<Utilisateur> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilisateurCopyWith<$Res> {
  factory $UtilisateurCopyWith(
          Utilisateur value, $Res Function(Utilisateur) then) =
      _$UtilisateurCopyWithImpl<$Res, Utilisateur>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String fullname,
      String contact,
      String otp,
      String imei,
      bool isValide,
      String geometryJson,
      String image,
      Circonscription? circonscription});

  $CirconscriptionCopyWith<$Res>? get circonscription;
}

/// @nodoc
class _$UtilisateurCopyWithImpl<$Res, $Val extends Utilisateur>
    implements $UtilisateurCopyWith<$Res> {
  _$UtilisateurCopyWithImpl(this._value, this._then);

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
    Object? fullname = null,
    Object? contact = null,
    Object? otp = null,
    Object? imei = null,
    Object? isValide = null,
    Object? geometryJson = null,
    Object? image = null,
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
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
      isValide: null == isValide
          ? _value.isValide
          : isValide // ignore: cast_nullable_to_non_nullable
              as bool,
      geometryJson: null == geometryJson
          ? _value.geometryJson
          : geometryJson // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      circonscription: freezed == circonscription
          ? _value.circonscription
          : circonscription // ignore: cast_nullable_to_non_nullable
              as Circonscription?,
    ) as $Val);
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
abstract class _$$UtilisateurImplCopyWith<$Res>
    implements $UtilisateurCopyWith<$Res> {
  factory _$$UtilisateurImplCopyWith(
          _$UtilisateurImpl value, $Res Function(_$UtilisateurImpl) then) =
      __$$UtilisateurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String fullname,
      String contact,
      String otp,
      String imei,
      bool isValide,
      String geometryJson,
      String image,
      Circonscription? circonscription});

  @override
  $CirconscriptionCopyWith<$Res>? get circonscription;
}

/// @nodoc
class __$$UtilisateurImplCopyWithImpl<$Res>
    extends _$UtilisateurCopyWithImpl<$Res, _$UtilisateurImpl>
    implements _$$UtilisateurImplCopyWith<$Res> {
  __$$UtilisateurImplCopyWithImpl(
      _$UtilisateurImpl _value, $Res Function(_$UtilisateurImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? fullname = null,
    Object? contact = null,
    Object? otp = null,
    Object? imei = null,
    Object? isValide = null,
    Object? geometryJson = null,
    Object? image = null,
    Object? circonscription = freezed,
  }) {
    return _then(_$UtilisateurImpl(
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
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
      isValide: null == isValide
          ? _value.isValide
          : isValide // ignore: cast_nullable_to_non_nullable
              as bool,
      geometryJson: null == geometryJson
          ? _value.geometryJson
          : geometryJson // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      circonscription: freezed == circonscription
          ? _value.circonscription
          : circonscription // ignore: cast_nullable_to_non_nullable
              as Circonscription?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtilisateurImpl with DiagnosticableTreeMixin implements _Utilisateur {
  const _$UtilisateurImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.fullname = "",
      this.contact = "",
      this.otp = "",
      this.imei = "",
      this.isValide = false,
      this.geometryJson = "",
      this.image = "",
      this.circonscription});

  factory _$UtilisateurImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtilisateurImplFromJson(json);

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
  final String fullname;
  @override
  @JsonKey()
  final String contact;
  @override
  @JsonKey()
  final String otp;
  @override
  @JsonKey()
  final String imei;
  @override
  @JsonKey()
  final bool isValide;
  @override
  @JsonKey()
  final String geometryJson;
  @override
  @JsonKey()
  final String image;
  @override
  final Circonscription? circonscription;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Utilisateur(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, fullname: $fullname, contact: $contact, otp: $otp, imei: $imei, isValide: $isValide, geometryJson: $geometryJson, image: $image, circonscription: $circonscription)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Utilisateur'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('fullname', fullname))
      ..add(DiagnosticsProperty('contact', contact))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('imei', imei))
      ..add(DiagnosticsProperty('isValide', isValide))
      ..add(DiagnosticsProperty('geometryJson', geometryJson))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('circonscription', circonscription));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtilisateurImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.imei, imei) || other.imei == imei) &&
            (identical(other.isValide, isValide) ||
                other.isValide == isValide) &&
            (identical(other.geometryJson, geometryJson) ||
                other.geometryJson == geometryJson) &&
            (identical(other.image, image) || other.image == image) &&
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
      fullname,
      contact,
      otp,
      imei,
      isValide,
      geometryJson,
      image,
      circonscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UtilisateurImplCopyWith<_$UtilisateurImpl> get copyWith =>
      __$$UtilisateurImplCopyWithImpl<_$UtilisateurImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtilisateurImplToJson(
      this,
    );
  }
}

abstract class _Utilisateur implements Utilisateur {
  const factory _Utilisateur(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final String fullname,
      final String contact,
      final String otp,
      final String imei,
      final bool isValide,
      final String geometryJson,
      final String image,
      final Circonscription? circonscription}) = _$UtilisateurImpl;

  factory _Utilisateur.fromJson(Map<String, dynamic> json) =
      _$UtilisateurImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  String get fullname;
  @override
  String get contact;
  @override
  String get otp;
  @override
  String get imei;
  @override
  bool get isValide;
  @override
  String get geometryJson;
  @override
  String get image;
  @override
  Circonscription? get circonscription;
  @override
  @JsonKey(ignore: true)
  _$$UtilisateurImplCopyWith<_$UtilisateurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
