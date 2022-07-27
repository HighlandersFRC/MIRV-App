// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverMetrics _$$_RoverMetricsFromJson(Map<String, dynamic> json) =>
    _$_RoverMetrics(
      rover_id: json['rover_id'] as String,
      state: $enumDecodeNullable(_$RoverStateTypeEnumMap, json['state']) ??
          RoverStateType.disconnected,
      status: $enumDecodeNullable(_$DeviceStatusTypeEnumMap, json['status']) ??
          DeviceStatusType.available,
      battery_voltage: json['battery_voltage'] as int? ?? -1,
      battery_percent: json['battery_percent'] as int? ?? -1,
      health: json['health'] == null
          ? const RoverMetricHealth()
          : RoverMetricHealth.fromJson(json['health'] as Map<String, dynamic>),
      telemetry: json['telemetry'] == null
          ? const RoverMetricTelemetry()
          : RoverMetricTelemetry.fromJson(
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
      location: json['location'] == null
          ? const DeviceLocation()
          : DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
      heading: (json['heading'] as num?)?.toDouble() ?? 0.0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_RoverMetricTelemetryToJson(
        _$_RoverMetricTelemetry instance) =>
    <String, dynamic>{
      'location': instance.location,
      'heading': instance.heading,
      'speed': instance.speed,
    };
