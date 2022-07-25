// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GarageMetrics _$$_GarageMetricsFromJson(Map<String, dynamic> json) =>
    _$_GarageMetrics(
      garage_id: json['garage_id'] as String,
      linked_rover_id: json['linked_rover_id'] as String?,
      latched: json['latched'] as bool,
      position:
          $enumDecodeNullable(_$GaragePositionEnumMap, json['position']) ??
              GaragePosition.down,
      status: $enumDecodeNullable(_$GarageStatusTypeEnumMap, json['status']) ??
          GarageStatusType.available,
      location: json['location'] == null
          ? const RoverMetricLocation()
          : RoverMetricLocation.fromJson(
              json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GarageMetricsToJson(_$_GarageMetrics instance) =>
    <String, dynamic>{
      'garage_id': instance.garage_id,
      'linked_rover_id': instance.linked_rover_id,
      'latched': instance.latched,
      'position': _$GaragePositionEnumMap[instance.position],
      'status': _$GarageStatusTypeEnumMap[instance.status],
      'location': instance.location,
    };

const _$GaragePositionEnumMap = {
  GaragePosition.up: 'up',
  GaragePosition.down: 'down',
};

const _$GarageStatusTypeEnumMap = {
  GarageStatusType.available: 'available',
  GarageStatusType.unavailable: 'unavailable',
};
