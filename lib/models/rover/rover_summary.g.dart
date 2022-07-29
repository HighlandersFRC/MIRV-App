// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoverSummary _$$_RoverSummaryFromJson(Map<String, dynamic> json) =>
    _$_RoverSummary(
      rover_id: json['rover_id'] as String? ?? "unknown",
      state: $enumDecodeNullable(_$RoverStateTypeEnumMap, json['state']) ??
          RoverStateType.disconnected,
      status: $enumDecodeNullable(_$DeviceStatusTypeEnumMap, json['status']) ??
          DeviceStatusType.available,
      battery_percent: json['battery_percent'] as int? ?? -1,
    );

Map<String, dynamic> _$$_RoverSummaryToJson(_$_RoverSummary instance) =>
    <String, dynamic>{
      'rover_id': instance.rover_id,
      'state': _$RoverStateTypeEnumMap[instance.state],
      'status': _$DeviceStatusTypeEnumMap[instance.status],
      'battery_percent': instance.battery_percent,
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
