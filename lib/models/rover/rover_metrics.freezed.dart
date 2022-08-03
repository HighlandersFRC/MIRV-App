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
  RoverStateType get state => throw _privateConstructorUsedError;
  DeviceStatusType get status => throw _privateConstructorUsedError;
  double? get battery_voltage => throw _privateConstructorUsedError;
  int? get battery_percent => throw _privateConstructorUsedError;
  RoverMetricHealth get subsystems => throw _privateConstructorUsedError;
  RoverMetricTelemetry get telemetry => throw _privateConstructorUsedError;
  RoverPiLits get pi_lits => throw _privateConstructorUsedError;
  Garage? get garage => throw _privateConstructorUsedError;

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
      DeviceStatusType status,
      double? battery_voltage,
      int? battery_percent,
      RoverMetricHealth subsystems,
      RoverMetricTelemetry telemetry,
      RoverPiLits pi_lits,
      Garage? garage});

  $RoverMetricHealthCopyWith<$Res> get subsystems;
  $RoverMetricTelemetryCopyWith<$Res> get telemetry;
  $RoverPiLitsCopyWith<$Res> get pi_lits;
  $GarageCopyWith<$Res>? get garage;
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
    Object? subsystems = freezed,
    Object? telemetry = freezed,
    Object? pi_lits = freezed,
    Object? garage = freezed,
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
              as DeviceStatusType,
      battery_voltage: battery_voltage == freezed
          ? _value.battery_voltage
          : battery_voltage // ignore: cast_nullable_to_non_nullable
              as double?,
      battery_percent: battery_percent == freezed
          ? _value.battery_percent
          : battery_percent // ignore: cast_nullable_to_non_nullable
              as int?,
      subsystems: subsystems == freezed
          ? _value.subsystems
          : subsystems // ignore: cast_nullable_to_non_nullable
              as RoverMetricHealth,
      telemetry: telemetry == freezed
          ? _value.telemetry
          : telemetry // ignore: cast_nullable_to_non_nullable
              as RoverMetricTelemetry,
      pi_lits: pi_lits == freezed
          ? _value.pi_lits
          : pi_lits // ignore: cast_nullable_to_non_nullable
              as RoverPiLits,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as Garage?,
    ));
  }

  @override
  $RoverMetricHealthCopyWith<$Res> get subsystems {
    return $RoverMetricHealthCopyWith<$Res>(_value.subsystems, (value) {
      return _then(_value.copyWith(subsystems: value));
    });
  }

  @override
  $RoverMetricTelemetryCopyWith<$Res> get telemetry {
    return $RoverMetricTelemetryCopyWith<$Res>(_value.telemetry, (value) {
      return _then(_value.copyWith(telemetry: value));
    });
  }

  @override
  $RoverPiLitsCopyWith<$Res> get pi_lits {
    return $RoverPiLitsCopyWith<$Res>(_value.pi_lits, (value) {
      return _then(_value.copyWith(pi_lits: value));
    });
  }

  @override
  $GarageCopyWith<$Res>? get garage {
    if (_value.garage == null) {
      return null;
    }

    return $GarageCopyWith<$Res>(_value.garage!, (value) {
      return _then(_value.copyWith(garage: value));
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
      DeviceStatusType status,
      double? battery_voltage,
      int? battery_percent,
      RoverMetricHealth subsystems,
      RoverMetricTelemetry telemetry,
      RoverPiLits pi_lits,
      Garage? garage});

  @override
  $RoverMetricHealthCopyWith<$Res> get subsystems;
  @override
  $RoverMetricTelemetryCopyWith<$Res> get telemetry;
  @override
  $RoverPiLitsCopyWith<$Res> get pi_lits;
  @override
  $GarageCopyWith<$Res>? get garage;
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
    Object? subsystems = freezed,
    Object? telemetry = freezed,
    Object? pi_lits = freezed,
    Object? garage = freezed,
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
              as DeviceStatusType,
      battery_voltage: battery_voltage == freezed
          ? _value.battery_voltage
          : battery_voltage // ignore: cast_nullable_to_non_nullable
              as double?,
      battery_percent: battery_percent == freezed
          ? _value.battery_percent
          : battery_percent // ignore: cast_nullable_to_non_nullable
              as int?,
      subsystems: subsystems == freezed
          ? _value.subsystems
          : subsystems // ignore: cast_nullable_to_non_nullable
              as RoverMetricHealth,
      telemetry: telemetry == freezed
          ? _value.telemetry
          : telemetry // ignore: cast_nullable_to_non_nullable
              as RoverMetricTelemetry,
      pi_lits: pi_lits == freezed
          ? _value.pi_lits
          : pi_lits // ignore: cast_nullable_to_non_nullable
              as RoverPiLits,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as Garage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverMetrics implements _RoverMetrics {
  const _$_RoverMetrics(
      {required this.rover_id,
      required this.state,
      required this.status,
      this.battery_voltage,
      this.battery_percent,
      required this.subsystems,
      required this.telemetry,
      required this.pi_lits,
      this.garage});

  factory _$_RoverMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_RoverMetricsFromJson(json);

  @override
  final String rover_id;
  @override
  final RoverStateType state;
  @override
  final DeviceStatusType status;
  @override
  final double? battery_voltage;
  @override
  final int? battery_percent;
  @override
  final RoverMetricHealth subsystems;
  @override
  final RoverMetricTelemetry telemetry;
  @override
  final RoverPiLits pi_lits;
  @override
  final Garage? garage;

  @override
  String toString() {
    return 'RoverMetrics(rover_id: $rover_id, state: $state, status: $status, battery_voltage: $battery_voltage, battery_percent: $battery_percent, subsystems: $subsystems, telemetry: $telemetry, pi_lits: $pi_lits, garage: $garage)';
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
            const DeepCollectionEquality()
                .equals(other.subsystems, subsystems) &&
            const DeepCollectionEquality().equals(other.telemetry, telemetry) &&
            const DeepCollectionEquality().equals(other.pi_lits, pi_lits) &&
            const DeepCollectionEquality().equals(other.garage, garage));
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
      const DeepCollectionEquality().hash(subsystems),
      const DeepCollectionEquality().hash(telemetry),
      const DeepCollectionEquality().hash(pi_lits),
      const DeepCollectionEquality().hash(garage));

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
      required final RoverStateType state,
      required final DeviceStatusType status,
      final double? battery_voltage,
      final int? battery_percent,
      required final RoverMetricHealth subsystems,
      required final RoverMetricTelemetry telemetry,
      required final RoverPiLits pi_lits,
      final Garage? garage}) = _$_RoverMetrics;

  factory _RoverMetrics.fromJson(Map<String, dynamic> json) =
      _$_RoverMetrics.fromJson;

  @override
  String get rover_id => throw _privateConstructorUsedError;
  @override
  RoverStateType get state => throw _privateConstructorUsedError;
  @override
  DeviceStatusType get status => throw _privateConstructorUsedError;
  @override
  double? get battery_voltage => throw _privateConstructorUsedError;
  @override
  int? get battery_percent => throw _privateConstructorUsedError;
  @override
  RoverMetricHealth get subsystems => throw _privateConstructorUsedError;
  @override
  RoverMetricTelemetry get telemetry => throw _privateConstructorUsedError;
  @override
  RoverPiLits get pi_lits => throw _privateConstructorUsedError;
  @override
  Garage? get garage => throw _privateConstructorUsedError;
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
  DeviceHealth get electronics => throw _privateConstructorUsedError;
  DeviceHealth get drivetrain => throw _privateConstructorUsedError;
  DeviceHealth get intake => throw _privateConstructorUsedError;
  DeviceHealth get sensors => throw _privateConstructorUsedError;
  DeviceHealth get garage => throw _privateConstructorUsedError;
  DeviceHealth get power => throw _privateConstructorUsedError;
  DeviceHealth get general => throw _privateConstructorUsedError;

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
      {DeviceHealth electronics,
      DeviceHealth drivetrain,
      DeviceHealth intake,
      DeviceHealth sensors,
      DeviceHealth garage,
      DeviceHealth power,
      DeviceHealth general});

  $DeviceHealthCopyWith<$Res> get electronics;
  $DeviceHealthCopyWith<$Res> get drivetrain;
  $DeviceHealthCopyWith<$Res> get intake;
  $DeviceHealthCopyWith<$Res> get sensors;
  $DeviceHealthCopyWith<$Res> get garage;
  $DeviceHealthCopyWith<$Res> get power;
  $DeviceHealthCopyWith<$Res> get general;
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
              as DeviceHealth,
      drivetrain: drivetrain == freezed
          ? _value.drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      intake: intake == freezed
          ? _value.intake
          : intake // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      sensors: sensors == freezed
          ? _value.sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      general: general == freezed
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
    ));
  }

  @override
  $DeviceHealthCopyWith<$Res> get electronics {
    return $DeviceHealthCopyWith<$Res>(_value.electronics, (value) {
      return _then(_value.copyWith(electronics: value));
    });
  }

  @override
  $DeviceHealthCopyWith<$Res> get drivetrain {
    return $DeviceHealthCopyWith<$Res>(_value.drivetrain, (value) {
      return _then(_value.copyWith(drivetrain: value));
    });
  }

  @override
  $DeviceHealthCopyWith<$Res> get intake {
    return $DeviceHealthCopyWith<$Res>(_value.intake, (value) {
      return _then(_value.copyWith(intake: value));
    });
  }

  @override
  $DeviceHealthCopyWith<$Res> get sensors {
    return $DeviceHealthCopyWith<$Res>(_value.sensors, (value) {
      return _then(_value.copyWith(sensors: value));
    });
  }

  @override
  $DeviceHealthCopyWith<$Res> get garage {
    return $DeviceHealthCopyWith<$Res>(_value.garage, (value) {
      return _then(_value.copyWith(garage: value));
    });
  }

  @override
  $DeviceHealthCopyWith<$Res> get power {
    return $DeviceHealthCopyWith<$Res>(_value.power, (value) {
      return _then(_value.copyWith(power: value));
    });
  }

  @override
  $DeviceHealthCopyWith<$Res> get general {
    return $DeviceHealthCopyWith<$Res>(_value.general, (value) {
      return _then(_value.copyWith(general: value));
    });
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
      {DeviceHealth electronics,
      DeviceHealth drivetrain,
      DeviceHealth intake,
      DeviceHealth sensors,
      DeviceHealth garage,
      DeviceHealth power,
      DeviceHealth general});

  @override
  $DeviceHealthCopyWith<$Res> get electronics;
  @override
  $DeviceHealthCopyWith<$Res> get drivetrain;
  @override
  $DeviceHealthCopyWith<$Res> get intake;
  @override
  $DeviceHealthCopyWith<$Res> get sensors;
  @override
  $DeviceHealthCopyWith<$Res> get garage;
  @override
  $DeviceHealthCopyWith<$Res> get power;
  @override
  $DeviceHealthCopyWith<$Res> get general;
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
              as DeviceHealth,
      drivetrain: drivetrain == freezed
          ? _value.drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      intake: intake == freezed
          ? _value.intake
          : intake // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      sensors: sensors == freezed
          ? _value.sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      power: power == freezed
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
      general: general == freezed
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverMetricHealth implements _RoverMetricHealth {
  const _$_RoverMetricHealth(
      {this.electronics = const DeviceHealth(),
      this.drivetrain = const DeviceHealth(),
      this.intake = const DeviceHealth(),
      this.sensors = const DeviceHealth(),
      this.garage = const DeviceHealth(),
      this.power = const DeviceHealth(),
      this.general = const DeviceHealth()});

  factory _$_RoverMetricHealth.fromJson(Map<String, dynamic> json) =>
      _$$_RoverMetricHealthFromJson(json);

  @override
  @JsonKey()
  final DeviceHealth electronics;
  @override
  @JsonKey()
  final DeviceHealth drivetrain;
  @override
  @JsonKey()
  final DeviceHealth intake;
  @override
  @JsonKey()
  final DeviceHealth sensors;
  @override
  @JsonKey()
  final DeviceHealth garage;
  @override
  @JsonKey()
  final DeviceHealth power;
  @override
  @JsonKey()
  final DeviceHealth general;

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
      {final DeviceHealth electronics,
      final DeviceHealth drivetrain,
      final DeviceHealth intake,
      final DeviceHealth sensors,
      final DeviceHealth garage,
      final DeviceHealth power,
      final DeviceHealth general}) = _$_RoverMetricHealth;

  factory _RoverMetricHealth.fromJson(Map<String, dynamic> json) =
      _$_RoverMetricHealth.fromJson;

  @override
  DeviceHealth get electronics => throw _privateConstructorUsedError;
  @override
  DeviceHealth get drivetrain => throw _privateConstructorUsedError;
  @override
  DeviceHealth get intake => throw _privateConstructorUsedError;
  @override
  DeviceHealth get sensors => throw _privateConstructorUsedError;
  @override
  DeviceHealth get garage => throw _privateConstructorUsedError;
  @override
  DeviceHealth get power => throw _privateConstructorUsedError;
  @override
  DeviceHealth get general => throw _privateConstructorUsedError;
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
  DeviceLocation get location => throw _privateConstructorUsedError;
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
  $Res call({DeviceLocation location, double heading, double speed});

  $DeviceLocationCopyWith<$Res> get location;
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
              as DeviceLocation,
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
  $DeviceLocationCopyWith<$Res> get location {
    return $DeviceLocationCopyWith<$Res>(_value.location, (value) {
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
  $Res call({DeviceLocation location, double heading, double speed});

  @override
  $DeviceLocationCopyWith<$Res> get location;
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
              as DeviceLocation,
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
      {required this.location, required this.heading, required this.speed});

  factory _$_RoverMetricTelemetry.fromJson(Map<String, dynamic> json) =>
      _$$_RoverMetricTelemetryFromJson(json);

  @override
  final DeviceLocation location;
  @override
  final double heading;
  @override
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
      {required final DeviceLocation location,
      required final double heading,
      required final double speed}) = _$_RoverMetricTelemetry;

  factory _RoverMetricTelemetry.fromJson(Map<String, dynamic> json) =
      _$_RoverMetricTelemetry.fromJson;

  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  double get heading => throw _privateConstructorUsedError;
  @override
  double get speed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverMetricTelemetryCopyWith<_$_RoverMetricTelemetry> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverPiLits _$RoverPiLitsFromJson(Map<String, dynamic> json) {
  return _RoverPiLits.fromJson(json);
}

/// @nodoc
mixin _$RoverPiLits {
  PiLitStateType get state => throw _privateConstructorUsedError;
  int get pi_lits_stowed_left => throw _privateConstructorUsedError;
  int get pi_lits_stowed_right => throw _privateConstructorUsedError;
  List<PiLit> get deployed_pi_lits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverPiLitsCopyWith<RoverPiLits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverPiLitsCopyWith<$Res> {
  factory $RoverPiLitsCopyWith(
          RoverPiLits value, $Res Function(RoverPiLits) then) =
      _$RoverPiLitsCopyWithImpl<$Res>;
  $Res call(
      {PiLitStateType state,
      int pi_lits_stowed_left,
      int pi_lits_stowed_right,
      List<PiLit> deployed_pi_lits});
}

/// @nodoc
class _$RoverPiLitsCopyWithImpl<$Res> implements $RoverPiLitsCopyWith<$Res> {
  _$RoverPiLitsCopyWithImpl(this._value, this._then);

  final RoverPiLits _value;
  // ignore: unused_field
  final $Res Function(RoverPiLits) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? pi_lits_stowed_left = freezed,
    Object? pi_lits_stowed_right = freezed,
    Object? deployed_pi_lits = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PiLitStateType,
      pi_lits_stowed_left: pi_lits_stowed_left == freezed
          ? _value.pi_lits_stowed_left
          : pi_lits_stowed_left // ignore: cast_nullable_to_non_nullable
              as int,
      pi_lits_stowed_right: pi_lits_stowed_right == freezed
          ? _value.pi_lits_stowed_right
          : pi_lits_stowed_right // ignore: cast_nullable_to_non_nullable
              as int,
      deployed_pi_lits: deployed_pi_lits == freezed
          ? _value.deployed_pi_lits
          : deployed_pi_lits // ignore: cast_nullable_to_non_nullable
              as List<PiLit>,
    ));
  }
}

/// @nodoc
abstract class _$$_RoverPiLitsCopyWith<$Res>
    implements $RoverPiLitsCopyWith<$Res> {
  factory _$$_RoverPiLitsCopyWith(
          _$_RoverPiLits value, $Res Function(_$_RoverPiLits) then) =
      __$$_RoverPiLitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {PiLitStateType state,
      int pi_lits_stowed_left,
      int pi_lits_stowed_right,
      List<PiLit> deployed_pi_lits});
}

/// @nodoc
class __$$_RoverPiLitsCopyWithImpl<$Res> extends _$RoverPiLitsCopyWithImpl<$Res>
    implements _$$_RoverPiLitsCopyWith<$Res> {
  __$$_RoverPiLitsCopyWithImpl(
      _$_RoverPiLits _value, $Res Function(_$_RoverPiLits) _then)
      : super(_value, (v) => _then(v as _$_RoverPiLits));

  @override
  _$_RoverPiLits get _value => super._value as _$_RoverPiLits;

  @override
  $Res call({
    Object? state = freezed,
    Object? pi_lits_stowed_left = freezed,
    Object? pi_lits_stowed_right = freezed,
    Object? deployed_pi_lits = freezed,
  }) {
    return _then(_$_RoverPiLits(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PiLitStateType,
      pi_lits_stowed_left: pi_lits_stowed_left == freezed
          ? _value.pi_lits_stowed_left
          : pi_lits_stowed_left // ignore: cast_nullable_to_non_nullable
              as int,
      pi_lits_stowed_right: pi_lits_stowed_right == freezed
          ? _value.pi_lits_stowed_right
          : pi_lits_stowed_right // ignore: cast_nullable_to_non_nullable
              as int,
      deployed_pi_lits: deployed_pi_lits == freezed
          ? _value._deployed_pi_lits
          : deployed_pi_lits // ignore: cast_nullable_to_non_nullable
              as List<PiLit>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverPiLits implements _RoverPiLits {
  const _$_RoverPiLits(
      {required this.state,
      required this.pi_lits_stowed_left,
      required this.pi_lits_stowed_right,
      required final List<PiLit> deployed_pi_lits})
      : _deployed_pi_lits = deployed_pi_lits;

  factory _$_RoverPiLits.fromJson(Map<String, dynamic> json) =>
      _$$_RoverPiLitsFromJson(json);

  @override
  final PiLitStateType state;
  @override
  final int pi_lits_stowed_left;
  @override
  final int pi_lits_stowed_right;
  final List<PiLit> _deployed_pi_lits;
  @override
  List<PiLit> get deployed_pi_lits {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deployed_pi_lits);
  }

  @override
  String toString() {
    return 'RoverPiLits(state: $state, pi_lits_stowed_left: $pi_lits_stowed_left, pi_lits_stowed_right: $pi_lits_stowed_right, deployed_pi_lits: $deployed_pi_lits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverPiLits &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality()
                .equals(other.pi_lits_stowed_left, pi_lits_stowed_left) &&
            const DeepCollectionEquality()
                .equals(other.pi_lits_stowed_right, pi_lits_stowed_right) &&
            const DeepCollectionEquality()
                .equals(other._deployed_pi_lits, _deployed_pi_lits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(pi_lits_stowed_left),
      const DeepCollectionEquality().hash(pi_lits_stowed_right),
      const DeepCollectionEquality().hash(_deployed_pi_lits));

  @JsonKey(ignore: true)
  @override
  _$$_RoverPiLitsCopyWith<_$_RoverPiLits> get copyWith =>
      __$$_RoverPiLitsCopyWithImpl<_$_RoverPiLits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverPiLitsToJson(this);
  }
}

abstract class _RoverPiLits implements RoverPiLits {
  const factory _RoverPiLits(
      {required final PiLitStateType state,
      required final int pi_lits_stowed_left,
      required final int pi_lits_stowed_right,
      required final List<PiLit> deployed_pi_lits}) = _$_RoverPiLits;

  factory _RoverPiLits.fromJson(Map<String, dynamic> json) =
      _$_RoverPiLits.fromJson;

  @override
  PiLitStateType get state => throw _privateConstructorUsedError;
  @override
  int get pi_lits_stowed_left => throw _privateConstructorUsedError;
  @override
  int get pi_lits_stowed_right => throw _privateConstructorUsedError;
  @override
  List<PiLit> get deployed_pi_lits => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverPiLitsCopyWith<_$_RoverPiLits> get copyWith =>
      throw _privateConstructorUsedError;
}

PiLit _$PiLitFromJson(Map<String, dynamic> json) {
  return _PiLit.fromJson(json);
}

/// @nodoc
mixin _$PiLit {
  String get pi_lit_id => throw _privateConstructorUsedError;
  DeviceLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PiLitCopyWith<PiLit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PiLitCopyWith<$Res> {
  factory $PiLitCopyWith(PiLit value, $Res Function(PiLit) then) =
      _$PiLitCopyWithImpl<$Res>;
  $Res call({String pi_lit_id, DeviceLocation location});

  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$PiLitCopyWithImpl<$Res> implements $PiLitCopyWith<$Res> {
  _$PiLitCopyWithImpl(this._value, this._then);

  final PiLit _value;
  // ignore: unused_field
  final $Res Function(PiLit) _then;

  @override
  $Res call({
    Object? pi_lit_id = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      pi_lit_id: pi_lit_id == freezed
          ? _value.pi_lit_id
          : pi_lit_id // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DeviceLocation,
    ));
  }

  @override
  $DeviceLocationCopyWith<$Res> get location {
    return $DeviceLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_PiLitCopyWith<$Res> implements $PiLitCopyWith<$Res> {
  factory _$$_PiLitCopyWith(_$_PiLit value, $Res Function(_$_PiLit) then) =
      __$$_PiLitCopyWithImpl<$Res>;
  @override
  $Res call({String pi_lit_id, DeviceLocation location});

  @override
  $DeviceLocationCopyWith<$Res> get location;
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
    Object? pi_lit_id = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_PiLit(
      pi_lit_id: pi_lit_id == freezed
          ? _value.pi_lit_id
          : pi_lit_id // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DeviceLocation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PiLit implements _PiLit {
  const _$_PiLit({required this.pi_lit_id, required this.location});

  factory _$_PiLit.fromJson(Map<String, dynamic> json) =>
      _$$_PiLitFromJson(json);

  @override
  final String pi_lit_id;
  @override
  final DeviceLocation location;

  @override
  String toString() {
    return 'PiLit(pi_lit_id: $pi_lit_id, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PiLit &&
            const DeepCollectionEquality().equals(other.pi_lit_id, pi_lit_id) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pi_lit_id),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_PiLitCopyWith<_$_PiLit> get copyWith =>
      __$$_PiLitCopyWithImpl<_$_PiLit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PiLitToJson(this);
  }
}

abstract class _PiLit implements PiLit {
  const factory _PiLit(
      {required final String pi_lit_id,
      required final DeviceLocation location}) = _$_PiLit;

  factory _PiLit.fromJson(Map<String, dynamic> json) = _$_PiLit.fromJson;

  @override
  String get pi_lit_id => throw _privateConstructorUsedError;
  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PiLitCopyWith<_$_PiLit> get copyWith =>
      throw _privateConstructorUsedError;
}

Garage _$GarageFromJson(Map<String, dynamic> json) {
  return _Garage.fromJson(json);
}

/// @nodoc
mixin _$Garage {
  String get garage_id => throw _privateConstructorUsedError;
  DeviceLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarageCopyWith<Garage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarageCopyWith<$Res> {
  factory $GarageCopyWith(Garage value, $Res Function(Garage) then) =
      _$GarageCopyWithImpl<$Res>;
  $Res call({String garage_id, DeviceLocation location});

  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$GarageCopyWithImpl<$Res> implements $GarageCopyWith<$Res> {
  _$GarageCopyWithImpl(this._value, this._then);

  final Garage _value;
  // ignore: unused_field
  final $Res Function(Garage) _then;

  @override
  $Res call({
    Object? garage_id = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DeviceLocation,
    ));
  }

  @override
  $DeviceLocationCopyWith<$Res> get location {
    return $DeviceLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_GarageCopyWith<$Res> implements $GarageCopyWith<$Res> {
  factory _$$_GarageCopyWith(_$_Garage value, $Res Function(_$_Garage) then) =
      __$$_GarageCopyWithImpl<$Res>;
  @override
  $Res call({String garage_id, DeviceLocation location});

  @override
  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_GarageCopyWithImpl<$Res> extends _$GarageCopyWithImpl<$Res>
    implements _$$_GarageCopyWith<$Res> {
  __$$_GarageCopyWithImpl(_$_Garage _value, $Res Function(_$_Garage) _then)
      : super(_value, (v) => _then(v as _$_Garage));

  @override
  _$_Garage get _value => super._value as _$_Garage;

  @override
  $Res call({
    Object? garage_id = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_Garage(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DeviceLocation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Garage implements _Garage {
  const _$_Garage({required this.garage_id, required this.location});

  factory _$_Garage.fromJson(Map<String, dynamic> json) =>
      _$$_GarageFromJson(json);

  @override
  final String garage_id;
  @override
  final DeviceLocation location;

  @override
  String toString() {
    return 'Garage(garage_id: $garage_id, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Garage &&
            const DeepCollectionEquality().equals(other.garage_id, garage_id) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(garage_id),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_GarageCopyWith<_$_Garage> get copyWith =>
      __$$_GarageCopyWithImpl<_$_Garage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GarageToJson(this);
  }
}

abstract class _Garage implements Garage {
  const factory _Garage(
      {required final String garage_id,
      required final DeviceLocation location}) = _$_Garage;

  factory _Garage.fromJson(Map<String, dynamic> json) = _$_Garage.fromJson;

  @override
  String get garage_id => throw _privateConstructorUsedError;
  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageCopyWith<_$_Garage> get copyWith =>
      throw _privateConstructorUsedError;
}
