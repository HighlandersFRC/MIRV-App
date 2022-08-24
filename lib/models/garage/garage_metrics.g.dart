// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GarageMetrics _$$_GarageMetricsFromJson(Map<String, dynamic> json) =>
    _$_GarageMetrics(
      garage_id: json['garage_id'] as String,
      linked_rover_id: json['linked_rover_id'] as String?,
      state: $enumDecode(_$GarageStateTypeEnumMap, json['state']),
      lights_on: json['lights_on'] as bool? ?? false,
      health: $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['health']) ??
          DeviceHealthType.unavailable,
      health_details: json['health_details'] as String?,
    );

Map<String, dynamic> _$$_GarageMetricsToJson(_$_GarageMetrics instance) =>
    <String, dynamic>{
      'garage_id': instance.garage_id,
      'linked_rover_id': instance.linked_rover_id,
      'state': _$GarageStateTypeEnumMap[instance.state],
      'lights_on': instance.lights_on,
      'health': _$DeviceHealthTypeEnumMap[instance.health],
      'health_details': instance.health_details,
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
