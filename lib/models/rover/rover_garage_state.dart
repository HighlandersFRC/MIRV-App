// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/device_health.dart';
import 'package:mirv/models/rover/rover_state.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/device_status_type.dart';

part 'rover_garage_state.freezed.dart';
part 'rover_garage_state.g.dart';

@freezed
class RoverGarageState with _$RoverGarageState {
  const RoverGarageState._();

  const factory RoverGarageState({
    required String rover_id,
    required RoverStateType state,
    required DeviceStatusType status,
    double? battery_voltage,
    required int battery_percent,
    required RoverStateHealth subsystems,
    required RoverStateTelemetry telemetry,
    required RoverStatePiLits pi_lits,
    required Garage? garage,
  }) = _RoverGarageState;

  factory RoverGarageState.fromJson(Map<String, dynamic> json) => _$RoverGarageStateFromJson(json);

  static RoverGarageState fromRoverState(RoverState roverState, GarageMetrics? garageMetrics) {
    return RoverGarageState(
      rover_id: roverState.rover_id,
      state: roverState.state,
      status: roverState.status,
      battery_percent: roverState.battery_percent,
      battery_voltage: roverState.battery_voltage,
      subsystems: roverState.subsystems,
      telemetry: roverState.telemetry,
      pi_lits: roverState.pi_lits,
      garage: Garage.fromGarageMetrics(garageMetrics, roverState.garage?.location),
    );
  }

  RoverGarageState updateState(RoverState roverState) {
    Garage? garageValue = garage;
    if (garageValue != null && roverState.garage != null) {
      garageValue = garageValue.copyWith(location: roverState.garage!.location);
    }
    return copyWith(
        rover_id: roverState.rover_id,
        state: roverState.state,
        status: roverState.status,
        battery_voltage: roverState.battery_voltage,
        battery_percent: roverState.battery_percent,
        subsystems: roverState.subsystems,
        telemetry: roverState.telemetry,
        pi_lits: roverState.pi_lits,
        garage: garageValue);
  }

  RoverGarageState updateGarageState(GarageMetrics? garageMetrics) => copyWith(
          garage: garage?.copyWith(
        state: garageMetrics?.state,
        lights_on: garageMetrics?.lights_on,
        health: garageMetrics?.health,
        health_details: garageMetrics?.health_details,
      ));
}

@freezed
class Garage with _$Garage {
  const factory Garage({
    required String garage_id,
    required GarageStateType? state,
    required bool? lights_on,
    required DeviceHealthType? health,
    String? health_details,
    required DeviceLocation location,
  }) = _Garage;

  factory Garage.fromJson(Map<String, dynamic> json) => _$GarageFromJson(json);

  static Garage? fromGarageMetrics(GarageMetrics? garageMetrics, DeviceLocation? location) {
    if (garageMetrics == null || location == null) {
      return null;
    }
    return Garage(
      garage_id: garageMetrics.garage_id,
      state: garageMetrics.state,
      lights_on: garageMetrics.lights_on,
      health: garageMetrics.health,
      health_details: garageMetrics.health_details,
      location: location,
    );
  }
}
