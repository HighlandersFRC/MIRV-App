// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverState _$$_RoverStateFromJson(Map<String, dynamic> json) =>
    _$_RoverState(
      rover_id: json['rover_id'] as String,
      state: $enumDecode(_$RoverStateTypeEnumMap, json['state']),
      status: $enumDecode(_$DeviceStatusTypeEnumMap, json['status']),
      battery_voltage: (json['battery_voltage'] as num?)?.toDouble(),
      battery_percent: json['battery_percent'] as int,
      subsystems:
          RoverStateHealth.fromJson(json['subsystems'] as Map<String, dynamic>),
      telemetry: RoverStateTelemetry.fromJson(
          json['telemetry'] as Map<String, dynamic>),
      pi_lits:
          RoverStatePiLits.fromJson(json['pi_lits'] as Map<String, dynamic>),
      garage: json['garage'] == null
          ? null
          : RoverStateGarage.fromJson(json['garage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoverStateToJson(_$_RoverState instance) =>
    <String, dynamic>{
      'rover_id': instance.rover_id,
      'state': _$RoverStateTypeEnumMap[instance.state],
      'status': _$DeviceStatusTypeEnumMap[instance.status],
      'battery_voltage': instance.battery_voltage,
      'battery_percent': instance.battery_percent,
      'subsystems': instance.subsystems,
      'telemetry': instance.telemetry,
      'pi_lits': instance.pi_lits,
      'garage': instance.garage,
    };

const _$RoverStateTypeEnumMap = {
  RoverStateType.disconnected: 'disconnected',
  RoverStateType.disconnected_fault: 'disconnected_fault',
  RoverStateType.e_stop: 'e_stop',
  RoverStateType.disabled: 'disabled',
  RoverStateType.docked: 'docked',
  RoverStateType.idle: 'idle',
  RoverStateType.fault: 'fault',
  RoverStateType.autonomous: 'autonomous',
  RoverStateType.remote_operation: 'remote_operation',
  RoverStateType.remote_operation_autonomous: 'remote_operation_autonomous',
};

const _$DeviceStatusTypeEnumMap = {
  DeviceStatusType.available: 'available',
  DeviceStatusType.unavailable: 'unavailable',
};

_$_RoverStateHealth _$$_RoverStateHealthFromJson(Map<String, dynamic> json) =>
    _$_RoverStateHealth(
      electronics: json['electronics'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['electronics'] as Map<String, dynamic>),
      drivetrain: json['drivetrain'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['drivetrain'] as Map<String, dynamic>),
      intake: json['intake'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['intake'] as Map<String, dynamic>),
      sensors: json['sensors'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['sensors'] as Map<String, dynamic>),
      garage: json['garage'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['garage'] as Map<String, dynamic>),
      power: json['power'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['power'] as Map<String, dynamic>),
      general: json['general'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['general'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoverStateHealthToJson(_$_RoverStateHealth instance) =>
    <String, dynamic>{
      'electronics': instance.electronics,
      'drivetrain': instance.drivetrain,
      'intake': instance.intake,
      'sensors': instance.sensors,
      'garage': instance.garage,
      'power': instance.power,
      'general': instance.general,
    };

_$_RoverStateTelemetry _$$_RoverStateTelemetryFromJson(
        Map<String, dynamic> json) =>
    _$_RoverStateTelemetry(
      location:
          DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
      heading: (json['heading'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RoverStateTelemetryToJson(
        _$_RoverStateTelemetry instance) =>
    <String, dynamic>{
      'location': instance.location,
      'heading': instance.heading,
      'speed': instance.speed,
    };

_$_RoverStatePiLits _$$_RoverStatePiLitsFromJson(Map<String, dynamic> json) =>
    _$_RoverStatePiLits(
      state: $enumDecode(_$PiLitStateTypeEnumMap, json['state']),
      pi_lits_stowed_left: json['pi_lits_stowed_left'] as int,
      pi_lits_stowed_right: json['pi_lits_stowed_right'] as int,
      deployed_pi_lits: (json['deployed_pi_lits'] as List<dynamic>)
          .map((e) => RoverStatePiLit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RoverStatePiLitsToJson(_$_RoverStatePiLits instance) =>
    <String, dynamic>{
      'state': _$PiLitStateTypeEnumMap[instance.state],
      'pi_lits_stowed_left': instance.pi_lits_stowed_left,
      'pi_lits_stowed_right': instance.pi_lits_stowed_right,
      'deployed_pi_lits': instance.deployed_pi_lits,
    };

const _$PiLitStateTypeEnumMap = {
  PiLitStateType.no_pi_lits: 'no_pi_lits',
  PiLitStateType.idle: 'idle',
  PiLitStateType.wave: 'wave',
  PiLitStateType.wave_reverse: 'wave_reverse',
  PiLitStateType.simultaneous: 'simultaneous',
};

_$_RoverStatePiLit _$$_RoverStatePiLitFromJson(Map<String, dynamic> json) =>
    _$_RoverStatePiLit(
      pi_lit_id: json['pi_lit_id'] as String,
      location:
          DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoverStatePiLitToJson(_$_RoverStatePiLit instance) =>
    <String, dynamic>{
      'pi_lit_id': instance.pi_lit_id,
      'location': instance.location,
    };

_$_RoverStateGarage _$$_RoverStateGarageFromJson(Map<String, dynamic> json) =>
    _$_RoverStateGarage(
      garage_id: json['garage_id'] as String,
      location:
          DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoverStateGarageToJson(_$_RoverStateGarage instance) =>
    <String, dynamic>{
      'garage_id': instance.garage_id,
      'location': instance.location,
    };
