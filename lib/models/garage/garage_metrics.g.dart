// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GarageMetrics _$$_GarageMetricsFromJson(Map<String, dynamic> json) =>
    _$_GarageMetrics(
      garageId: json['garageId'] as String? ?? "unknown",
      state: $enumDecodeNullable(_$GarageStateTypeEnumMap, json['state']) ??
          GarageStateType.unlocked,
      status: $enumDecodeNullable(_$GarageStatusTypeEnumMap, json['status']) ??
          GarageStatusType.available,
    );

Map<String, dynamic> _$$_GarageMetricsToJson(_$_GarageMetrics instance) =>
    <String, dynamic>{
      'garageId': instance.garageId,
      'state': _$GarageStateTypeEnumMap[instance.state],
      'status': _$GarageStatusTypeEnumMap[instance.status],
    };

const _$GarageStateTypeEnumMap = {
  GarageStateType.up: 'up',
  GarageStateType.down: 'down',
  GarageStateType.locked: 'locked',
  GarageStateType.unlocked: 'unlocked',
};

const _$GarageStatusTypeEnumMap = {
  GarageStatusType.available: 'available',
  GarageStatusType.unavailable: 'unavailable',
};
