// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rover_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoverSummary _$RoverSummaryFromJson(Map<String, dynamic> json) {
  return _RoverSummary.fromJson(json);
}

/// @nodoc
mixin _$RoverSummary {
  String get roverId => throw _privateConstructorUsedError;
  RoverStateType get state =>
      throw _privateConstructorUsedError; //RoverStateType
  RoverStatusType get status =>
      throw _privateConstructorUsedError; //RoverStatusType
  int get battery => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverSummaryCopyWith<RoverSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverSummaryCopyWith<$Res> {
  factory $RoverSummaryCopyWith(
          RoverSummary value, $Res Function(RoverSummary) then) =
      _$RoverSummaryCopyWithImpl<$Res>;
  $Res call(
      {String roverId,
      RoverStateType state,
      RoverStatusType status,
      int battery});
}

/// @nodoc
class _$RoverSummaryCopyWithImpl<$Res> implements $RoverSummaryCopyWith<$Res> {
  _$RoverSummaryCopyWithImpl(this._value, this._then);

  final RoverSummary _value;
  // ignore: unused_field
  final $Res Function(RoverSummary) _then;

  @override
  $Res call({
    Object? roverId = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? battery = freezed,
  }) {
    return _then(_value.copyWith(
      roverId: roverId == freezed
          ? _value.roverId
          : roverId // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RoverStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoverStatusType,
      battery: battery == freezed
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RoverSummaryCopyWith<$Res>
    implements $RoverSummaryCopyWith<$Res> {
  factory _$$_RoverSummaryCopyWith(
          _$_RoverSummary value, $Res Function(_$_RoverSummary) then) =
      __$$_RoverSummaryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String roverId,
      RoverStateType state,
      RoverStatusType status,
      int battery});
}

/// @nodoc
class __$$_RoverSummaryCopyWithImpl<$Res>
    extends _$RoverSummaryCopyWithImpl<$Res>
    implements _$$_RoverSummaryCopyWith<$Res> {
  __$$_RoverSummaryCopyWithImpl(
      _$_RoverSummary _value, $Res Function(_$_RoverSummary) _then)
      : super(_value, (v) => _then(v as _$_RoverSummary));

  @override
  _$_RoverSummary get _value => super._value as _$_RoverSummary;

  @override
  $Res call({
    Object? roverId = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? battery = freezed,
  }) {
    return _then(_$_RoverSummary(
      roverId: roverId == freezed
          ? _value.roverId
          : roverId // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RoverStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoverStatusType,
      battery: battery == freezed
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverSummary implements _RoverSummary {
  const _$_RoverSummary(
      {this.roverId = "unknown",
      this.state = RoverStateType.remoteOperation,
      this.status = RoverStatusType.available,
      this.battery = -1});

  factory _$_RoverSummary.fromJson(Map<String, dynamic> json) =>
      _$$_RoverSummaryFromJson(json);

  @override
  @JsonKey()
  final String roverId;
  @override
  @JsonKey()
  final RoverStateType state;
//RoverStateType
  @override
  @JsonKey()
  final RoverStatusType status;
//RoverStatusType
  @override
  @JsonKey()
  final int battery;

  @override
  String toString() {
    return 'RoverSummary(roverId: $roverId, state: $state, status: $status, battery: $battery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverSummary &&
            const DeepCollectionEquality().equals(other.roverId, roverId) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.battery, battery));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(roverId),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(battery));

  @JsonKey(ignore: true)
  @override
  _$$_RoverSummaryCopyWith<_$_RoverSummary> get copyWith =>
      __$$_RoverSummaryCopyWithImpl<_$_RoverSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverSummaryToJson(this);
  }
}

abstract class _RoverSummary implements RoverSummary {
  const factory _RoverSummary(
      {final String roverId,
      final RoverStateType state,
      final RoverStatusType status,
      final int battery}) = _$_RoverSummary;

  factory _RoverSummary.fromJson(Map<String, dynamic> json) =
      _$_RoverSummary.fromJson;

  @override
  String get roverId => throw _privateConstructorUsedError;
  @override
  RoverStateType get state => throw _privateConstructorUsedError;
  @override //RoverStateType
  RoverStatusType get status => throw _privateConstructorUsedError;
  @override //RoverStatusType
  int get battery => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverSummaryCopyWith<_$_RoverSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
