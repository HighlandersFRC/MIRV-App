// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/pi_lit_state_type.dart';
import 'package:mirv/models/device_health.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/device_status_type.dart';

part 'rover_state.freezed.dart';
part 'rover_state.g.dart';

@freezed
class RoverState with _$RoverState {
  const factory RoverState({
    required String rover_id,
    required RoverStateType state,
    required DeviceStatusType status,
    double? battery_voltage,
    required int battery_percent,
    required RoverStateHealth subsystems,
    required RoverStateTelemetry telemetry,
    required RoverStatePiLits pi_lits,
    RoverStateGarage? garage,
  }) = _RoverState;

  factory RoverState.fromJson(Map<String, dynamic> json) => _$RoverStateFromJson(json);
}

@freezed
class RoverStateHealth with _$RoverStateHealth {
  const factory RoverStateHealth({
    @Default(DeviceHealth()) DeviceHealth electronics,
    @Default(DeviceHealth()) DeviceHealth drivetrain,
    @Default(DeviceHealth()) DeviceHealth intake,
    @Default(DeviceHealth()) DeviceHealth sensors,
    @Default(DeviceHealth()) DeviceHealth garage,
    @Default(DeviceHealth()) DeviceHealth power,
    @Default(DeviceHealth()) DeviceHealth general,
  }) = _RoverStateHealth;

  factory RoverStateHealth.fromJson(Map<String, dynamic> json) => _$RoverStateHealthFromJson(json);
}

@freezed
class RoverStateTelemetry with _$RoverStateTelemetry {
  const factory RoverStateTelemetry({
    required DeviceLocation location,
    required double heading,
    required double speed,
  }) = _RoverStateTelemetry;

  factory RoverStateTelemetry.fromJson(Map<String, dynamic> json) => _$RoverStateTelemetryFromJson(json);
}

@freezed
class RoverStatePiLits with _$RoverStatePiLits {
  const factory RoverStatePiLits({
    required PiLitStateType state,
    required int pi_lits_stowed_left,
    required int pi_lits_stowed_right,
    required List<RoverStatePiLit> deployed_pi_lits,
  }) = _RoverStatePiLits;

  factory RoverStatePiLits.fromJson(Map<String, dynamic> json) => _$RoverStatePiLitsFromJson(json);
}

@freezed
class RoverStatePiLit with _$RoverStatePiLit {
  const factory RoverStatePiLit({
    required String pi_lit_id,
    required DeviceLocation location,
  }) = _RoverStatePiLit;

  factory RoverStatePiLit.fromJson(Map<String, dynamic> json) => _$RoverStatePiLitFromJson(json);
}

@freezed
class RoverStateGarage with _$RoverStateGarage {
  const factory RoverStateGarage({
    required String garage_id,
    required DeviceLocation location,
  }) = _RoverStateGarage;

  factory RoverStateGarage.fromJson(Map<String, dynamic> json) => _$RoverStateGarageFromJson(json);
}
