// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Demande.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Demande _$DemandeFromJson(Map<String, dynamic> json) {
  return _Demande.fromJson(json);
}

/// @nodoc
mixin _$Demande {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  String get ordonnance => throw _privateConstructorUsedError;
  String get base64 => throw _privateConstructorUsedError;
  String get commentaire => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  bool get propagating => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  bool get isSatisfied => throw _privateConstructorUsedError;
  Utilisateur? get utilisateur => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DemandeCopyWith<Demande> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemandeCopyWith<$Res> {
  factory $DemandeCopyWith(Demande value, $Res Function(Demande) then) =
      _$DemandeCopyWithImpl<$Res, Demande>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      String ordonnance,
      String base64,
      String commentaire,
      double lat,
      double lon,
      bool propagating,
      bool isFinished,
      bool isSatisfied,
      Utilisateur? utilisateur});

  $UtilisateurCopyWith<$Res>? get utilisateur;
}

/// @nodoc
class _$DemandeCopyWithImpl<$Res, $Val extends Demande>
    implements $DemandeCopyWith<$Res> {
  _$DemandeCopyWithImpl(this._value, this._then);

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
    Object? ordonnance = null,
    Object? base64 = null,
    Object? commentaire = null,
    Object? lat = null,
    Object? lon = null,
    Object? propagating = null,
    Object? isFinished = null,
    Object? isSatisfied = null,
    Object? utilisateur = freezed,
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
      ordonnance: null == ordonnance
          ? _value.ordonnance
          : ordonnance // ignore: cast_nullable_to_non_nullable
              as String,
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      propagating: null == propagating
          ? _value.propagating
          : propagating // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      isSatisfied: null == isSatisfied
          ? _value.isSatisfied
          : isSatisfied // ignore: cast_nullable_to_non_nullable
              as bool,
      utilisateur: freezed == utilisateur
          ? _value.utilisateur
          : utilisateur // ignore: cast_nullable_to_non_nullable
              as Utilisateur?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UtilisateurCopyWith<$Res>? get utilisateur {
    if (_value.utilisateur == null) {
      return null;
    }

    return $UtilisateurCopyWith<$Res>(_value.utilisateur!, (value) {
      return _then(_value.copyWith(utilisateur: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DemandeImplCopyWith<$Res> implements $DemandeCopyWith<$Res> {
  factory _$$DemandeImplCopyWith(
          _$DemandeImpl value, $Res Function(_$DemandeImpl) then) =
      __$$DemandeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool status,
      String ordonnance,
      String base64,
      String commentaire,
      double lat,
      double lon,
      bool propagating,
      bool isFinished,
      bool isSatisfied,
      Utilisateur? utilisateur});

  @override
  $UtilisateurCopyWith<$Res>? get utilisateur;
}

/// @nodoc
class __$$DemandeImplCopyWithImpl<$Res>
    extends _$DemandeCopyWithImpl<$Res, _$DemandeImpl>
    implements _$$DemandeImplCopyWith<$Res> {
  __$$DemandeImplCopyWithImpl(
      _$DemandeImpl _value, $Res Function(_$DemandeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? status = null,
    Object? ordonnance = null,
    Object? base64 = null,
    Object? commentaire = null,
    Object? lat = null,
    Object? lon = null,
    Object? propagating = null,
    Object? isFinished = null,
    Object? isSatisfied = null,
    Object? utilisateur = freezed,
  }) {
    return _then(_$DemandeImpl(
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
      ordonnance: null == ordonnance
          ? _value.ordonnance
          : ordonnance // ignore: cast_nullable_to_non_nullable
              as String,
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      propagating: null == propagating
          ? _value.propagating
          : propagating // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      isSatisfied: null == isSatisfied
          ? _value.isSatisfied
          : isSatisfied // ignore: cast_nullable_to_non_nullable
              as bool,
      utilisateur: freezed == utilisateur
          ? _value.utilisateur
          : utilisateur // ignore: cast_nullable_to_non_nullable
              as Utilisateur?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DemandeImpl with DiagnosticableTreeMixin implements _Demande {
  const _$DemandeImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.status = false,
      this.ordonnance = "",
      this.base64 = "",
      this.commentaire = "",
      this.lat = 0.0,
      this.lon = 0.0,
      this.propagating = false,
      this.isFinished = false,
      this.isSatisfied = false,
      this.utilisateur});

  factory _$DemandeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DemandeImplFromJson(json);

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
  final String ordonnance;
  @override
  @JsonKey()
  final String base64;
  @override
  @JsonKey()
  final String commentaire;
  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lon;
  @override
  @JsonKey()
  final bool propagating;
  @override
  @JsonKey()
  final bool isFinished;
  @override
  @JsonKey()
  final bool isSatisfied;
  @override
  final Utilisateur? utilisateur;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Demande(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, status: $status, ordonnance: $ordonnance, base64: $base64, commentaire: $commentaire, lat: $lat, lon: $lon, propagating: $propagating, isFinished: $isFinished, isSatisfied: $isSatisfied, utilisateur: $utilisateur)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Demande'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('ordonnance', ordonnance))
      ..add(DiagnosticsProperty('base64', base64))
      ..add(DiagnosticsProperty('commentaire', commentaire))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lon', lon))
      ..add(DiagnosticsProperty('propagating', propagating))
      ..add(DiagnosticsProperty('isFinished', isFinished))
      ..add(DiagnosticsProperty('isSatisfied', isSatisfied))
      ..add(DiagnosticsProperty('utilisateur', utilisateur));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemandeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ordonnance, ordonnance) ||
                other.ordonnance == ordonnance) &&
            (identical(other.base64, base64) || other.base64 == base64) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.propagating, propagating) ||
                other.propagating == propagating) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.isSatisfied, isSatisfied) ||
                other.isSatisfied == isSatisfied) &&
            (identical(other.utilisateur, utilisateur) ||
                other.utilisateur == utilisateur));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updateAt,
      deleted,
      status,
      ordonnance,
      base64,
      commentaire,
      lat,
      lon,
      propagating,
      isFinished,
      isSatisfied,
      utilisateur);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DemandeImplCopyWith<_$DemandeImpl> get copyWith =>
      __$$DemandeImplCopyWithImpl<_$DemandeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DemandeImplToJson(
      this,
    );
  }
}

abstract class _Demande implements Demande {
  const factory _Demande(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final bool status,
      final String ordonnance,
      final String base64,
      final String commentaire,
      final double lat,
      final double lon,
      final bool propagating,
      final bool isFinished,
      final bool isSatisfied,
      final Utilisateur? utilisateur}) = _$DemandeImpl;

  factory _Demande.fromJson(Map<String, dynamic> json) = _$DemandeImpl.fromJson;

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
  String get ordonnance;
  @override
  String get base64;
  @override
  String get commentaire;
  @override
  double get lat;
  @override
  double get lon;
  @override
  bool get propagating;
  @override
  bool get isFinished;
  @override
  bool get isSatisfied;
  @override
  Utilisateur? get utilisateur;
  @override
  @JsonKey(ignore: true)
  _$$DemandeImplCopyWith<_$DemandeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
