// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reponse _$ReponseFromJson(Map<String, dynamic> json) {
  return _Reponse.fromJson(json);
}

/// @nodoc
mixin _$Reponse {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get commentaire => throw _privateConstructorUsedError;
  OfficineDemande? get demande => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReponseCopyWith<Reponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReponseCopyWith<$Res> {
  factory $ReponseCopyWith(Reponse value, $Res Function(Reponse) then) =
      _$ReponseCopyWithImpl<$Res, Reponse>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool read,
      int price,
      String commentaire,
      OfficineDemande? demande});

  $OfficineDemandeCopyWith<$Res>? get demande;
}

/// @nodoc
class _$ReponseCopyWithImpl<$Res, $Val extends Reponse>
    implements $ReponseCopyWith<$Res> {
  _$ReponseCopyWithImpl(this._value, this._then);

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
    Object? read = null,
    Object? price = null,
    Object? commentaire = null,
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
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ReponseImplCopyWith<$Res> implements $ReponseCopyWith<$Res> {
  factory _$$ReponseImplCopyWith(
          _$ReponseImpl value, $Res Function(_$ReponseImpl) then) =
      __$$ReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      bool read,
      int price,
      String commentaire,
      OfficineDemande? demande});

  @override
  $OfficineDemandeCopyWith<$Res>? get demande;
}

/// @nodoc
class __$$ReponseImplCopyWithImpl<$Res>
    extends _$ReponseCopyWithImpl<$Res, _$ReponseImpl>
    implements _$$ReponseImplCopyWith<$Res> {
  __$$ReponseImplCopyWithImpl(
      _$ReponseImpl _value, $Res Function(_$ReponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? read = null,
    Object? price = null,
    Object? commentaire = null,
    Object? demande = freezed,
  }) {
    return _then(_$ReponseImpl(
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
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      commentaire: null == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
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
class _$ReponseImpl with DiagnosticableTreeMixin implements _Reponse {
  const _$ReponseImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.read = false,
      this.price = 0,
      this.commentaire = "",
      this.demande});

  factory _$ReponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReponseImplFromJson(json);

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
  final bool read;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String commentaire;
  @override
  final OfficineDemande? demande;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Reponse(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, read: $read, price: $price, commentaire: $commentaire, demande: $demande)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Reponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('read', read))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('commentaire', commentaire))
      ..add(DiagnosticsProperty('demande', demande));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire) &&
            (identical(other.demande, demande) || other.demande == demande));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      read, price, commentaire, demande);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReponseImplCopyWith<_$ReponseImpl> get copyWith =>
      __$$ReponseImplCopyWithImpl<_$ReponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReponseImplToJson(
      this,
    );
  }
}

abstract class _Reponse implements Reponse {
  const factory _Reponse(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final bool read,
      final int price,
      final String commentaire,
      final OfficineDemande? demande}) = _$ReponseImpl;

  factory _Reponse.fromJson(Map<String, dynamic> json) = _$ReponseImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  bool get read;
  @override
  int get price;
  @override
  String get commentaire;
  @override
  OfficineDemande? get demande;
  @override
  @JsonKey(ignore: true)
  _$$ReponseImplCopyWith<_$ReponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
