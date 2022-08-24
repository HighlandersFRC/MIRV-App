// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceLocation _$DeviceLocationFromJson(Map<String, dynamic> json) {
  return _DeviceLocation.fromJson(json);
}

/// @nodoc
mixin _$DeviceLocation {
  double get long => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceLocationCopyWith<DeviceLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceLocationCopyWith<$Res> {
  factory $DeviceLocationCopyWith(
          DeviceLocation value, $Res Function(DeviceLocation) then) =
      _$DeviceLocationCopyWithImpl<$Res>;
  $Res call({double long, double lat});
}

/// @nodoc
class _$DeviceLocationCopyWithImpl<$Res>
    implements $DeviceLocationCopyWith<$Res> {
  _$DeviceLocationCopyWithImpl(this._value, this._then);

  final DeviceLocation _value;
  // ignore: unused_field
  final $Res Function(DeviceLocation) _then;

  @override
  $Res call({
    Object? long = freezed,
    Object? lat = freezed,
  }) {
    return _then(_value.copyWith(
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceLocationCopyWith<$Res>
    implements $DeviceLocationCopyWith<$Res> {
  factory _$$_DeviceLocationCopyWith(
          _$_DeviceLocation value, $Res Function(_$_DeviceLocation) then) =
      __$$_DeviceLocationCopyWithImpl<$Res>;
  @override
  $Res call({double long, double lat});
}

/// @nodoc
class __$$_DeviceLocationCopyWithImpl<$Res>
    extends _$DeviceLocationCopyWithImpl<$Res>
    implements _$$_DeviceLocationCopyWith<$Res> {
  __$$_DeviceLocationCopyWithImpl(
      _$_DeviceLocation _value, $Res Function(_$_DeviceLocation) _then)
      : super(_value, (v) => _then(v as _$_DeviceLocation));

  @override
  _$_DeviceLocation get _value => super._value as _$_DeviceLocation;

  @override
  $Res call({
    Object? long = freezed,
    Object? lat = freezed,
  }) {
    return _then(_$_DeviceLocation(
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceLocation extends _DeviceLocation {
  const _$_DeviceLocation({this.long = 0.0, this.lat = 0.0}) : super._();

  factory _$_DeviceLocation.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceLocationFromJson(json);

  @override
  @JsonKey()
  final double long;
  @override
  @JsonKey()
  final double lat;

  @override
  String toString() {
    return 'DeviceLocation(long: $long, lat: $lat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceLocation &&
            const DeepCollectionEquality().equals(other.long, long) &&
            const DeepCollectionEquality().equals(other.lat, lat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(long),
      const DeepCollectionEquality().hash(lat));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceLocationCopyWith<_$_DeviceLocation> get copyWith =>
      __$$_DeviceLocationCopyWithImpl<_$_DeviceLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceLocationToJson(this);
  }
}

abstract class _DeviceLocation extends DeviceLocation {
  const factory _DeviceLocation({final double long, final double lat}) =
      _$_DeviceLocation;
  const _DeviceLocation._() : super._();

  factory _DeviceLocation.fromJson(Map<String, dynamic> json) =
      _$_DeviceLocation.fromJson;

  @override
  double get long => throw _privateConstructorUsedError;
  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceLocationCopyWith<_$_DeviceLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
