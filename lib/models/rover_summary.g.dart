// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverSummary _$$_RoverSummaryFromJson(Map<String, dynamic> json) => _$_RoverSummary(
      roverId: json['roverId'] as String? ?? "unknown",
      state: $enumDecodeNullable(_$RoverStateTypeEnumMap, json['state']) ?? RoverStateType.remoteOperation,
      status: $enumDecodeNullable(_$RoverStatusTypeEnumMap, json['status']) ?? RoverStatusType.available,
      battery: json['battery'] as int? ?? -1,
    );

Map<String, dynamic> _$$_RoverSummaryToJson(_$_RoverSummary instance) => <String, dynamic>{
      'roverId': instance.roverId,
      'state': _$RoverStateTypeEnumMap[instance.state],
      'status': _$RoverStatusTypeEnumMap[instance.status],
      'battery': instance.battery,
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
