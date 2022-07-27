// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'garage_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GarageMetrics _$GarageMetricsFromJson(Map<String, dynamic> json) {
  return _GarageMetrics.fromJson(json);
}

/// @nodoc
mixin _$GarageMetrics {
  String get garage_id => throw _privateConstructorUsedError;
  String? get linked_rover_id => throw _privateConstructorUsedError;
  GarageStateType get state => throw _privateConstructorUsedError;
  GarageStatusType get status => throw _privateConstructorUsedError;
  GarageMetricHealth get health => throw _privateConstructorUsedError;
  DeviceLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarageMetricsCopyWith<GarageMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarageMetricsCopyWith<$Res> {
  factory $GarageMetricsCopyWith(
          GarageMetrics value, $Res Function(GarageMetrics) then) =
      _$GarageMetricsCopyWithImpl<$Res>;
  $Res call(
      {String garage_id,
      String? linked_rover_id,
      GarageStateType state,
      GarageStatusType status,
      GarageMetricHealth health,
      DeviceLocation location});

  $GarageMetricHealthCopyWith<$Res> get health;
  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$GarageMetricsCopyWithImpl<$Res>
    implements $GarageMetricsCopyWith<$Res> {
  _$GarageMetricsCopyWithImpl(this._value, this._then);

  final GarageMetrics _value;
  // ignore: unused_field
  final $Res Function(GarageMetrics) _then;

  @override
  $Res call({
    Object? garage_id = freezed,
    Object? linked_rover_id = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? health = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      linked_rover_id: linked_rover_id == freezed
          ? _value.linked_rover_id
          : linked_rover_id // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GarageStatusType,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as GarageMetricHealth,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DeviceLocation,
    ));
  }

  @override
  $GarageMetricHealthCopyWith<$Res> get health {
    return $GarageMetricHealthCopyWith<$Res>(_value.health, (value) {
      return _then(_value.copyWith(health: value));
    });
  }

  @override
  $DeviceLocationCopyWith<$Res> get location {
    return $DeviceLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_GarageMetricsCopyWith<$Res>
    implements $GarageMetricsCopyWith<$Res> {
  factory _$$_GarageMetricsCopyWith(
          _$_GarageMetrics value, $Res Function(_$_GarageMetrics) then) =
      __$$_GarageMetricsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String garage_id,
      String? linked_rover_id,
      GarageStateType state,
      GarageStatusType status,
      GarageMetricHealth health,
      DeviceLocation location});

  @override
  $GarageMetricHealthCopyWith<$Res> get health;
  @override
  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_GarageMetricsCopyWithImpl<$Res>
    extends _$GarageMetricsCopyWithImpl<$Res>
    implements _$$_GarageMetricsCopyWith<$Res> {
  __$$_GarageMetricsCopyWithImpl(
      _$_GarageMetrics _value, $Res Function(_$_GarageMetrics) _then)
      : super(_value, (v) => _then(v as _$_GarageMetrics));

  @override
  _$_GarageMetrics get _value => super._value as _$_GarageMetrics;

  @override
  $Res call({
    Object? garage_id = freezed,
    Object? linked_rover_id = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? health = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_GarageMetrics(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      linked_rover_id: linked_rover_id == freezed
          ? _value.linked_rover_id
          : linked_rover_id // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GarageStatusType,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as GarageMetricHealth,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DeviceLocation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GarageMetrics implements _GarageMetrics {
  const _$_GarageMetrics(
      {required this.garage_id,
      this.linked_rover_id,
      required this.state,
      this.status = GarageStatusType.available,
      this.health = const GarageMetricHealth(),
      required this.location});

  factory _$_GarageMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_GarageMetricsFromJson(json);

  @override
  final String garage_id;
  @override
  final String? linked_rover_id;
  @override
  final GarageStateType state;
  @override
  @JsonKey()
  final GarageStatusType status;
  @override
  @JsonKey()
  final GarageMetricHealth health;
  @override
  final DeviceLocation location;

  @override
  String toString() {
    return 'GarageMetrics(garage_id: $garage_id, linked_rover_id: $linked_rover_id, state: $state, status: $status, health: $health, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GarageMetrics &&
            const DeepCollectionEquality().equals(other.garage_id, garage_id) &&
            const DeepCollectionEquality()
                .equals(other.linked_rover_id, linked_rover_id) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.health, health) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(garage_id),
      const DeepCollectionEquality().hash(linked_rover_id),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(health),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_GarageMetricsCopyWith<_$_GarageMetrics> get copyWith =>
      __$$_GarageMetricsCopyWithImpl<_$_GarageMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GarageMetricsToJson(this);
  }
}

abstract class _GarageMetrics implements GarageMetrics {
  const factory _GarageMetrics(
      {required final String garage_id,
      final String? linked_rover_id,
      required final GarageStateType state,
      final GarageStatusType status,
      final GarageMetricHealth health,
      required final DeviceLocation location}) = _$_GarageMetrics;

  factory _GarageMetrics.fromJson(Map<String, dynamic> json) =
      _$_GarageMetrics.fromJson;

  @override
  String get garage_id => throw _privateConstructorUsedError;
  @override
  String? get linked_rover_id => throw _privateConstructorUsedError;
  @override
  GarageStateType get state => throw _privateConstructorUsedError;
  @override
  GarageStatusType get status => throw _privateConstructorUsedError;
  @override
  GarageMetricHealth get health => throw _privateConstructorUsedError;
  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageMetricsCopyWith<_$_GarageMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

GarageMetricHealth _$GarageMetricHealthFromJson(Map<String, dynamic> json) {
  return _GarageMetricHealth.fromJson(json);
}

/// @nodoc
mixin _$GarageMetricHealth {
  DeviceHealthType get motor_controllers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarageMetricHealthCopyWith<GarageMetricHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarageMetricHealthCopyWith<$Res> {
  factory $GarageMetricHealthCopyWith(
          GarageMetricHealth value, $Res Function(GarageMetricHealth) then) =
      _$GarageMetricHealthCopyWithImpl<$Res>;
  $Res call({DeviceHealthType motor_controllers});
}

/// @nodoc
class _$GarageMetricHealthCopyWithImpl<$Res>
    implements $GarageMetricHealthCopyWith<$Res> {
  _$GarageMetricHealthCopyWithImpl(this._value, this._then);

  final GarageMetricHealth _value;
  // ignore: unused_field
  final $Res Function(GarageMetricHealth) _then;

  @override
  $Res call({
    Object? motor_controllers = freezed,
  }) {
    return _then(_value.copyWith(
      motor_controllers: motor_controllers == freezed
          ? _value.motor_controllers
          : motor_controllers // ignore: cast_nullable_to_non_nullable
              as DeviceHealthType,
    ));
  }
}

/// @nodoc
abstract class _$$_GarageMetricHealthCopyWith<$Res>
    implements $GarageMetricHealthCopyWith<$Res> {
  factory _$$_GarageMetricHealthCopyWith(_$_GarageMetricHealth value,
          $Res Function(_$_GarageMetricHealth) then) =
      __$$_GarageMetricHealthCopyWithImpl<$Res>;
  @override
  $Res call({DeviceHealthType motor_controllers});
}

/// @nodoc
class __$$_GarageMetricHealthCopyWithImpl<$Res>
    extends _$GarageMetricHealthCopyWithImpl<$Res>
    implements _$$_GarageMetricHealthCopyWith<$Res> {
  __$$_GarageMetricHealthCopyWithImpl(
      _$_GarageMetricHealth _value, $Res Function(_$_GarageMetricHealth) _then)
      : super(_value, (v) => _then(v as _$_GarageMetricHealth));

  @override
  _$_GarageMetricHealth get _value => super._value as _$_GarageMetricHealth;

  @override
  $Res call({
    Object? motor_controllers = freezed,
  }) {
    return _then(_$_GarageMetricHealth(
      motor_controllers: motor_controllers == freezed
          ? _value.motor_controllers
          : motor_controllers // ignore: cast_nullable_to_non_nullable
              as DeviceHealthType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GarageMetricHealth implements _GarageMetricHealth {
  const _$_GarageMetricHealth(
      {this.motor_controllers = DeviceHealthType.unavailable});

  factory _$_GarageMetricHealth.fromJson(Map<String, dynamic> json) =>
      _$$_GarageMetricHealthFromJson(json);

  @override
  @JsonKey()
  final DeviceHealthType motor_controllers;

  @override
  String toString() {
    return 'GarageMetricHealth(motor_controllers: $motor_controllers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GarageMetricHealth &&
            const DeepCollectionEquality()
                .equals(other.motor_controllers, motor_controllers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(motor_controllers));

  @JsonKey(ignore: true)
  @override
  _$$_GarageMetricHealthCopyWith<_$_GarageMetricHealth> get copyWith =>
      __$$_GarageMetricHealthCopyWithImpl<_$_GarageMetricHealth>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GarageMetricHealthToJson(this);
  }
}

abstract class _GarageMetricHealth implements GarageMetricHealth {
  const factory _GarageMetricHealth(
      {final DeviceHealthType motor_controllers}) = _$_GarageMetricHealth;

  factory _GarageMetricHealth.fromJson(Map<String, dynamic> json) =
      _$_GarageMetricHealth.fromJson;

  @override
  DeviceHealthType get motor_controllers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageMetricHealthCopyWith<_$_GarageMetricHealth> get copyWith =>
      throw _privateConstructorUsedError;
}
