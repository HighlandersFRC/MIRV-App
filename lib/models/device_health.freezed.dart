// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_health.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceHealth _$DeviceHealthFromJson(Map<String, dynamic> json) {
  return _DeviceHealth.fromJson(json);
}

/// @nodoc
mixin _$DeviceHealth {
  DeviceHealthType get health => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceHealthCopyWith<DeviceHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceHealthCopyWith<$Res> {
  factory $DeviceHealthCopyWith(
          DeviceHealth value, $Res Function(DeviceHealth) then) =
      _$DeviceHealthCopyWithImpl<$Res>;
  $Res call({DeviceHealthType health, String? details});
}

/// @nodoc
class _$DeviceHealthCopyWithImpl<$Res> implements $DeviceHealthCopyWith<$Res> {
  _$DeviceHealthCopyWithImpl(this._value, this._then);

  final DeviceHealth _value;
  // ignore: unused_field
  final $Res Function(DeviceHealth) _then;

  @override
  $Res call({
    Object? health = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as DeviceHealthType,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceHealthCopyWith<$Res>
    implements $DeviceHealthCopyWith<$Res> {
  factory _$$_DeviceHealthCopyWith(
          _$_DeviceHealth value, $Res Function(_$_DeviceHealth) then) =
      __$$_DeviceHealthCopyWithImpl<$Res>;
  @override
  $Res call({DeviceHealthType health, String? details});
}

/// @nodoc
class __$$_DeviceHealthCopyWithImpl<$Res>
    extends _$DeviceHealthCopyWithImpl<$Res>
    implements _$$_DeviceHealthCopyWith<$Res> {
  __$$_DeviceHealthCopyWithImpl(
      _$_DeviceHealth _value, $Res Function(_$_DeviceHealth) _then)
      : super(_value, (v) => _then(v as _$_DeviceHealth));

  @override
  _$_DeviceHealth get _value => super._value as _$_DeviceHealth;

  @override
  $Res call({
    Object? health = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_DeviceHealth(
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as DeviceHealthType,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceHealth implements _DeviceHealth {
  const _$_DeviceHealth(
      {this.health = DeviceHealthType.unavailable, this.details});

  factory _$_DeviceHealth.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceHealthFromJson(json);

  @override
  @JsonKey()
  final DeviceHealthType health;
  @override
  final String? details;

  @override
  String toString() {
    return 'DeviceHealth(health: $health, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceHealth &&
            const DeepCollectionEquality().equals(other.health, health) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(health),
      const DeepCollectionEquality().hash(details));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceHealthCopyWith<_$_DeviceHealth> get copyWith =>
      __$$_DeviceHealthCopyWithImpl<_$_DeviceHealth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceHealthToJson(this);
  }
}

abstract class _DeviceHealth implements DeviceHealth {
  const factory _DeviceHealth(
      {final DeviceHealthType health, final String? details}) = _$_DeviceHealth;

  factory _DeviceHealth.fromJson(Map<String, dynamic> json) =
      _$_DeviceHealth.fromJson;

  @override
  DeviceHealthType get health => throw _privateConstructorUsedError;
  @override
  String? get details => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceHealthCopyWith<_$_DeviceHealth> get copyWith =>
      throw _privateConstructorUsedError;
}
