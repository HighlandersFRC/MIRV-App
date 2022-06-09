// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverMetrics _$$_RoverMetricsFromJson(Map<String, dynamic> json) =>
    _$_RoverMetrics(
      roverId: json['roverId'] as String? ?? "unknown",
      state: $enumDecodeNullable(_$RoverStateTypeEnumMap, json['state']) ??
          RoverStateType.disabled,
      status: $enumDecodeNullable(_$RoverStatusTypeEnumMap, json['status']) ??
          RoverStatusType.unavailable,
      battery: json['battery'] as int? ?? -1,
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
      'roverId': instance.roverId,
      'state': _$RoverStateTypeEnumMap[instance.state],
      'status': _$RoverStatusTypeEnumMap[instance.status],
      'battery': instance.battery,
      'health': instance.health,
      'telemetry': instance.telemetry,
    };

const _$RoverStateTypeEnumMap = {
  RoverStateType.docked: 'docked',
  RoverStateType.remoteOperation: 'remoteOperation',
  RoverStateType.disabled: 'disabled',
  RoverStateType.eStop: 'eStop',
};

const _$RoverStatusTypeEnumMap = {
  RoverStatusType.available: 'available',
  RoverStatusType.unavailable: 'unavailable',
};

_$_RoverMetricHealth _$$_RoverMetricHealthFromJson(Map<String, dynamic> json) =>
    _$_RoverMetricHealth(
      electronics:
          $enumDecodeNullable(_$RoverHealthTypeEnumMap, json['electronics']) ??
              RoverHealthType.unavailable,
      drivetrain:
          $enumDecodeNullable(_$RoverHealthTypeEnumMap, json['drivetrain']) ??
              RoverHealthType.unavailable,
      intake: $enumDecodeNullable(_$RoverHealthTypeEnumMap, json['intake']) ??
          RoverHealthType.unavailable,
      sensors: $enumDecodeNullable(_$RoverHealthTypeEnumMap, json['sensors']) ??
          RoverHealthType.unavailable,
      garage: $enumDecodeNullable(_$RoverHealthTypeEnumMap, json['garage']) ??
          RoverHealthType.unavailable,
      power: $enumDecodeNullable(_$RoverHealthTypeEnumMap, json['power']) ??
          RoverHealthType.unavailable,
      general: $enumDecodeNullable(_$RoverHealthTypeEnumMap, json['general']) ??
          RoverHealthType.unavailable,
    );

Map<String, dynamic> _$$_RoverMetricHealthToJson(
        _$_RoverMetricHealth instance) =>
    <String, dynamic>{
      'electronics': _$RoverHealthTypeEnumMap[instance.electronics],
      'drivetrain': _$RoverHealthTypeEnumMap[instance.drivetrain],
      'intake': _$RoverHealthTypeEnumMap[instance.intake],
      'sensors': _$RoverHealthTypeEnumMap[instance.sensors],
      'garage': _$RoverHealthTypeEnumMap[instance.garage],
      'power': _$RoverHealthTypeEnumMap[instance.power],
      'general': _$RoverHealthTypeEnumMap[instance.general],
    };

const _$RoverHealthTypeEnumMap = {
  RoverHealthType.healthy: 'healthy',
  RoverHealthType.unhealthy: 'unhealthy',
  RoverHealthType.degraded: 'degraded',
  RoverHealthType.unavailable: 'unavailable',
};

_$_RoverMetricTelemetry _$$_RoverMetricTelemetryFromJson(
        Map<String, dynamic> json) =>
    _$_RoverMetricTelemetry(
      location: json['location'] == null
          ? const RoverMetricLocation()
          : RoverMetricLocation.fromJson(
              json['location'] as Map<String, dynamic>),
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

_$_RoverMetricLocation _$$_RoverMetricLocationFromJson(
        Map<String, dynamic> json) =>
    _$_RoverMetricLocation(
      long: (json['long'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_RoverMetricLocationToJson(
        _$_RoverMetricLocation instance) =>
    <String, dynamic>{
      'long': instance.long,
      'lat': instance.lat,
    };
