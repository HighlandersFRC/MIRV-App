// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverMetrics _$$_RoverMetricsFromJson(Map<String, dynamic> json) =>
    _$_RoverMetrics(
      rover_id: json['rover_id'] as String,
      state: $enumDecode(_$RoverStateTypeEnumMap, json['state']),
      status: $enumDecode(_$DeviceStatusTypeEnumMap, json['status']),
      battery_voltage: (json['battery_voltage'] as num?)?.toDouble(),
      battery_percent: json['battery_percent'] as int?,
      health:
          RoverMetricHealth.fromJson(json['health'] as Map<String, dynamic>),
      telemetry: RoverMetricTelemetry.fromJson(
          json['telemetry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoverMetricsToJson(_$_RoverMetrics instance) =>
    <String, dynamic>{
      'rover_id': instance.rover_id,
      'state': _$RoverStateTypeEnumMap[instance.state],
      'status': _$DeviceStatusTypeEnumMap[instance.status],
      'battery_voltage': instance.battery_voltage,
      'battery_percent': instance.battery_percent,
      'health': instance.health,
      'telemetry': instance.telemetry,
    };

const _$RoverStateTypeEnumMap = {
  RoverStateType.disconnected: 'disconnected',
  RoverStateType.disconnected_fault: 'disconnected_fault',
  RoverStateType.e_stop: 'e_stop',
  RoverStateType.connected_disabled: 'connected_disabled',
  RoverStateType.connected_idle_roaming: 'connected_idle_roaming',
  RoverStateType.connected_idle_docked: 'connected_idle_docked',
  RoverStateType.connected_fault: 'connected_fault',
  RoverStateType.autonomous: 'autonomous',
  RoverStateType.remote_operation: 'remote_operation',
};

const _$DeviceStatusTypeEnumMap = {
  DeviceStatusType.available: 'available',
  DeviceStatusType.unavailable: 'unavailable',
};

_$_RoverMetricHealth _$$_RoverMetricHealthFromJson(Map<String, dynamic> json) =>
    _$_RoverMetricHealth(
      electronics:
          $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['electronics']) ??
              DeviceHealthType.unavailable,
      drivetrain:
          $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['drivetrain']) ??
              DeviceHealthType.unavailable,
      intake: $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['intake']) ??
          DeviceHealthType.unavailable,
      sensors:
          $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['sensors']) ??
              DeviceHealthType.unavailable,
      garage: $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['garage']) ??
          DeviceHealthType.unavailable,
      power: $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['power']) ??
          DeviceHealthType.unavailable,
      general:
          $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['general']) ??
              DeviceHealthType.unavailable,
    );

Map<String, dynamic> _$$_RoverMetricHealthToJson(
        _$_RoverMetricHealth instance) =>
    <String, dynamic>{
      'electronics': _$DeviceHealthTypeEnumMap[instance.electronics],
      'drivetrain': _$DeviceHealthTypeEnumMap[instance.drivetrain],
      'intake': _$DeviceHealthTypeEnumMap[instance.intake],
      'sensors': _$DeviceHealthTypeEnumMap[instance.sensors],
      'garage': _$DeviceHealthTypeEnumMap[instance.garage],
      'power': _$DeviceHealthTypeEnumMap[instance.power],
      'general': _$DeviceHealthTypeEnumMap[instance.general],
    };

const _$DeviceHealthTypeEnumMap = {
  DeviceHealthType.healthy: 'healthy',
  DeviceHealthType.unhealthy: 'unhealthy',
  DeviceHealthType.degraded: 'degraded',
  DeviceHealthType.unavailable: 'unavailable',
};

_$_RoverMetricTelemetry _$$_RoverMetricTelemetryFromJson(
        Map<String, dynamic> json) =>
    _$_RoverMetricTelemetry(
      location:
          DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
      heading: (json['heading'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RoverMetricTelemetryToJson(
        _$_RoverMetricTelemetry instance) =>
    <String, dynamic>{
      'location': instance.location,
      'heading': instance.heading,
      'speed': instance.speed,
    };

_$_RoverPiLits _$$_RoverPiLitsFromJson(Map<String, dynamic> json) =>
    _$_RoverPiLits(
      state: $enumDecode(_$PiLitStateTypeEnumMap, json['state']),
      pi_lits_stowed_left: json['pi_lits_stowed_left'] as int,
      pi_lits_stowed_right: json['pi_lits_stowed_right'] as int,
      deployed_pi_lits: (json['deployed_pi_lits'] as List<dynamic>)
          .map((e) => PiLit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RoverPiLitsToJson(_$_RoverPiLits instance) =>
    <String, dynamic>{
      'state': _$PiLitStateTypeEnumMap[instance.state],
      'pi_lits_stowed_left': instance.pi_lits_stowed_left,
      'pi_lits_stowed_right': instance.pi_lits_stowed_right,
      'deployed_pi_lits': instance.deployed_pi_lits,
    };

const _$PiLitStateTypeEnumMap = {
  PiLitStateType.off: 'off',
  PiLitStateType.idle: 'idle',
  PiLitStateType.sequential_1: 'sequential_1',
  PiLitStateType.sequential_2: 'sequential_2',
  PiLitStateType.simultaneous: 'simultaneous',
  PiLitStateType.steady_burn: 'steady_burn',
};

_$_PiLit _$$_PiLitFromJson(Map<String, dynamic> json) => _$_PiLit(
      pi_lit_id: json['pi_lit_id'] as String,
      location:
          DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PiLitToJson(_$_PiLit instance) => <String, dynamic>{
      'pi_lit_id': instance.pi_lit_id,
      'location': instance.location,
    };
