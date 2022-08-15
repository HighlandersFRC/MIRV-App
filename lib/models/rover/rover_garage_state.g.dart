// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_garage_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverGarageState _$$_RoverGarageStateFromJson(Map<String, dynamic> json) =>
    _$_RoverGarageState(
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
          : Garage.fromJson(json['garage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoverGarageStateToJson(_$_RoverGarageState instance) =>
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

_$_Garage _$$_GarageFromJson(Map<String, dynamic> json) => _$_Garage(
      garage_id: json['garage_id'] as String,
      state: $enumDecodeNullable(_$GarageStateTypeEnumMap, json['state']),
      lights_on: json['lights_on'] as bool?,
      health: $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['health']),
      health_details: json['health_details'] as String?,
      location:
          DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GarageToJson(_$_Garage instance) => <String, dynamic>{
      'garage_id': instance.garage_id,
      'state': _$GarageStateTypeEnumMap[instance.state],
      'lights_on': instance.lights_on,
      'health': _$DeviceHealthTypeEnumMap[instance.health],
      'health_details': instance.health_details,
      'location': instance.location,
    };

const _$GarageStateTypeEnumMap = {
  GarageStateType.retracted_unlatched: 'retracted_unlatched',
  GarageStateType.retracted_latched: 'retracted_latched',
  GarageStateType.deployed: 'deployed',
  GarageStateType.unavailable: 'unavailable',
  GarageStateType.in_motion_retract: 'in_motion_retract',
  GarageStateType.in_motion_deploy: 'in_motion_deploy',
};

const _$DeviceHealthTypeEnumMap = {
  DeviceHealthType.healthy: 'healthy',
  DeviceHealthType.unhealthy: 'unhealthy',
  DeviceHealthType.degraded: 'degraded',
  DeviceHealthType.unavailable: 'unavailable',
};
