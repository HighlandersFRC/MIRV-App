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
      health: json['health'] == null
          ? const DeviceHealth()
          : DeviceHealth.fromJson(json['health'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GarageMetricsToJson(_$_GarageMetrics instance) =>
    <String, dynamic>{
      'garage_id': instance.garage_id,
      'linked_rover_id': instance.linked_rover_id,
      'state': _$GarageStateTypeEnumMap[instance.state],
      'health': instance.health,
    };

const _$GarageStateTypeEnumMap = {
  GarageStateType.retracted_unlatched: 'retracted_unlatched',
  GarageStateType.retracted_latched: 'retracted_latched',
  GarageStateType.deployed: 'deployed',
  GarageStateType.unavailable: 'unavailable',
  GarageStateType.in_motion_retract: 'in_motion_retract',
  GarageStateType.in_motion_deploy: 'in_motion_deploy',
};
