// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'garage_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GarageMetrics _$GarageMetricsFromJson(Map<String, dynamic> json) {
  return _GarageMetrics.fromJson(json);
}

/// @nodoc
mixin _$GarageMetrics {
  String get garageId => throw _privateConstructorUsedError;
  GarageStateType get state =>
      throw _privateConstructorUsedError; //Rover StateType
  GarageStatusType get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarageMetricsCopyWith<GarageMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarageMetricsCopyWith<$Res> {
  factory $GarageMetricsCopyWith(
          GarageMetrics value, $Res Function(GarageMetrics) then) =
      _$GarageMetricsCopyWithImpl<$Res>;
  $Res call({String garageId, GarageStateType state, GarageStatusType status});
}

/// @nodoc
class _$GarageMetricsCopyWithImpl<$Res>
    implements $GarageMetricsCopyWith<$Res> {
  _$GarageMetricsCopyWithImpl(this._value, this._then);

  final GarageMetrics _value;
  // ignore: unused_field
  final $Res Function(GarageMetrics) _then;

  @override
  $Res call({
    Object? garageId = freezed,
    Object? state = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      garageId: garageId == freezed
          ? _value.garageId
          : garageId // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GarageStatusType,
    ));
  }
}

/// @nodoc
abstract class _$$_GarageMetricsCopyWith<$Res>
    implements $GarageMetricsCopyWith<$Res> {
  factory _$$_GarageMetricsCopyWith(
          _$_GarageMetrics value, $Res Function(_$_GarageMetrics) then) =
      __$$_GarageMetricsCopyWithImpl<$Res>;
  @override
  $Res call({String garageId, GarageStateType state, GarageStatusType status});
}

/// @nodoc
class __$$_GarageMetricsCopyWithImpl<$Res>
    extends _$GarageMetricsCopyWithImpl<$Res>
    implements _$$_GarageMetricsCopyWith<$Res> {
  __$$_GarageMetricsCopyWithImpl(
      _$_GarageMetrics _value, $Res Function(_$_GarageMetrics) _then)
      : super(_value, (v) => _then(v as _$_GarageMetrics));

  @override
  _$_GarageMetrics get _value => super._value as _$_GarageMetrics;

  @override
  $Res call({
    Object? garageId = freezed,
    Object? state = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_GarageMetrics(
      garageId: garageId == freezed
          ? _value.garageId
          : garageId // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GarageStatusType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GarageMetrics implements _GarageMetrics {
  const _$_GarageMetrics(
      {this.garageId = "unknown",
      this.state = GarageStateType.unlocked,
      this.status = GarageStatusType.available});

  factory _$_GarageMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_GarageMetricsFromJson(json);

  @override
  @JsonKey()
  final String garageId;
  @override
  @JsonKey()
  final GarageStateType state;
//Rover StateType
  @override
  @JsonKey()
  final GarageStatusType status;

  @override
  String toString() {
    return 'GarageMetrics(garageId: $garageId, state: $state, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GarageMetrics &&
            const DeepCollectionEquality().equals(other.garageId, garageId) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(garageId),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_GarageMetricsCopyWith<_$_GarageMetrics> get copyWith =>
      __$$_GarageMetricsCopyWithImpl<_$_GarageMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GarageMetricsToJson(this);
  }
}

abstract class _GarageMetrics implements GarageMetrics {
  const factory _GarageMetrics(
      {final String garageId,
      final GarageStateType state,
      final GarageStatusType status}) = _$_GarageMetrics;

  factory _GarageMetrics.fromJson(Map<String, dynamic> json) =
      _$_GarageMetrics.fromJson;

  @override
  String get garageId => throw _privateConstructorUsedError;
  @override
  GarageStateType get state => throw _privateConstructorUsedError;
  @override //Rover StateType
  GarageStatusType get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageMetricsCopyWith<_$_GarageMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}
