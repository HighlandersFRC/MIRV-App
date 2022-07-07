// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pi_lit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PiLit {
  String get id => throw _privateConstructorUsedError;
  LatLng get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PiLitCopyWith<PiLit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PiLitCopyWith<$Res> {
  factory $PiLitCopyWith(PiLit value, $Res Function(PiLit) then) =
      _$PiLitCopyWithImpl<$Res>;
  $Res call({String id, LatLng location, String description});
}

/// @nodoc
class _$PiLitCopyWithImpl<$Res> implements $PiLitCopyWith<$Res> {
  _$PiLitCopyWithImpl(this._value, this._then);

  final PiLit _value;
  // ignore: unused_field
  final $Res Function(PiLit) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? location = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PiLitCopyWith<$Res> implements $PiLitCopyWith<$Res> {
  factory _$$_PiLitCopyWith(_$_PiLit value, $Res Function(_$_PiLit) then) =
      __$$_PiLitCopyWithImpl<$Res>;
  @override
  $Res call({String id, LatLng location, String description});
}

/// @nodoc
class __$$_PiLitCopyWithImpl<$Res> extends _$PiLitCopyWithImpl<$Res>
    implements _$$_PiLitCopyWith<$Res> {
  __$$_PiLitCopyWithImpl(_$_PiLit _value, $Res Function(_$_PiLit) _then)
      : super(_value, (v) => _then(v as _$_PiLit));

  @override
  _$_PiLit get _value => super._value as _$_PiLit;

  @override
  $Res call({
    Object? id = freezed,
    Object? location = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_PiLit(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PiLit with DiagnosticableTreeMixin implements _PiLit {
  const _$_PiLit(
      {required this.id, required this.location, required this.description});

  @override
  final String id;
  @override
  final LatLng location;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PiLit(id: $id, location: $location, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PiLit'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PiLit &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_PiLitCopyWith<_$_PiLit> get copyWith =>
      __$$_PiLitCopyWithImpl<_$_PiLit>(this, _$identity);
}

abstract class _PiLit implements PiLit {
  const factory _PiLit(
      {required final String id,
      required final LatLng location,
      required final String description}) = _$_PiLit;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  LatLng get location => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PiLitCopyWith<_$_PiLit> get copyWith =>
      throw _privateConstructorUsedError;
}
