// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rover_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoverMetrics _$RoverMetricsFromJson(Map<String, dynamic> json) {
  return _RoverMetrics.fromJson(json);
}

/// @nodoc
mixin _$RoverMetrics {
  String get rover_id => throw _privateConstructorUsedError;
  RoverStateType get state =>
      throw _privateConstructorUsedError; //Rover StateType
  RoverStatusType get status =>
      throw _privateConstructorUsedError; //RoverStatusType
  int get battery_voltage => throw _privateConstructorUsedError;
  int get battery_percent => throw _privateConstructorUsedError;
  RoverMetricHealth get health => throw _privateConstructorUsedError;
  RoverMetricTelemetry get telemetry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverMetricsCopyWith<RoverMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverMetricsCopyWith<$Res> {
  factory $RoverMetricsCopyWith(
          RoverMetrics value, $Res Function(RoverMetrics) then) =
      _$RoverMetricsCopyWithImpl<$Res>;
  $Res call(
      {String rover_id,
      RoverStateType state,
      RoverStatusType status,
      int battery_voltage,
      int battery_percent,
      RoverMetricHealth health,
      RoverMetricTelemetry telemetry});

  $RoverMetricHealthCopyWith<$Res> get health;
  $RoverMetricTelemetryCopyWith<$Res> get telemetry;
}

/// @nodoc
class _$RoverMetricsCopyWithImpl<$Res> implements $RoverMetricsCopyWith<$Res> {
  _$RoverMetricsCopyWithImpl(this._value, this._then);

  final RoverMetrics _value;
  // ignore: unused_field
  final $Res Function(RoverMetrics) _then;

  @override
  $Res call({
    Object? rover_id = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? battery_voltage = freezed,
    Object? battery_percent = freezed,
    Object? health = freezed,
    Object? telemetry = freezed,
  }) {
    return _then(_value.copyWith(
      rover_id: rover_id == freezed
          ? _value.rover_id
          : rover_id // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RoverStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoverStatusType,
      battery_voltage: battery_voltage == freezed
          ? _value.battery_voltage
          : battery_voltage // ignore: cast_nullable_to_non_nullable
              as int,
      battery_percent: battery_percent == freezed
          ? _value.battery_percent
          : battery_percent // ignore: cast_nullable_to_non_nullable
              as int,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as RoverMetricHealth,
      telemetry: telemetry == freezed
          ? _value.telemetry
          : telemetry // ignore: cast_nullable_to_non_nullable
              as RoverMetricTelemetry,
    ));
  }

  @override
  $RoverMetricHealthCopyWith<$Res> get health {
    return $RoverMetricHealthCopyWith<$Res>(_value.health, (value) {
      return _then(_value.copyWith(health: value));
    });
  }

  @override
  $RoverMetricTelemetryCopyWith<$Res> get telemetry {
    return $RoverMetricTelemetryCopyWith<$Res>(_value.telemetry, (value) {
      return _then(_value.copyWith(telemetry: value));
    });
  }
}

/// @nodoc
abstract class _$$_RoverMetricsCopyWith<$Res>
    implements $RoverMetricsCopyWith<$Res> {
  factory _$$_RoverMetricsCopyWith(
          _$_RoverMetrics value, $Res Function(_$_RoverMetrics) then) =
      __$$_RoverMetricsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rover_id,
      RoverStateType state,
      RoverStatusType status,
      int battery_voltage,
      int battery_percent,
      RoverMetricHealth health,
      RoverMetricTelemetry telemetry});

  @override
  $RoverMetricHealthCopyWith<$Res> get health;
  @override
  $RoverMetricTelemetryCopyWith<$Res> get telemetry;
}

/// @nodoc
class __$$_RoverMetricsCopyWithImpl<$Res>
    extends _$RoverMetricsCopyWithImpl<$Res>
    implements _$$_RoverMetricsCopyWith<$Res> {
  __$$_RoverMetricsCopyWithImpl(
      _$_RoverMetrics _value, $Res Function(_$_RoverMetrics) _then)
      : super(_value, (v) => _then(v as _$_RoverMetrics));

  @override
  _$_RoverMetrics get _value => super._value as _$_RoverMetrics;

  @override
  $Res call({
    Object? rover_id = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? battery_voltage = freezed,
    Object? battery_percent = freezed,
    Object? health = freezed,
    Object? telemetry = freezed,
  }) {
    return _then(_$_RoverMetrics(
      rover_id: rover_id == freezed
          ? _value.rover_id
          : rover_id // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RoverStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoverStatusType,
      battery_voltage: battery_voltage == freezed
          ? _value.battery_voltage
          : battery_voltage // ignore: cast_nullable_to_non_nullable
              as int,
      battery_percent: battery_percent == freezed
          ? _value.battery_percent
          : battery_percent // ignore: cast_nullable_to_non_nullable
              as int,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as RoverMetricHealth,
      telemetry: telemetry == freezed
          ? _value.telemetry
          : telemetry // ignore: cast_nullable_to_non_nullable
              as RoverMetricTelemetry,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverMetrics implements _RoverMetrics {
  const _$_RoverMetrics(
      {required this.rover_id,
      this.state = RoverStateType.disconnected,
      this.status = RoverStatusType.available,
      this.battery_voltage = -1,
      this.battery_percent = -1,
      this.health = const RoverMetricHealth(),
      this.telemetry = const RoverMetricTelemetry()});

  factory _$_RoverMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_RoverMetricsFromJson(json);

  @override
  final String rover_id;
  @override
  @JsonKey()
  final RoverStateType state;
//Rover StateType
  @override
  @JsonKey()
  final RoverStatusType status;
//RoverStatusType
  @override
  @JsonKey()
  final int battery_voltage;
  @override
  @JsonKey()
  final int battery_percent;
  @override
  @JsonKey()
  final RoverMetricHealth health;
  @override
  @JsonKey()
  final RoverMetricTelemetry telemetry;

  @override
  String toString() {
    return 'RoverMetrics(rover_id: $rover_id, state: $state, status: $status, battery_voltage: $battery_voltage, battery_percent: $battery_percent, health: $health, telemetry: $telemetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverMetrics &&
            const DeepCollectionEquality().equals(other.rover_id, rover_id) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.battery_voltage, battery_voltage) &&
            const DeepCollectionEquality()
                .equals(other.battery_percent, battery_percent) &&
            const DeepCollectionEquality().equals(other.health, health) &&
            const DeepCollectionEquality().equals(other.telemetry, telemetry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rover_id),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(battery_voltage),
      const DeepCollectionEquality().hash(battery_percent),
      const DeepCollectionEquality().hash(health),
      const DeepCollectionEquality().hash(telemetry));

  @JsonKey(ignore: true)
  @override
  _$$_RoverMetricsCopyWith<_$_RoverMetrics> get copyWith =>
      __$$_RoverMetricsCopyWithImpl<_$_RoverMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverMetricsToJson(this);
  }
}

abstract class _RoverMetrics implements RoverMetrics {
  const factory _RoverMetrics(
      {required final String rover_id,
      final RoverStateType state,
      final RoverStatusType status,
      final int battery_voltage,
      final int battery_percent,
      final RoverMetricHealth health,
      final RoverMetricTelemetry telemetry}) = _$_RoverMetrics;

  factory _RoverMetrics.fromJson(Map<String, dynamic> json) =
      _$_RoverMetrics.fromJson;

  @override
  String get rover_id => throw _privateConstructorUsedError;
  @override
  RoverStateType get state => throw _privateConstructorUsedError;
  @override //Rover StateType
  RoverStatusType get status => throw _privateConstructorUsedError;
  @override //RoverStatusType
  int get battery_voltage => throw _privateConstructorUsedError;
  @override
  int get battery_percent => throw _privateConstructorUsedError;
  @override
  RoverMetricHealth get health => throw _privateConstructorUsedError;
  @override
  RoverMetricTelemetry get telemetry => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverMetricsCopyWith<_$_RoverMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverMetricHealth _$RoverMetricHealthFromJson(Map<String, dynamic> json) {
  return _RoverMetricHealth.fromJson(json);
}

/// @nodoc
mixin _$RoverMetricHealth {
  RoverHealthType get electronics => throw _privateConstructorUsedError;
  RoverHealthType get drivetrain => throw _privateConstructorUsedError;
  RoverHealthType get intake => throw _privateConstructorUsedError;
  RoverHealthType get sensors => throw _privateConstructorUsedError;
  RoverHealthType get garage => throw _privateConstructorUsedError;
  RoverHealthType get power => throw _privateConstructorUsedError;
  RoverHealthType get general => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverMetricHealthCopyWith<RoverMetricHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverMetricHealthCopyWith<$Res> {
  factory $RoverMetricHealthCopyWith(
          RoverMetricHealth value, $Res Function(RoverMetricHealth) then) =
      _$RoverMetricHealthCopyWithImpl<$Res>;
  $Res call(
      {RoverHealthType electronics,
      RoverHealthType drivetrain,
      RoverHealthType intake,
      RoverHealthType sensors,
      RoverHealthType garage,
      RoverHealthType power,
      RoverHealthType general});
}

/// @nodoc
class _$RoverMetricHealthCopyWithImpl<$Res>
    implements $RoverMetricHealthCopyWith<$Res> {
  _$RoverMetricHealthCopyWithImpl(this._value, this._then);

  final RoverMetricHealth _value;
  // ignore: unused_field
  final $Res Function(RoverMetricHealth) _then;

  @override
  $Res call({
    Object? electronics = freezed,
    Object? drivetrain = freezed,
    Object? intake = freezed,
    Object? sensors = freezed,
    Object? garage = freezed,
    Object? power = freezed,
    Object? general = freezed,
  }) {
    return _then(_value.copyWith(
      electronics: electronics == freezed
          ? _value.electronics
          : electronics // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      drivetrain: drivetrain == freezed
          ? _value.drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      intake: intake == freezed
          ? _value.intake
          : intake // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      sensors: sensors == freezed
          ? _value.sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      general: general == freezed
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
    ));
  }
}

/// @nodoc
abstract class _$$_RoverMetricHealthCopyWith<$Res>
    implements $RoverMetricHealthCopyWith<$Res> {
  factory _$$_RoverMetricHealthCopyWith(_$_RoverMetricHealth value,
          $Res Function(_$_RoverMetricHealth) then) =
      __$$_RoverMetricHealthCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoverHealthType electronics,
      RoverHealthType drivetrain,
      RoverHealthType intake,
      RoverHealthType sensors,
      RoverHealthType garage,
      RoverHealthType power,
      RoverHealthType general});
}

/// @nodoc
class __$$_RoverMetricHealthCopyWithImpl<$Res>
    extends _$RoverMetricHealthCopyWithImpl<$Res>
    implements _$$_RoverMetricHealthCopyWith<$Res> {
  __$$_RoverMetricHealthCopyWithImpl(
      _$_RoverMetricHealth _value, $Res Function(_$_RoverMetricHealth) _then)
      : super(_value, (v) => _then(v as _$_RoverMetricHealth));

  @override
  _$_RoverMetricHealth get _value => super._value as _$_RoverMetricHealth;

  @override
  $Res call({
    Object? electronics = freezed,
    Object? drivetrain = freezed,
    Object? intake = freezed,
    Object? sensors = freezed,
    Object? garage = freezed,
    Object? power = freezed,
    Object? general = freezed,
  }) {
    return _then(_$_RoverMetricHealth(
      electronics: electronics == freezed
          ? _value.electronics
          : electronics // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      drivetrain: drivetrain == freezed
          ? _value.drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      intake: intake == freezed
          ? _value.intake
          : intake // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      sensors: sensors == freezed
          ? _value.sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
      general: general == freezed
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as RoverHealthType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverMetricHealth implements _RoverMetricHealth {
  const _$_RoverMetricHealth(
      {this.electronics = RoverHealthType.unavailable,
      this.drivetrain = RoverHealthType.unavailable,
      this.intake = RoverHealthType.unavailable,
      this.sensors = RoverHealthType.unavailable,
      this.garage = RoverHealthType.unavailable,
      this.power = RoverHealthType.unavailable,
      this.general = RoverHealthType.unavailable});

  factory _$_RoverMetricHealth.fromJson(Map<String, dynamic> json) =>
      _$$_RoverMetricHealthFromJson(json);

  @override
  @JsonKey()
  final RoverHealthType electronics;
  @override
  @JsonKey()
  final RoverHealthType drivetrain;
  @override
  @JsonKey()
  final RoverHealthType intake;
  @override
  @JsonKey()
  final RoverHealthType sensors;
  @override
  @JsonKey()
  final RoverHealthType garage;
  @override
  @JsonKey()
  final RoverHealthType power;
  @override
  @JsonKey()
  final RoverHealthType general;

  @override
  String toString() {
    return 'RoverMetricHealth(electronics: $electronics, drivetrain: $drivetrain, intake: $intake, sensors: $sensors, garage: $garage, power: $power, general: $general)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverMetricHealth &&
            const DeepCollectionEquality()
                .equals(other.electronics, electronics) &&
            const DeepCollectionEquality()
                .equals(other.drivetrain, drivetrain) &&
            const DeepCollectionEquality().equals(other.intake, intake) &&
            const DeepCollectionEquality().equals(other.sensors, sensors) &&
            const DeepCollectionEquality().equals(other.garage, garage) &&
            const DeepCollectionEquality().equals(other.power, power) &&
            const DeepCollectionEquality().equals(other.general, general));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(electronics),
      const DeepCollectionEquality().hash(drivetrain),
      const DeepCollectionEquality().hash(intake),
      const DeepCollectionEquality().hash(sensors),
      const DeepCollectionEquality().hash(garage),
      const DeepCollectionEquality().hash(power),
      const DeepCollectionEquality().hash(general));

  @JsonKey(ignore: true)
  @override
  _$$_RoverMetricHealthCopyWith<_$_RoverMetricHealth> get copyWith =>
      __$$_RoverMetricHealthCopyWithImpl<_$_RoverMetricHealth>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverMetricHealthToJson(this);
  }
}

abstract class _RoverMetricHealth implements RoverMetricHealth {
  const factory _RoverMetricHealth(
      {final RoverHealthType electronics,
      final RoverHealthType drivetrain,
      final RoverHealthType intake,
      final RoverHealthType sensors,
      final RoverHealthType garage,
      final RoverHealthType power,
      final RoverHealthType general}) = _$_RoverMetricHealth;

  factory _RoverMetricHealth.fromJson(Map<String, dynamic> json) =
      _$_RoverMetricHealth.fromJson;

  @override
  RoverHealthType get electronics => throw _privateConstructorUsedError;
  @override
  RoverHealthType get drivetrain => throw _privateConstructorUsedError;
  @override
  RoverHealthType get intake => throw _privateConstructorUsedError;
  @override
  RoverHealthType get sensors => throw _privateConstructorUsedError;
  @override
  RoverHealthType get garage => throw _privateConstructorUsedError;
  @override
  RoverHealthType get power => throw _privateConstructorUsedError;
  @override
  RoverHealthType get general => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverMetricHealthCopyWith<_$_RoverMetricHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverMetricTelemetry _$RoverMetricTelemetryFromJson(Map<String, dynamic> json) {
  return _RoverMetricTelemetry.fromJson(json);
}

/// @nodoc
mixin _$RoverMetricTelemetry {
  RoverMetricLocation get location => throw _privateConstructorUsedError;
  double get heading => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverMetricTelemetryCopyWith<RoverMetricTelemetry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverMetricTelemetryCopyWith<$Res> {
  factory $RoverMetricTelemetryCopyWith(RoverMetricTelemetry value,
          $Res Function(RoverMetricTelemetry) then) =
      _$RoverMetricTelemetryCopyWithImpl<$Res>;
  $Res call({RoverMetricLocation location, double heading, double speed});

  $RoverMetricLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$RoverMetricTelemetryCopyWithImpl<$Res>
    implements $RoverMetricTelemetryCopyWith<$Res> {
  _$RoverMetricTelemetryCopyWithImpl(this._value, this._then);

  final RoverMetricTelemetry _value;
  // ignore: unused_field
  final $Res Function(RoverMetricTelemetry) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as RoverMetricLocation,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $RoverMetricLocationCopyWith<$Res> get location {
    return $RoverMetricLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_RoverMetricTelemetryCopyWith<$Res>
    implements $RoverMetricTelemetryCopyWith<$Res> {
  factory _$$_RoverMetricTelemetryCopyWith(_$_RoverMetricTelemetry value,
          $Res Function(_$_RoverMetricTelemetry) then) =
      __$$_RoverMetricTelemetryCopyWithImpl<$Res>;
  @override
  $Res call({RoverMetricLocation location, double heading, double speed});

  @override
  $RoverMetricLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_RoverMetricTelemetryCopyWithImpl<$Res>
    extends _$RoverMetricTelemetryCopyWithImpl<$Res>
    implements _$$_RoverMetricTelemetryCopyWith<$Res> {
  __$$_RoverMetricTelemetryCopyWithImpl(_$_RoverMetricTelemetry _value,
      $Res Function(_$_RoverMetricTelemetry) _then)
      : super(_value, (v) => _then(v as _$_RoverMetricTelemetry));

  @override
  _$_RoverMetricTelemetry get _value => super._value as _$_RoverMetricTelemetry;

  @override
  $Res call({
    Object? location = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
  }) {
    return _then(_$_RoverMetricTelemetry(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as RoverMetricLocation,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverMetricTelemetry implements _RoverMetricTelemetry {
  const _$_RoverMetricTelemetry(
      {this.location = const RoverMetricLocation(),
      this.heading = 0.0,
      this.speed = 0.0});

  factory _$_RoverMetricTelemetry.fromJson(Map<String, dynamic> json) =>
      _$$_RoverMetricTelemetryFromJson(json);

  @override
  @JsonKey()
  final RoverMetricLocation location;
  @override
  @JsonKey()
  final double heading;
  @override
  @JsonKey()
  final double speed;

  @override
  String toString() {
    return 'RoverMetricTelemetry(location: $location, heading: $heading, speed: $speed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverMetricTelemetry &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.heading, heading) &&
            const DeepCollectionEquality().equals(other.speed, speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(heading),
      const DeepCollectionEquality().hash(speed));

  @JsonKey(ignore: true)
  @override
  _$$_RoverMetricTelemetryCopyWith<_$_RoverMetricTelemetry> get copyWith =>
      __$$_RoverMetricTelemetryCopyWithImpl<_$_RoverMetricTelemetry>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverMetricTelemetryToJson(this);
  }
}

abstract class _RoverMetricTelemetry implements RoverMetricTelemetry {
  const factory _RoverMetricTelemetry(
      {final RoverMetricLocation location,
      final double heading,
      final double speed}) = _$_RoverMetricTelemetry;

  factory _RoverMetricTelemetry.fromJson(Map<String, dynamic> json) =
      _$_RoverMetricTelemetry.fromJson;

  @override
  RoverMetricLocation get location => throw _privateConstructorUsedError;
  @override
  double get heading => throw _privateConstructorUsedError;
  @override
  double get speed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverMetricTelemetryCopyWith<_$_RoverMetricTelemetry> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverMetricLocation _$RoverMetricLocationFromJson(Map<String, dynamic> json) {
  return _RoverMetricLocation.fromJson(json);
}

/// @nodoc
mixin _$RoverMetricLocation {
  double get long => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverMetricLocationCopyWith<RoverMetricLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverMetricLocationCopyWith<$Res> {
  factory $RoverMetricLocationCopyWith(
          RoverMetricLocation value, $Res Function(RoverMetricLocation) then) =
      _$RoverMetricLocationCopyWithImpl<$Res>;
  $Res call({double long, double lat});
}

/// @nodoc
class _$RoverMetricLocationCopyWithImpl<$Res>
    implements $RoverMetricLocationCopyWith<$Res> {
  _$RoverMetricLocationCopyWithImpl(this._value, this._then);

  final RoverMetricLocation _value;
  // ignore: unused_field
  final $Res Function(RoverMetricLocation) _then;

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
abstract class _$$_RoverMetricLocationCopyWith<$Res>
    implements $RoverMetricLocationCopyWith<$Res> {
  factory _$$_RoverMetricLocationCopyWith(_$_RoverMetricLocation value,
          $Res Function(_$_RoverMetricLocation) then) =
      __$$_RoverMetricLocationCopyWithImpl<$Res>;
  @override
  $Res call({double long, double lat});
}

/// @nodoc
class __$$_RoverMetricLocationCopyWithImpl<$Res>
    extends _$RoverMetricLocationCopyWithImpl<$Res>
    implements _$$_RoverMetricLocationCopyWith<$Res> {
  __$$_RoverMetricLocationCopyWithImpl(_$_RoverMetricLocation _value,
      $Res Function(_$_RoverMetricLocation) _then)
      : super(_value, (v) => _then(v as _$_RoverMetricLocation));

  @override
  _$_RoverMetricLocation get _value => super._value as _$_RoverMetricLocation;

  @override
  $Res call({
    Object? long = freezed,
    Object? lat = freezed,
  }) {
    return _then(_$_RoverMetricLocation(
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
class _$_RoverMetricLocation implements _RoverMetricLocation {
  const _$_RoverMetricLocation({this.long = 0.0, this.lat = 0.0});

  factory _$_RoverMetricLocation.fromJson(Map<String, dynamic> json) =>
      _$$_RoverMetricLocationFromJson(json);

  @override
  @JsonKey()
  final double long;
  @override
  @JsonKey()
  final double lat;

  @override
  String toString() {
    return 'RoverMetricLocation(long: $long, lat: $lat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverMetricLocation &&
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
  _$$_RoverMetricLocationCopyWith<_$_RoverMetricLocation> get copyWith =>
      __$$_RoverMetricLocationCopyWithImpl<_$_RoverMetricLocation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverMetricLocationToJson(this);
  }
}

abstract class _RoverMetricLocation implements RoverMetricLocation {
  const factory _RoverMetricLocation({final double long, final double lat}) =
      _$_RoverMetricLocation;

  factory _RoverMetricLocation.fromJson(Map<String, dynamic> json) =
      _$_RoverMetricLocation.fromJson;

  @override
  double get long => throw _privateConstructorUsedError;
  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverMetricLocationCopyWith<_$_RoverMetricLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
