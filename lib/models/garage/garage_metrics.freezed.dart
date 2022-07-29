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
  String get garage_id => throw _privateConstructorUsedError;
  String? get linked_rover_id => throw _privateConstructorUsedError;
  GarageStateType get state => throw _privateConstructorUsedError;
  DeviceHealth get health => throw _privateConstructorUsedError;

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
  $Res call(
      {String garage_id,
      String? linked_rover_id,
      GarageStateType state,
      DeviceHealth health});

  $DeviceHealthCopyWith<$Res> get health;
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
    Object? garage_id = freezed,
    Object? linked_rover_id = freezed,
    Object? state = freezed,
    Object? health = freezed,
  }) {
    return _then(_value.copyWith(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      linked_rover_id: linked_rover_id == freezed
          ? _value.linked_rover_id
          : linked_rover_id // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
    ));
  }

  @override
  $DeviceHealthCopyWith<$Res> get health {
    return $DeviceHealthCopyWith<$Res>(_value.health, (value) {
      return _then(_value.copyWith(health: value));
    });
  }
}

/// @nodoc
abstract class _$$_GarageMetricsCopyWith<$Res>
    implements $GarageMetricsCopyWith<$Res> {
  factory _$$_GarageMetricsCopyWith(
          _$_GarageMetrics value, $Res Function(_$_GarageMetrics) then) =
      __$$_GarageMetricsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String garage_id,
      String? linked_rover_id,
      GarageStateType state,
      DeviceHealth health});

  @override
  $DeviceHealthCopyWith<$Res> get health;
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
    Object? garage_id = freezed,
    Object? linked_rover_id = freezed,
    Object? state = freezed,
    Object? health = freezed,
  }) {
    return _then(_$_GarageMetrics(
      garage_id: garage_id == freezed
          ? _value.garage_id
          : garage_id // ignore: cast_nullable_to_non_nullable
              as String,
      linked_rover_id: linked_rover_id == freezed
          ? _value.linked_rover_id
          : linked_rover_id // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GarageStateType,
      health: health == freezed
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as DeviceHealth,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GarageMetrics implements _GarageMetrics {
  const _$_GarageMetrics(
      {required this.garage_id,
      this.linked_rover_id,
      required this.state,
      this.health = const DeviceHealth()});

  factory _$_GarageMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_GarageMetricsFromJson(json);

  @override
  final String garage_id;
  @override
  final String? linked_rover_id;
  @override
  final GarageStateType state;
  @override
  @JsonKey()
  final DeviceHealth health;

  @override
  String toString() {
    return 'GarageMetrics(garage_id: $garage_id, linked_rover_id: $linked_rover_id, state: $state, health: $health)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GarageMetrics &&
            const DeepCollectionEquality().equals(other.garage_id, garage_id) &&
            const DeepCollectionEquality()
                .equals(other.linked_rover_id, linked_rover_id) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.health, health));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(garage_id),
      const DeepCollectionEquality().hash(linked_rover_id),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(health));

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
      {required final String garage_id,
      final String? linked_rover_id,
      required final GarageStateType state,
      final DeviceHealth health}) = _$_GarageMetrics;

  factory _GarageMetrics.fromJson(Map<String, dynamic> json) =
      _$_GarageMetrics.fromJson;

  @override
  String get garage_id => throw _privateConstructorUsedError;
  @override
  String? get linked_rover_id => throw _privateConstructorUsedError;
  @override
  GarageStateType get state => throw _privateConstructorUsedError;
  @override
  DeviceHealth get health => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageMetricsCopyWith<_$_GarageMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}
