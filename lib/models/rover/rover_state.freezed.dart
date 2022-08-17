// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rover_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoverState _$RoverStateFromJson(Map<String, dynamic> json) {
  return _RoverState.fromJson(json);
}

/// @nodoc
mixin _$RoverState {
  String get rover_id => throw _privateConstructorUsedError;
  RoverStateType get state => throw _privateConstructorUsedError;
  DeviceStatusType get status => throw _privateConstructorUsedError;
  double? get battery_voltage => throw _privateConstructorUsedError;
  int get battery_percent => throw _privateConstructorUsedError;
  RoverStateHealth get subsystems => throw _privateConstructorUsedError;
  RoverStateTelemetry get telemetry => throw _privateConstructorUsedError;
  RoverStatePiLits get pi_lits => throw _privateConstructorUsedError;
  RoverStateGarage? get garage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverStateCopyWith<RoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverStateCopyWith<$Res> {
  factory $RoverStateCopyWith(
          RoverState value, $Res Function(RoverState) then) =
      _$RoverStateCopyWithImpl<$Res>;
  $Res call(
      {String rover_id,
      RoverStateType state,
      DeviceStatusType status,
      double? battery_voltage,
      int battery_percent,
      RoverStateHealth subsystems,
      RoverStateTelemetry telemetry,
      RoverStatePiLits pi_lits,
      RoverStateGarage? garage});

  $RoverStateHealthCopyWith<$Res> get subsystems;
  $RoverStateTelemetryCopyWith<$Res> get telemetry;
  $RoverStatePiLitsCopyWith<$Res> get pi_lits;
  $RoverStateGarageCopyWith<$Res>? get garage;
}

/// @nodoc
class _$RoverStateCopyWithImpl<$Res> implements $RoverStateCopyWith<$Res> {
  _$RoverStateCopyWithImpl(this._value, this._then);

  final RoverState _value;
  // ignore: unused_field
  final $Res Function(RoverState) _then;

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
              as int,
      subsystems: subsystems == freezed
          ? _value.subsystems
          : subsystems // ignore: cast_nullable_to_non_nullable
              as RoverStateHealth,
      telemetry: telemetry == freezed
          ? _value.telemetry
          : telemetry // ignore: cast_nullable_to_non_nullable
              as RoverStateTelemetry,
      pi_lits: pi_lits == freezed
          ? _value.pi_lits
          : pi_lits // ignore: cast_nullable_to_non_nullable
              as RoverStatePiLits,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as RoverStateGarage?,
    ));
  }

  @override
  $RoverStateHealthCopyWith<$Res> get subsystems {
    return $RoverStateHealthCopyWith<$Res>(_value.subsystems, (value) {
      return _then(_value.copyWith(subsystems: value));
    });
  }

  @override
  $RoverStateTelemetryCopyWith<$Res> get telemetry {
    return $RoverStateTelemetryCopyWith<$Res>(_value.telemetry, (value) {
      return _then(_value.copyWith(telemetry: value));
    });
  }

  @override
  $RoverStatePiLitsCopyWith<$Res> get pi_lits {
    return $RoverStatePiLitsCopyWith<$Res>(_value.pi_lits, (value) {
      return _then(_value.copyWith(pi_lits: value));
    });
  }

  @override
  $RoverStateGarageCopyWith<$Res>? get garage {
    if (_value.garage == null) {
      return null;
    }

    return $RoverStateGarageCopyWith<$Res>(_value.garage!, (value) {
      return _then(_value.copyWith(garage: value));
    });
  }
}

/// @nodoc
abstract class _$$_RoverStateCopyWith<$Res>
    implements $RoverStateCopyWith<$Res> {
  factory _$$_RoverStateCopyWith(
          _$_RoverState value, $Res Function(_$_RoverState) then) =
      __$$_RoverStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rover_id,
      RoverStateType state,
      DeviceStatusType status,
      double? battery_voltage,
      int battery_percent,
      RoverStateHealth subsystems,
      RoverStateTelemetry telemetry,
      RoverStatePiLits pi_lits,
      RoverStateGarage? garage});

  @override
  $RoverStateHealthCopyWith<$Res> get subsystems;
  @override
  $RoverStateTelemetryCopyWith<$Res> get telemetry;
  @override
  $RoverStatePiLitsCopyWith<$Res> get pi_lits;
  @override
  $RoverStateGarageCopyWith<$Res>? get garage;
}

/// @nodoc
class __$$_RoverStateCopyWithImpl<$Res> extends _$RoverStateCopyWithImpl<$Res>
    implements _$$_RoverStateCopyWith<$Res> {
  __$$_RoverStateCopyWithImpl(
      _$_RoverState _value, $Res Function(_$_RoverState) _then)
      : super(_value, (v) => _then(v as _$_RoverState));

  @override
  _$_RoverState get _value => super._value as _$_RoverState;

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
    return _then(_$_RoverState(
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
              as int,
      subsystems: subsystems == freezed
          ? _value.subsystems
          : subsystems // ignore: cast_nullable_to_non_nullable
              as RoverStateHealth,
      telemetry: telemetry == freezed
          ? _value.telemetry
          : telemetry // ignore: cast_nullable_to_non_nullable
              as RoverStateTelemetry,
      pi_lits: pi_lits == freezed
          ? _value.pi_lits
          : pi_lits // ignore: cast_nullable_to_non_nullable
              as RoverStatePiLits,
      garage: garage == freezed
          ? _value.garage
          : garage // ignore: cast_nullable_to_non_nullable
              as RoverStateGarage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverState implements _RoverState {
  const _$_RoverState(
      {required this.rover_id,
      required this.state,
      required this.status,
      this.battery_voltage,
      required this.battery_percent,
      required this.subsystems,
      required this.telemetry,
      required this.pi_lits,
      this.garage});

  factory _$_RoverState.fromJson(Map<String, dynamic> json) =>
      _$$_RoverStateFromJson(json);

  @override
  final String rover_id;
  @override
  final RoverStateType state;
  @override
  final DeviceStatusType status;
  @override
  final double? battery_voltage;
  @override
  final int battery_percent;
  @override
  final RoverStateHealth subsystems;
  @override
  final RoverStateTelemetry telemetry;
  @override
  final RoverStatePiLits pi_lits;
  @override
  final RoverStateGarage? garage;

  @override
  String toString() {
    return 'RoverState(rover_id: $rover_id, state: $state, status: $status, battery_voltage: $battery_voltage, battery_percent: $battery_percent, subsystems: $subsystems, telemetry: $telemetry, pi_lits: $pi_lits, garage: $garage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverState &&
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
  _$$_RoverStateCopyWith<_$_RoverState> get copyWith =>
      __$$_RoverStateCopyWithImpl<_$_RoverState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverStateToJson(this);
  }
}

abstract class _RoverState implements RoverState {
  const factory _RoverState(
      {required final String rover_id,
      required final RoverStateType state,
      required final DeviceStatusType status,
      final double? battery_voltage,
      required final int battery_percent,
      required final RoverStateHealth subsystems,
      required final RoverStateTelemetry telemetry,
      required final RoverStatePiLits pi_lits,
      final RoverStateGarage? garage}) = _$_RoverState;

  factory _RoverState.fromJson(Map<String, dynamic> json) =
      _$_RoverState.fromJson;

  @override
  String get rover_id => throw _privateConstructorUsedError;
  @override
  RoverStateType get state => throw _privateConstructorUsedError;
  @override
  DeviceStatusType get status => throw _privateConstructorUsedError;
  @override
  double? get battery_voltage => throw _privateConstructorUsedError;
  @override
  int get battery_percent => throw _privateConstructorUsedError;
  @override
  RoverStateHealth get subsystems => throw _privateConstructorUsedError;
  @override
  RoverStateTelemetry get telemetry => throw _privateConstructorUsedError;
  @override
  RoverStatePiLits get pi_lits => throw _privateConstructorUsedError;
  @override
  RoverStateGarage? get garage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverStateCopyWith<_$_RoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverStateHealth _$RoverStateHealthFromJson(Map<String, dynamic> json) {
  return _RoverStateHealth.fromJson(json);
}

/// @nodoc
mixin _$RoverStateHealth {
  DeviceHealth get electronics => throw _privateConstructorUsedError;
  DeviceHealth get drivetrain => throw _privateConstructorUsedError;
  DeviceHealth get intake => throw _privateConstructorUsedError;
  DeviceHealth get sensors => throw _privateConstructorUsedError;
  DeviceHealth get garage => throw _privateConstructorUsedError;
  DeviceHealth get power => throw _privateConstructorUsedError;
  DeviceHealth get general => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverStateHealthCopyWith<RoverStateHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverStateHealthCopyWith<$Res> {
  factory $RoverStateHealthCopyWith(
          RoverStateHealth value, $Res Function(RoverStateHealth) then) =
      _$RoverStateHealthCopyWithImpl<$Res>;
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
class _$RoverStateHealthCopyWithImpl<$Res>
    implements $RoverStateHealthCopyWith<$Res> {
  _$RoverStateHealthCopyWithImpl(this._value, this._then);

  final RoverStateHealth _value;
  // ignore: unused_field
  final $Res Function(RoverStateHealth) _then;

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
abstract class _$$_RoverStateHealthCopyWith<$Res>
    implements $RoverStateHealthCopyWith<$Res> {
  factory _$$_RoverStateHealthCopyWith(
          _$_RoverStateHealth value, $Res Function(_$_RoverStateHealth) then) =
      __$$_RoverStateHealthCopyWithImpl<$Res>;
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
class __$$_RoverStateHealthCopyWithImpl<$Res>
    extends _$RoverStateHealthCopyWithImpl<$Res>
    implements _$$_RoverStateHealthCopyWith<$Res> {
  __$$_RoverStateHealthCopyWithImpl(
      _$_RoverStateHealth _value, $Res Function(_$_RoverStateHealth) _then)
      : super(_value, (v) => _then(v as _$_RoverStateHealth));

  @override
  _$_RoverStateHealth get _value => super._value as _$_RoverStateHealth;

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
    return _then(_$_RoverStateHealth(
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
class _$_RoverStateHealth implements _RoverStateHealth {
  const _$_RoverStateHealth(
      {this.electronics = const DeviceHealth(),
      this.drivetrain = const DeviceHealth(),
      this.intake = const DeviceHealth(),
      this.sensors = const DeviceHealth(),
      this.garage = const DeviceHealth(),
      this.power = const DeviceHealth(),
      this.general = const DeviceHealth()});

  factory _$_RoverStateHealth.fromJson(Map<String, dynamic> json) =>
      _$$_RoverStateHealthFromJson(json);

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
    return 'RoverStateHealth(electronics: $electronics, drivetrain: $drivetrain, intake: $intake, sensors: $sensors, garage: $garage, power: $power, general: $general)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverStateHealth &&
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
  _$$_RoverStateHealthCopyWith<_$_RoverStateHealth> get copyWith =>
      __$$_RoverStateHealthCopyWithImpl<_$_RoverStateHealth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverStateHealthToJson(this);
  }
}

abstract class _RoverStateHealth implements RoverStateHealth {
  const factory _RoverStateHealth(
      {final DeviceHealth electronics,
      final DeviceHealth drivetrain,
      final DeviceHealth intake,
      final DeviceHealth sensors,
      final DeviceHealth garage,
      final DeviceHealth power,
      final DeviceHealth general}) = _$_RoverStateHealth;

  factory _RoverStateHealth.fromJson(Map<String, dynamic> json) =
      _$_RoverStateHealth.fromJson;

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
  _$$_RoverStateHealthCopyWith<_$_RoverStateHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverStateTelemetry _$RoverStateTelemetryFromJson(Map<String, dynamic> json) {
  return _RoverStateTelemetry.fromJson(json);
}

/// @nodoc
mixin _$RoverStateTelemetry {
  DeviceLocation get location => throw _privateConstructorUsedError;
  double get heading => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverStateTelemetryCopyWith<RoverStateTelemetry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverStateTelemetryCopyWith<$Res> {
  factory $RoverStateTelemetryCopyWith(
          RoverStateTelemetry value, $Res Function(RoverStateTelemetry) then) =
      _$RoverStateTelemetryCopyWithImpl<$Res>;
  $Res call({DeviceLocation location, double heading, double speed});

  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$RoverStateTelemetryCopyWithImpl<$Res>
    implements $RoverStateTelemetryCopyWith<$Res> {
  _$RoverStateTelemetryCopyWithImpl(this._value, this._then);

  final RoverStateTelemetry _value;
  // ignore: unused_field
  final $Res Function(RoverStateTelemetry) _then;

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
abstract class _$$_RoverStateTelemetryCopyWith<$Res>
    implements $RoverStateTelemetryCopyWith<$Res> {
  factory _$$_RoverStateTelemetryCopyWith(_$_RoverStateTelemetry value,
          $Res Function(_$_RoverStateTelemetry) then) =
      __$$_RoverStateTelemetryCopyWithImpl<$Res>;
  @override
  $Res call({DeviceLocation location, double heading, double speed});

  @override
  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_RoverStateTelemetryCopyWithImpl<$Res>
    extends _$RoverStateTelemetryCopyWithImpl<$Res>
    implements _$$_RoverStateTelemetryCopyWith<$Res> {
  __$$_RoverStateTelemetryCopyWithImpl(_$_RoverStateTelemetry _value,
      $Res Function(_$_RoverStateTelemetry) _then)
      : super(_value, (v) => _then(v as _$_RoverStateTelemetry));

  @override
  _$_RoverStateTelemetry get _value => super._value as _$_RoverStateTelemetry;

  @override
  $Res call({
    Object? location = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
  }) {
    return _then(_$_RoverStateTelemetry(
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
class _$_RoverStateTelemetry implements _RoverStateTelemetry {
  const _$_RoverStateTelemetry(
      {required this.location, required this.heading, required this.speed});

  factory _$_RoverStateTelemetry.fromJson(Map<String, dynamic> json) =>
      _$$_RoverStateTelemetryFromJson(json);

  @override
  final DeviceLocation location;
  @override
  final double heading;
  @override
  final double speed;

  @override
  String toString() {
    return 'RoverStateTelemetry(location: $location, heading: $heading, speed: $speed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverStateTelemetry &&
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
  _$$_RoverStateTelemetryCopyWith<_$_RoverStateTelemetry> get copyWith =>
      __$$_RoverStateTelemetryCopyWithImpl<_$_RoverStateTelemetry>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverStateTelemetryToJson(this);
  }
}

abstract class _RoverStateTelemetry implements RoverStateTelemetry {
  const factory _RoverStateTelemetry(
      {required final DeviceLocation location,
      required final double heading,
      required final double speed}) = _$_RoverStateTelemetry;

  factory _RoverStateTelemetry.fromJson(Map<String, dynamic> json) =
      _$_RoverStateTelemetry.fromJson;

  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  double get heading => throw _privateConstructorUsedError;
  @override
  double get speed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverStateTelemetryCopyWith<_$_RoverStateTelemetry> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverStatePiLits _$RoverStatePiLitsFromJson(Map<String, dynamic> json) {
  return _RoverStatePiLits.fromJson(json);
}

/// @nodoc
mixin _$RoverStatePiLits {
  PiLitStateType get state => throw _privateConstructorUsedError;
  int get pi_lits_stowed_left => throw _privateConstructorUsedError;
  int get pi_lits_stowed_right => throw _privateConstructorUsedError;
  List<RoverStatePiLit> get deployed_pi_lits =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverStatePiLitsCopyWith<RoverStatePiLits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverStatePiLitsCopyWith<$Res> {
  factory $RoverStatePiLitsCopyWith(
          RoverStatePiLits value, $Res Function(RoverStatePiLits) then) =
      _$RoverStatePiLitsCopyWithImpl<$Res>;
  $Res call(
      {PiLitStateType state,
      int pi_lits_stowed_left,
      int pi_lits_stowed_right,
      List<RoverStatePiLit> deployed_pi_lits});
}

/// @nodoc
class _$RoverStatePiLitsCopyWithImpl<$Res>
    implements $RoverStatePiLitsCopyWith<$Res> {
  _$RoverStatePiLitsCopyWithImpl(this._value, this._then);

  final RoverStatePiLits _value;
  // ignore: unused_field
  final $Res Function(RoverStatePiLits) _then;

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
              as List<RoverStatePiLit>,
    ));
  }
}

/// @nodoc
abstract class _$$_RoverStatePiLitsCopyWith<$Res>
    implements $RoverStatePiLitsCopyWith<$Res> {
  factory _$$_RoverStatePiLitsCopyWith(
          _$_RoverStatePiLits value, $Res Function(_$_RoverStatePiLits) then) =
      __$$_RoverStatePiLitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {PiLitStateType state,
      int pi_lits_stowed_left,
      int pi_lits_stowed_right,
      List<RoverStatePiLit> deployed_pi_lits});
}

/// @nodoc
class __$$_RoverStatePiLitsCopyWithImpl<$Res>
    extends _$RoverStatePiLitsCopyWithImpl<$Res>
    implements _$$_RoverStatePiLitsCopyWith<$Res> {
  __$$_RoverStatePiLitsCopyWithImpl(
      _$_RoverStatePiLits _value, $Res Function(_$_RoverStatePiLits) _then)
      : super(_value, (v) => _then(v as _$_RoverStatePiLits));

  @override
  _$_RoverStatePiLits get _value => super._value as _$_RoverStatePiLits;

  @override
  $Res call({
    Object? state = freezed,
    Object? pi_lits_stowed_left = freezed,
    Object? pi_lits_stowed_right = freezed,
    Object? deployed_pi_lits = freezed,
  }) {
    return _then(_$_RoverStatePiLits(
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
              as List<RoverStatePiLit>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverStatePiLits extends _RoverStatePiLits {
  const _$_RoverStatePiLits(
      {required this.state,
      required this.pi_lits_stowed_left,
      required this.pi_lits_stowed_right,
      required final List<RoverStatePiLit> deployed_pi_lits})
      : _deployed_pi_lits = deployed_pi_lits,
        super._();

  factory _$_RoverStatePiLits.fromJson(Map<String, dynamic> json) =>
      _$$_RoverStatePiLitsFromJson(json);

  @override
  final PiLitStateType state;
  @override
  final int pi_lits_stowed_left;
  @override
  final int pi_lits_stowed_right;
  final List<RoverStatePiLit> _deployed_pi_lits;
  @override
  List<RoverStatePiLit> get deployed_pi_lits {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deployed_pi_lits);
  }

  @override
  String toString() {
    return 'RoverStatePiLits(state: $state, pi_lits_stowed_left: $pi_lits_stowed_left, pi_lits_stowed_right: $pi_lits_stowed_right, deployed_pi_lits: $deployed_pi_lits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverStatePiLits &&
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
  _$$_RoverStatePiLitsCopyWith<_$_RoverStatePiLits> get copyWith =>
      __$$_RoverStatePiLitsCopyWithImpl<_$_RoverStatePiLits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverStatePiLitsToJson(this);
  }
}

abstract class _RoverStatePiLits extends RoverStatePiLits {
  const factory _RoverStatePiLits(
          {required final PiLitStateType state,
          required final int pi_lits_stowed_left,
          required final int pi_lits_stowed_right,
          required final List<RoverStatePiLit> deployed_pi_lits}) =
      _$_RoverStatePiLits;
  const _RoverStatePiLits._() : super._();

  factory _RoverStatePiLits.fromJson(Map<String, dynamic> json) =
      _$_RoverStatePiLits.fromJson;

  @override
  PiLitStateType get state => throw _privateConstructorUsedError;
  @override
  int get pi_lits_stowed_left => throw _privateConstructorUsedError;
  @override
  int get pi_lits_stowed_right => throw _privateConstructorUsedError;
  @override
  List<RoverStatePiLit> get deployed_pi_lits =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverStatePiLitsCopyWith<_$_RoverStatePiLits> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverStatePiLit _$RoverStatePiLitFromJson(Map<String, dynamic> json) {
  return _RoverStatePiLit.fromJson(json);
}

/// @nodoc
mixin _$RoverStatePiLit {
  String get pi_lit_id => throw _privateConstructorUsedError;
  DeviceLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverStatePiLitCopyWith<RoverStatePiLit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverStatePiLitCopyWith<$Res> {
  factory $RoverStatePiLitCopyWith(
          RoverStatePiLit value, $Res Function(RoverStatePiLit) then) =
      _$RoverStatePiLitCopyWithImpl<$Res>;
  $Res call({String pi_lit_id, DeviceLocation location});

  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$RoverStatePiLitCopyWithImpl<$Res>
    implements $RoverStatePiLitCopyWith<$Res> {
  _$RoverStatePiLitCopyWithImpl(this._value, this._then);

  final RoverStatePiLit _value;
  // ignore: unused_field
  final $Res Function(RoverStatePiLit) _then;

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
abstract class _$$_RoverStatePiLitCopyWith<$Res>
    implements $RoverStatePiLitCopyWith<$Res> {
  factory _$$_RoverStatePiLitCopyWith(
          _$_RoverStatePiLit value, $Res Function(_$_RoverStatePiLit) then) =
      __$$_RoverStatePiLitCopyWithImpl<$Res>;
  @override
  $Res call({String pi_lit_id, DeviceLocation location});

  @override
  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_RoverStatePiLitCopyWithImpl<$Res>
    extends _$RoverStatePiLitCopyWithImpl<$Res>
    implements _$$_RoverStatePiLitCopyWith<$Res> {
  __$$_RoverStatePiLitCopyWithImpl(
      _$_RoverStatePiLit _value, $Res Function(_$_RoverStatePiLit) _then)
      : super(_value, (v) => _then(v as _$_RoverStatePiLit));

  @override
  _$_RoverStatePiLit get _value => super._value as _$_RoverStatePiLit;

  @override
  $Res call({
    Object? pi_lit_id = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_RoverStatePiLit(
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
class _$_RoverStatePiLit implements _RoverStatePiLit {
  const _$_RoverStatePiLit({required this.pi_lit_id, required this.location});

  factory _$_RoverStatePiLit.fromJson(Map<String, dynamic> json) =>
      _$$_RoverStatePiLitFromJson(json);

  @override
  final String pi_lit_id;
  @override
  final DeviceLocation location;

  @override
  String toString() {
    return 'RoverStatePiLit(pi_lit_id: $pi_lit_id, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverStatePiLit &&
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
  _$$_RoverStatePiLitCopyWith<_$_RoverStatePiLit> get copyWith =>
      __$$_RoverStatePiLitCopyWithImpl<_$_RoverStatePiLit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverStatePiLitToJson(this);
  }
}

abstract class _RoverStatePiLit implements RoverStatePiLit {
  const factory _RoverStatePiLit(
      {required final String pi_lit_id,
      required final DeviceLocation location}) = _$_RoverStatePiLit;

  factory _RoverStatePiLit.fromJson(Map<String, dynamic> json) =
      _$_RoverStatePiLit.fromJson;

  @override
  String get pi_lit_id => throw _privateConstructorUsedError;
  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverStatePiLitCopyWith<_$_RoverStatePiLit> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverStateGarage _$RoverStateGarageFromJson(Map<String, dynamic> json) {
  return _RoverStateGarage.fromJson(json);
}

/// @nodoc
mixin _$RoverStateGarage {
  String get garage_id => throw _privateConstructorUsedError;
  DeviceLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverStateGarageCopyWith<RoverStateGarage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverStateGarageCopyWith<$Res> {
  factory $RoverStateGarageCopyWith(
          RoverStateGarage value, $Res Function(RoverStateGarage) then) =
      _$RoverStateGarageCopyWithImpl<$Res>;
  $Res call({String garage_id, DeviceLocation location});

  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$RoverStateGarageCopyWithImpl<$Res>
    implements $RoverStateGarageCopyWith<$Res> {
  _$RoverStateGarageCopyWithImpl(this._value, this._then);

  final RoverStateGarage _value;
  // ignore: unused_field
  final $Res Function(RoverStateGarage) _then;

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
abstract class _$$_RoverStateGarageCopyWith<$Res>
    implements $RoverStateGarageCopyWith<$Res> {
  factory _$$_RoverStateGarageCopyWith(
          _$_RoverStateGarage value, $Res Function(_$_RoverStateGarage) then) =
      __$$_RoverStateGarageCopyWithImpl<$Res>;
  @override
  $Res call({String garage_id, DeviceLocation location});

  @override
  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_RoverStateGarageCopyWithImpl<$Res>
    extends _$RoverStateGarageCopyWithImpl<$Res>
    implements _$$_RoverStateGarageCopyWith<$Res> {
  __$$_RoverStateGarageCopyWithImpl(
      _$_RoverStateGarage _value, $Res Function(_$_RoverStateGarage) _then)
      : super(_value, (v) => _then(v as _$_RoverStateGarage));

  @override
  _$_RoverStateGarage get _value => super._value as _$_RoverStateGarage;

  @override
  $Res call({
    Object? garage_id = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_RoverStateGarage(
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
class _$_RoverStateGarage implements _RoverStateGarage {
  const _$_RoverStateGarage({required this.garage_id, required this.location});

  factory _$_RoverStateGarage.fromJson(Map<String, dynamic> json) =>
      _$$_RoverStateGarageFromJson(json);

  @override
  final String garage_id;
  @override
  final DeviceLocation location;

  @override
  String toString() {
    return 'RoverStateGarage(garage_id: $garage_id, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverStateGarage &&
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
  _$$_RoverStateGarageCopyWith<_$_RoverStateGarage> get copyWith =>
      __$$_RoverStateGarageCopyWithImpl<_$_RoverStateGarage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverStateGarageToJson(this);
  }
}

abstract class _RoverStateGarage implements RoverStateGarage {
  const factory _RoverStateGarage(
      {required final String garage_id,
      required final DeviceLocation location}) = _$_RoverStateGarage;

  factory _RoverStateGarage.fromJson(Map<String, dynamic> json) =
      _$_RoverStateGarage.fromJson;

  @override
  String get garage_id => throw _privateConstructorUsedError;
  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverStateGarageCopyWith<_$_RoverStateGarage> get copyWith =>
      throw _privateConstructorUsedError;
}
