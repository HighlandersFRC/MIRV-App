// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GarageMetrics _$$_GarageMetricsFromJson(Map<String, dynamic> json) => _$_GarageMetrics(
      garage_id: json['garage_id'] as String,
      linked_rover_id: json['linked_rover_id'] as String?,
      state: $enumDecode(_$GarageStateTypeEnumMap, json['state']),
      status: $enumDecodeNullable(_$GarageStatusTypeEnumMap, json['status']) ?? GarageStatusType.available,
      health: json['health'] == null
          ? const GarageMetricHealth()
          : GarageMetricHealth.fromJson(json['health'] as Map<String, dynamic>),
      location: DeviceLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GarageMetricsToJson(_$_GarageMetrics instance) => <String, dynamic>{
      'garage_id': instance.garage_id,
      'linked_rover_id': instance.linked_rover_id,
      'state': _$GarageStateTypeEnumMap[instance.state],
      'status': _$GarageStatusTypeEnumMap[instance.status],
      'health': instance.health,
      'location': instance.location,
    };

const _$GarageStateTypeEnumMap = {
  GarageStateType.retracted_unlatched: 'retracted_unlatched',
  GarageStateType.retracted_latched: 'retracted_latched',
  GarageStateType.deployed: 'deployed',
  GarageStateType.disabled: 'disabled',
  GarageStateType.unavailable: 'unavailable',
};

const _$GarageStatusTypeEnumMap = {
  GarageStatusType.available: 'available',
  GarageStatusType.unavailable: 'unavailable',
};

_$_GarageMetricHealth _$$_GarageMetricHealthFromJson(Map<String, dynamic> json) => _$_GarageMetricHealth(
      motor_controllers:
          $enumDecodeNullable(_$DeviceHealthTypeEnumMap, json['motor_controllers']) ?? DeviceHealthType.unavailable,
    );

Map<String, dynamic> _$$_GarageMetricHealthToJson(_$_GarageMetricHealth instance) => <String, dynamic>{
      'motor_controllers': _$DeviceHealthTypeEnumMap[instance.motor_controllers],
    };

const _$DeviceHealthTypeEnumMap = {
  DeviceHealthType.healthy: 'healthy',
  DeviceHealthType.unhealthy: 'unhealthy',
  DeviceHealthType.degraded: 'degraded',
  DeviceHealthType.unavailable: 'unavailable',
};
