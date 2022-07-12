// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rover_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoverLocation {
  String get roverId => throw _privateConstructorUsedError;
  LatLng get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoverLocationCopyWith<RoverLocation> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverLocationCopyWith<$Res> {
  factory $RoverLocationCopyWith(RoverLocation value, $Res Function(RoverLocation) then) = _$RoverLocationCopyWithImpl<$Res>;
  $Res call({String roverId, LatLng location});
}

/// @nodoc
class _$RoverLocationCopyWithImpl<$Res> implements $RoverLocationCopyWith<$Res> {
  _$RoverLocationCopyWithImpl(this._value, this._then);

  final RoverLocation _value;
  // ignore: unused_field
  final $Res Function(RoverLocation) _then;

  @override
  $Res call({
    Object? roverId = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      roverId: roverId == freezed
          ? _value.roverId
          : roverId // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
abstract class _$$_RoverLocationCopyWith<$Res> implements $RoverLocationCopyWith<$Res> {
  factory _$$_RoverLocationCopyWith(_$_RoverLocation value, $Res Function(_$_RoverLocation) then) =
      __$$_RoverLocationCopyWithImpl<$Res>;
  @override
  $Res call({String roverId, LatLng location});
}

/// @nodoc
class __$$_RoverLocationCopyWithImpl<$Res> extends _$RoverLocationCopyWithImpl<$Res> implements _$$_RoverLocationCopyWith<$Res> {
  __$$_RoverLocationCopyWithImpl(_$_RoverLocation _value, $Res Function(_$_RoverLocation) _then)
      : super(_value, (v) => _then(v as _$_RoverLocation));

  @override
  _$_RoverLocation get _value => super._value as _$_RoverLocation;

  @override
  $Res call({
    Object? roverId = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_RoverLocation(
      roverId: roverId == freezed
          ? _value.roverId
          : roverId // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_RoverLocation implements _RoverLocation {
  const _$_RoverLocation({this.roverId = "unknown", required this.location});

  @override
  @JsonKey()
  final String roverId;
  @override
  final LatLng location;

  @override
  String toString() {
    return 'RoverLocation(roverId: $roverId, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverLocation &&
            const DeepCollectionEquality().equals(other.roverId, roverId) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(roverId), const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_RoverLocationCopyWith<_$_RoverLocation> get copyWith => __$$_RoverLocationCopyWithImpl<_$_RoverLocation>(this, _$identity);
}

abstract class _RoverLocation implements RoverLocation {
  const factory _RoverLocation({final String roverId, required final LatLng location}) = _$_RoverLocation;

  @override
  String get roverId => throw _privateConstructorUsedError;
  @override
  LatLng get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverLocationCopyWith<_$_RoverLocation> get copyWith => throw _privateConstructorUsedError;
}
