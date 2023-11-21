// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TypeProduit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypeProduit _$TypeProduitFromJson(Map<String, dynamic> json) {
  return _TypeProduit.fromJson(json);
}

/// @nodoc
mixin _$TypeProduit {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get etiquette => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeProduitCopyWith<TypeProduit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeProduitCopyWith<$Res> {
  factory $TypeProduitCopyWith(
          TypeProduit value, $Res Function(TypeProduit) then) =
      _$TypeProduitCopyWithImpl<$Res, TypeProduit>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String name,
      String etiquette});
}

/// @nodoc
class _$TypeProduitCopyWithImpl<$Res, $Val extends TypeProduit>
    implements $TypeProduitCopyWith<$Res> {
  _$TypeProduitCopyWithImpl(this._value, this._then);

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
    Object? name = null,
    Object? etiquette = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      etiquette: null == etiquette
          ? _value.etiquette
          : etiquette // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeProduitImplCopyWith<$Res>
    implements $TypeProduitCopyWith<$Res> {
  factory _$$TypeProduitImplCopyWith(
          _$TypeProduitImpl value, $Res Function(_$TypeProduitImpl) then) =
      __$$TypeProduitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String name,
      String etiquette});
}

/// @nodoc
class __$$TypeProduitImplCopyWithImpl<$Res>
    extends _$TypeProduitCopyWithImpl<$Res, _$TypeProduitImpl>
    implements _$$TypeProduitImplCopyWith<$Res> {
  __$$TypeProduitImplCopyWithImpl(
      _$TypeProduitImpl _value, $Res Function(_$TypeProduitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? name = null,
    Object? etiquette = null,
  }) {
    return _then(_$TypeProduitImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      etiquette: null == etiquette
          ? _value.etiquette
          : etiquette // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeProduitImpl with DiagnosticableTreeMixin implements _TypeProduit {
  const _$TypeProduitImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.name = "",
      this.etiquette = ""});

  factory _$TypeProduitImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeProduitImplFromJson(json);

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
  final String name;
  @override
  @JsonKey()
  final String etiquette;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TypeProduit(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, name: $name, etiquette: $etiquette)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TypeProduit'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('etiquette', etiquette));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeProduitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.etiquette, etiquette) ||
                other.etiquette == etiquette));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updateAt, deleted, name, etiquette);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeProduitImplCopyWith<_$TypeProduitImpl> get copyWith =>
      __$$TypeProduitImplCopyWithImpl<_$TypeProduitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeProduitImplToJson(
      this,
    );
  }
}

abstract class _TypeProduit implements TypeProduit {
  const factory _TypeProduit(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final String name,
      final String etiquette}) = _$TypeProduitImpl;

  factory _TypeProduit.fromJson(Map<String, dynamic> json) =
      _$TypeProduitImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  String get name;
  @override
  String get etiquette;
  @override
  @JsonKey(ignore: true)
  _$$TypeProduitImplCopyWith<_$TypeProduitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
