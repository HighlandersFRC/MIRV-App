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
      throw _privateConstructorUsedError; //Garage StateType
  GarageStatusType get status =>
      throw _privateConstructorUsedError; //GarageStatusType
  GarageMetricLocation get location => throw _privateConstructorUsedError;

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
      {String garageId,
      GarageStateType state,
      GarageStatusType status,
      GarageMetricLocation location});

  $GarageMetricLocationCopyWith<$Res> get location;
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
    Object? location = freezed,
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
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GarageMetricLocation,
    ));
  }

  @override
  $GarageMetricLocationCopyWith<$Res> get location {
    return $GarageMetricLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
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
      {String garageId,
      GarageStateType state,
      GarageStatusType status,
      GarageMetricLocation location});

  @override
  $GarageMetricLocationCopyWith<$Res> get location;
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
    Object? location = freezed,
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
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GarageMetricLocation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GarageMetrics implements _GarageMetrics {
  const _$_GarageMetrics(
      {this.garageId = "unknown",
      this.state = GarageStateType.unlocked,
      this.status = GarageStatusType.available,
      this.location = const GarageMetricLocation()});

  factory _$_GarageMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_GarageMetricsFromJson(json);

  @override
  @JsonKey()
  final String garageId;
  @override
  @JsonKey()
  final GarageStateType state;
//Garage StateType
  @override
  @JsonKey()
  final GarageStatusType status;
//GarageStatusType
  @override
  @JsonKey()
  final GarageMetricLocation location;

  @override
  String toString() {
    return 'GarageMetrics(garageId: $garageId, state: $state, status: $status, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GarageMetrics &&
            const DeepCollectionEquality().equals(other.garageId, garageId) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(garageId),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(location));

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
      final GarageStatusType status,
      final GarageMetricLocation location}) = _$_GarageMetrics;

  factory _GarageMetrics.fromJson(Map<String, dynamic> json) =
      _$_GarageMetrics.fromJson;

  @override
  String get garageId => throw _privateConstructorUsedError;
  @override
  GarageStateType get state => throw _privateConstructorUsedError;
  @override //Garage StateType
  GarageStatusType get status => throw _privateConstructorUsedError;
  @override //GarageStatusType
  GarageMetricLocation get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageMetricsCopyWith<_$_GarageMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

GarageMetricLocation _$GarageMetricLocationFromJson(Map<String, dynamic> json) {
  return _GarageMetricLocation.fromJson(json);
}

/// @nodoc
mixin _$GarageMetricLocation {
  double get long => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarageMetricLocationCopyWith<GarageMetricLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarageMetricLocationCopyWith<$Res> {
  factory $GarageMetricLocationCopyWith(GarageMetricLocation value,
          $Res Function(GarageMetricLocation) then) =
      _$GarageMetricLocationCopyWithImpl<$Res>;
  $Res call({double long, double lat});
}

/// @nodoc
class _$GarageMetricLocationCopyWithImpl<$Res>
    implements $GarageMetricLocationCopyWith<$Res> {
  _$GarageMetricLocationCopyWithImpl(this._value, this._then);

  final GarageMetricLocation _value;
  // ignore: unused_field
  final $Res Function(GarageMetricLocation) _then;

  @override
  $Res call({
    Object? long = freezed,
    Object? lat = freezed,
  }) {
    return _then(_value.copyWith(
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_GarageMetricLocationCopyWith<$Res>
    implements $GarageMetricLocationCopyWith<$Res> {
  factory _$$_GarageMetricLocationCopyWith(_$_GarageMetricLocation value,
          $Res Function(_$_GarageMetricLocation) then) =
      __$$_GarageMetricLocationCopyWithImpl<$Res>;
  @override
  $Res call({double long, double lat});
}

/// @nodoc
class __$$_GarageMetricLocationCopyWithImpl<$Res>
    extends _$GarageMetricLocationCopyWithImpl<$Res>
    implements _$$_GarageMetricLocationCopyWith<$Res> {
  __$$_GarageMetricLocationCopyWithImpl(_$_GarageMetricLocation _value,
      $Res Function(_$_GarageMetricLocation) _then)
      : super(_value, (v) => _then(v as _$_GarageMetricLocation));

  @override
  _$_GarageMetricLocation get _value => super._value as _$_GarageMetricLocation;

  @override
  $Res call({
    Object? long = freezed,
    Object? lat = freezed,
  }) {
    return _then(_$_GarageMetricLocation(
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GarageMetricLocation implements _GarageMetricLocation {
  const _$_GarageMetricLocation({this.long = 0.0, this.lat = 0.0});

  factory _$_GarageMetricLocation.fromJson(Map<String, dynamic> json) =>
      _$$_GarageMetricLocationFromJson(json);

  @override
  @JsonKey()
  final double long;
  @override
  @JsonKey()
  final double lat;

  @override
  String toString() {
    return 'GarageMetricLocation(long: $long, lat: $lat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GarageMetricLocation &&
            const DeepCollectionEquality().equals(other.long, long) &&
            const DeepCollectionEquality().equals(other.lat, lat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(long),
      const DeepCollectionEquality().hash(lat));

  @JsonKey(ignore: true)
  @override
  _$$_GarageMetricLocationCopyWith<_$_GarageMetricLocation> get copyWith =>
      __$$_GarageMetricLocationCopyWithImpl<_$_GarageMetricLocation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GarageMetricLocationToJson(this);
  }
}

abstract class _GarageMetricLocation implements GarageMetricLocation {
  const factory _GarageMetricLocation({final double long, final double lat}) =
      _$_GarageMetricLocation;

  factory _GarageMetricLocation.fromJson(Map<String, dynamic> json) =
      _$_GarageMetricLocation.fromJson;

  @override
  double get long => throw _privateConstructorUsedError;
  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GarageMetricLocationCopyWith<_$_GarageMetricLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
