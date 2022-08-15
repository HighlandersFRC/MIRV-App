// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rover_garage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoverGarageState _$RoverGarageStateFromJson(Map<String, dynamic> json) {
  return _RoverGarageState.fromJson(json);
}

/// @nodoc
mixin _$RoverGarageState {
  String get rover_id => throw _privateConstructorUsedError;
  RoverStateType get state => throw _privateConstructorUsedError;
  DeviceStatusType get status => throw _privateConstructorUsedError;
  double? get battery_voltage => throw _privateConstructorUsedError;
  int get battery_percent => throw _privateConstructorUsedError;
  RoverStateHealth get subsystems => throw _privateConstructorUsedError;
  RoverStateTelemetry get telemetry => throw _privateConstructorUsedError;
  RoverStatePiLits get pi_lits => throw _privateConstructorUsedError;
  Garage? get garage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverGarageStateCopyWith<RoverGarageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverGarageStateCopyWith<$Res> {
  factory $RoverGarageStateCopyWith(
          RoverGarageState value, $Res Function(RoverGarageState) then) =
      _$RoverGarageStateCopyWithImpl<$Res>;
  $Res call(
      {String rover_id,
      RoverStateType state,
      DeviceStatusType status,
      double? battery_voltage,
      int battery_percent,
      RoverStateHealth subsystems,
      RoverStateTelemetry telemetry,
      RoverStatePiLits pi_lits,
      Garage? garage});

  $RoverStateHealthCopyWith<$Res> get subsystems;
  $RoverStateTelemetryCopyWith<$Res> get telemetry;
  $RoverStatePiLitsCopyWith<$Res> get pi_lits;
  $GarageCopyWith<$Res>? get garage;
}

/// @nodoc
class _$RoverGarageStateCopyWithImpl<$Res>
    implements $RoverGarageStateCopyWith<$Res> {
  _$RoverGarageStateCopyWithImpl(this._value, this._then);

  final RoverGarageState _value;
  // ignore: unused_field
  final $Res Function(RoverGarageState) _then;

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
              as Garage?,
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
abstract class _$$_RoverGarageStateCopyWith<$Res>
    implements $RoverGarageStateCopyWith<$Res> {
  factory _$$_RoverGarageStateCopyWith(
          _$_RoverGarageState value, $Res Function(_$_RoverGarageState) then) =
      __$$_RoverGarageStateCopyWithImpl<$Res>;
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
      Garage? garage});

  @override
  $RoverStateHealthCopyWith<$Res> get subsystems;
  @override
  $RoverStateTelemetryCopyWith<$Res> get telemetry;
  @override
  $RoverStatePiLitsCopyWith<$Res> get pi_lits;
  @override
  $GarageCopyWith<$Res>? get garage;
}

/// @nodoc
class __$$_RoverGarageStateCopyWithImpl<$Res>
    extends _$RoverGarageStateCopyWithImpl<$Res>
    implements _$$_RoverGarageStateCopyWith<$Res> {
  __$$_RoverGarageStateCopyWithImpl(
      _$_RoverGarageState _value, $Res Function(_$_RoverGarageState) _then)
      : super(_value, (v) => _then(v as _$_RoverGarageState));

  @override
  _$_RoverGarageState get _value => super._value as _$_RoverGarageState;

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
    return _then(_$_RoverGarageState(
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
              as Garage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverGarageState extends _RoverGarageState {
  const _$_RoverGarageState(
      {required this.rover_id,
      required this.state,
      required this.status,
      this.battery_voltage,
      required this.battery_percent,
      required this.subsystems,
      required this.telemetry,
      required this.pi_lits,
      required this.garage})
      : super._();

  factory _$_RoverGarageState.fromJson(Map<String, dynamic> json) =>
      _$$_RoverGarageStateFromJson(json);

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
  final Garage? garage;

  @override
  String toString() {
    return 'RoverGarageState(rover_id: $rover_id, state: $state, status: $status, battery_voltage: $battery_voltage, battery_percent: $battery_percent, subsystems: $subsystems, telemetry: $telemetry, pi_lits: $pi_lits, garage: $garage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverGarageState &&
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
  _$$_RoverGarageStateCopyWith<_$_RoverGarageState> get copyWith =>
      __$$_RoverGarageStateCopyWithImpl<_$_RoverGarageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverGarageStateToJson(this);
  }
}

abstract class _RoverGarageState extends RoverGarageState {
  const factory _RoverGarageState(
      {required final String rover_id,
      required final RoverStateType state,
      required final DeviceStatusType status,
      final double? battery_voltage,
      required final int battery_percent,
      required final RoverStateHealth subsystems,
      required final RoverStateTelemetry telemetry,
      required final RoverStatePiLits pi_lits,
      required final Garage? garage}) = _$_RoverGarageState;
  const _RoverGarageState._() : super._();

  factory _RoverGarageState.fromJson(Map<String, dynamic> json) =
      _$_RoverGarageState.fromJson;

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
  Garage? get garage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverGarageStateCopyWith<_$_RoverGarageState> get copyWith =>
      throw _privateConstructorUsedError;
}

Garage _$GarageFromJson(Map<String, dynamic> json) {
  return _Garage.fromJson(json);
}

/// @nodoc
mixin _$Garage {
  String get garage_id => throw _privateConstructorUsedError;
  GarageStateType? get state => throw _privateConstructorUsedError;
  bool? get lights_on => throw _privateConstructorUsedError;
  DeviceHealthType? get health => throw _privateConstructorUsedError;
  String? get health_details => throw _privateConstructorUsedError;
  DeviceLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarageCopyWith<Garage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarageCopyWith<$Res> {
  factory $GarageCopyWith(Garage value, $Res Function(Garage) then) =
      _$GarageCopyWithImpl<$Res>;
  $Res call(
      {String garage_id,
      GarageStateType? state,
      bool? lights_on,
      DeviceHealthType? health,
      String? health_details,
      DeviceLocation location});

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
    Object? state = freezed,
    Object? lights_on = freezed,
    Object? health = freezed,
    Object? health_details = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType?,
      lights_on: lights_on == freezed
          ? _value.lights_on
          : lights_on // ignore: cast_nullable_to_non_nullable
              as bool?,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as DeviceHealthType?,
      health_details: health_details == freezed
          ? _value.health_details
          : health_details // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String garage_id,
      GarageStateType? state,
      bool? lights_on,
      DeviceHealthType? health,
      String? health_details,
      DeviceLocation location});

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
    Object? state = freezed,
    Object? lights_on = freezed,
    Object? health = freezed,
    Object? health_details = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_Garage(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType?,
      lights_on: lights_on == freezed
          ? _value.lights_on
          : lights_on // ignore: cast_nullable_to_non_nullable
              as bool?,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as DeviceHealthType?,
      health_details: health_details == freezed
          ? _value.health_details
          : health_details // ignore: cast_nullable_to_non_nullable
              as String?,
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
  const _$_Garage(
      {required this.garage_id,
      required this.state,
      required this.lights_on,
      required this.health,
      this.health_details,
      required this.location});

  factory _$_Garage.fromJson(Map<String, dynamic> json) =>
      _$$_GarageFromJson(json);

  @override
  final String garage_id;
  @override
  final GarageStateType? state;
  @override
  final bool? lights_on;
  @override
  final DeviceHealthType? health;
  @override
  final String? health_details;
  @override
  final DeviceLocation location;

  @override
  String toString() {
    return 'Garage(garage_id: $garage_id, state: $state, lights_on: $lights_on, health: $health, health_details: $health_details, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Garage &&
            const DeepCollectionEquality().equals(other.garage_id, garage_id) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.lights_on, lights_on) &&
            const DeepCollectionEquality().equals(other.health, health) &&
            const DeepCollectionEquality()
                .equals(other.health_details, health_details) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(garage_id),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(lights_on),
      const DeepCollectionEquality().hash(health),
      const DeepCollectionEquality().hash(health_details),
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
      required final GarageStateType? state,
      required final bool? lights_on,
      required final DeviceHealthType? health,
      final String? health_details,
      required final DeviceLocation location}) = _$_Garage;

  factory _Garage.fromJson(Map<String, dynamic> json) = _$_Garage.fromJson;

  @override
  String get garage_id => throw _privateConstructorUsedError;
  @override
  GarageStateType? get state => throw _privateConstructorUsedError;
  @override
  bool? get lights_on => throw _privateConstructorUsedError;
  @override
  DeviceHealthType? get health => throw _privateConstructorUsedError;
  @override
  String? get health_details => throw _privateConstructorUsedError;
  @override
  DeviceLocation get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageCopyWith<_$_Garage> get copyWith =>
      throw _privateConstructorUsedError;
}
