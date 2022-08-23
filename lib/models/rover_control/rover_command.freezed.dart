// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rover_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoverCommand _$RoverCommandFromJson(Map<String, dynamic> json) {
  return _RoverCommand.fromJson(json);
}

/// @nodoc
mixin _$RoverCommand {
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  RoverCommandType get command => throw _privateConstructorUsedError;
  String? get client_id => throw _privateConstructorUsedError;
  RoverCommandParameters? get commandParameters =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverCommandCopyWith<RoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverCommandCopyWith<$Res> {
  factory $RoverCommandCopyWith(
          RoverCommand value, $Res Function(RoverCommand) then) =
      _$RoverCommandCopyWithImpl<$Res>;
  $Res call(
      {RoverSubsystemType subsystem,
      RoverCommandType command,
      String? client_id,
      RoverCommandParameters? commandParameters});

  $RoverCommandParametersCopyWith<$Res>? get commandParameters;
}

/// @nodoc
class _$RoverCommandCopyWithImpl<$Res> implements $RoverCommandCopyWith<$Res> {
  _$RoverCommandCopyWithImpl(this._value, this._then);

  final RoverCommand _value;
  // ignore: unused_field
  final $Res Function(RoverCommand) _then;

  @override
  $Res call({
    Object? subsystem = freezed,
    Object? command = freezed,
    Object? client_id = freezed,
    Object? commandParameters = freezed,
  }) {
    return _then(_value.copyWith(
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandType,
      client_id: client_id == freezed
          ? _value.client_id
          : client_id // ignore: cast_nullable_to_non_nullable
              as String?,
      commandParameters: commandParameters == freezed
          ? _value.commandParameters
          : commandParameters // ignore: cast_nullable_to_non_nullable
              as RoverCommandParameters?,
    ));
  }

  @override
  $RoverCommandParametersCopyWith<$Res>? get commandParameters {
    if (_value.commandParameters == null) {
      return null;
    }

    return $RoverCommandParametersCopyWith<$Res>(_value.commandParameters!,
        (value) {
      return _then(_value.copyWith(commandParameters: value));
    });
  }
}

/// @nodoc
abstract class _$$_RoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$_RoverCommandCopyWith(
          _$_RoverCommand value, $Res Function(_$_RoverCommand) then) =
      __$$_RoverCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoverSubsystemType subsystem,
      RoverCommandType command,
      String? client_id,
      RoverCommandParameters? commandParameters});

  @override
  $RoverCommandParametersCopyWith<$Res>? get commandParameters;
}

/// @nodoc
class __$$_RoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$_RoverCommandCopyWith<$Res> {
  __$$_RoverCommandCopyWithImpl(
      _$_RoverCommand _value, $Res Function(_$_RoverCommand) _then)
      : super(_value, (v) => _then(v as _$_RoverCommand));

  @override
  _$_RoverCommand get _value => super._value as _$_RoverCommand;

  @override
  $Res call({
    Object? subsystem = freezed,
    Object? command = freezed,
    Object? client_id = freezed,
    Object? commandParameters = freezed,
  }) {
    return _then(_$_RoverCommand(
      subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandType,
      client_id: client_id == freezed
          ? _value.client_id
          : client_id // ignore: cast_nullable_to_non_nullable
              as String?,
      commandParameters: commandParameters == freezed
          ? _value.commandParameters
          : commandParameters // ignore: cast_nullable_to_non_nullable
              as RoverCommandParameters?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverCommand implements _RoverCommand {
  const _$_RoverCommand(this.subsystem, this.command,
      {this.client_id, this.commandParameters});

  factory _$_RoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$_RoverCommandFromJson(json);

  @override
  final RoverSubsystemType subsystem;
  @override
  final RoverCommandType command;
  @override
  final String? client_id;
  @override
  final RoverCommandParameters? commandParameters;

  @override
  String toString() {
    return 'RoverCommand(subsystem: $subsystem, command: $command, client_id: $client_id, commandParameters: $commandParameters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverCommand &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem) &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.client_id, client_id) &&
            const DeepCollectionEquality()
                .equals(other.commandParameters, commandParameters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subsystem),
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(client_id),
      const DeepCollectionEquality().hash(commandParameters));

  @JsonKey(ignore: true)
  @override
  _$$_RoverCommandCopyWith<_$_RoverCommand> get copyWith =>
      __$$_RoverCommandCopyWithImpl<_$_RoverCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverCommandToJson(this);
  }
}

abstract class _RoverCommand implements RoverCommand {
  const factory _RoverCommand(
      final RoverSubsystemType subsystem, final RoverCommandType command,
      {final String? client_id,
      final RoverCommandParameters? commandParameters}) = _$_RoverCommand;

  factory _RoverCommand.fromJson(Map<String, dynamic> json) =
      _$_RoverCommand.fromJson;

  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  RoverCommandType get command => throw _privateConstructorUsedError;
  @override
  String? get client_id => throw _privateConstructorUsedError;
  @override
  RoverCommandParameters? get commandParameters =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverCommandCopyWith<_$_RoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverCommandParameters _$RoverCommandParametersFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'drivetrain':
      return RoverCommandParametersDrivetrain.fromJson(json);
    case 'destination':
      return RoverCommandParametersDestination.fromJson(json);
    case 'numberPiLitsOverride':
      return RoverCommandParametersPiLit.fromJson(json);
    case 'piLitPlacement':
      return RoverCommandParametersPiLitPlacement.fromJson(json);
    case 'switchCamera':
      return RoverCommandParametersCamera.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'RoverCommandParameters',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RoverCommandParameters {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double x, double y) drivetrain,
    required TResult Function(double lat, double long) destination,
    required TResult Function(int piLitsLeft, int piLitsRight)
        numberPiLitsOverride,
    required TResult Function(DeviceLocation location,
            PiLitFormationType formation, double heading)
        piLitPlacement,
    required TResult Function(CameraType camera) switchCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersDestination value)
        destination,
    required TResult Function(RoverCommandParametersPiLit value)
        numberPiLitsOverride,
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
    required TResult Function(RoverCommandParametersCamera value) switchCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverCommandParametersCopyWith<$Res> {
  factory $RoverCommandParametersCopyWith(RoverCommandParameters value,
          $Res Function(RoverCommandParameters) then) =
      _$RoverCommandParametersCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoverCommandParametersCopyWithImpl<$Res>
    implements $RoverCommandParametersCopyWith<$Res> {
  _$RoverCommandParametersCopyWithImpl(this._value, this._then);

  final RoverCommandParameters _value;
  // ignore: unused_field
  final $Res Function(RoverCommandParameters) _then;
}

/// @nodoc
abstract class _$$RoverCommandParametersDrivetrainCopyWith<$Res> {
  factory _$$RoverCommandParametersDrivetrainCopyWith(
          _$RoverCommandParametersDrivetrain value,
          $Res Function(_$RoverCommandParametersDrivetrain) then) =
      __$$RoverCommandParametersDrivetrainCopyWithImpl<$Res>;
  $Res call({double x, double y});
}

/// @nodoc
class __$$RoverCommandParametersDrivetrainCopyWithImpl<$Res>
    extends _$RoverCommandParametersCopyWithImpl<$Res>
    implements _$$RoverCommandParametersDrivetrainCopyWith<$Res> {
  __$$RoverCommandParametersDrivetrainCopyWithImpl(
      _$RoverCommandParametersDrivetrain _value,
      $Res Function(_$RoverCommandParametersDrivetrain) _then)
      : super(_value, (v) => _then(v as _$RoverCommandParametersDrivetrain));

  @override
  _$RoverCommandParametersDrivetrain get _value =>
      super._value as _$RoverCommandParametersDrivetrain;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$RoverCommandParametersDrivetrain(
      x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoverCommandParametersDrivetrain
    implements RoverCommandParametersDrivetrain {
  const _$RoverCommandParametersDrivetrain(this.x, this.y,
      {final String? $type})
      : $type = $type ?? 'drivetrain';

  factory _$RoverCommandParametersDrivetrain.fromJson(
          Map<String, dynamic> json) =>
      _$$RoverCommandParametersDrivetrainFromJson(json);

  @override
  final double x;
  @override
  final double y;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommandParameters.drivetrain(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoverCommandParametersDrivetrain &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y));

  @JsonKey(ignore: true)
  @override
  _$$RoverCommandParametersDrivetrainCopyWith<
          _$RoverCommandParametersDrivetrain>
      get copyWith => __$$RoverCommandParametersDrivetrainCopyWithImpl<
          _$RoverCommandParametersDrivetrain>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double x, double y) drivetrain,
    required TResult Function(double lat, double long) destination,
    required TResult Function(int piLitsLeft, int piLitsRight)
        numberPiLitsOverride,
    required TResult Function(DeviceLocation location,
            PiLitFormationType formation, double heading)
        piLitPlacement,
    required TResult Function(CameraType camera) switchCamera,
  }) {
    return drivetrain(x, y);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
  }) {
    return drivetrain?.call(x, y);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
    required TResult orElse(),
  }) {
    if (drivetrain != null) {
      return drivetrain(x, y);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersDestination value)
        destination,
    required TResult Function(RoverCommandParametersPiLit value)
        numberPiLitsOverride,
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
    required TResult Function(RoverCommandParametersCamera value) switchCamera,
  }) {
    return drivetrain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
  }) {
    return drivetrain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
    required TResult orElse(),
  }) {
    if (drivetrain != null) {
      return drivetrain(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoverCommandParametersDrivetrainToJson(this);
  }
}

abstract class RoverCommandParametersDrivetrain
    implements RoverCommandParameters {
  const factory RoverCommandParametersDrivetrain(
      final double x, final double y) = _$RoverCommandParametersDrivetrain;

  factory RoverCommandParametersDrivetrain.fromJson(Map<String, dynamic> json) =
      _$RoverCommandParametersDrivetrain.fromJson;

  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoverCommandParametersDrivetrainCopyWith<
          _$RoverCommandParametersDrivetrain>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoverCommandParametersDestinationCopyWith<$Res> {
  factory _$$RoverCommandParametersDestinationCopyWith(
          _$RoverCommandParametersDestination value,
          $Res Function(_$RoverCommandParametersDestination) then) =
      __$$RoverCommandParametersDestinationCopyWithImpl<$Res>;
  $Res call({double lat, double long});
}

/// @nodoc
class __$$RoverCommandParametersDestinationCopyWithImpl<$Res>
    extends _$RoverCommandParametersCopyWithImpl<$Res>
    implements _$$RoverCommandParametersDestinationCopyWith<$Res> {
  __$$RoverCommandParametersDestinationCopyWithImpl(
      _$RoverCommandParametersDestination _value,
      $Res Function(_$RoverCommandParametersDestination) _then)
      : super(_value, (v) => _then(v as _$RoverCommandParametersDestination));

  @override
  _$RoverCommandParametersDestination get _value =>
      super._value as _$RoverCommandParametersDestination;

  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_$RoverCommandParametersDestination(
      lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoverCommandParametersDestination
    implements RoverCommandParametersDestination {
  const _$RoverCommandParametersDestination(this.lat, this.long,
      {final String? $type})
      : $type = $type ?? 'destination';

  factory _$RoverCommandParametersDestination.fromJson(
          Map<String, dynamic> json) =>
      _$$RoverCommandParametersDestinationFromJson(json);

  @override
  final double lat;
  @override
  final double long;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommandParameters.destination(lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoverCommandParametersDestination &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.long, long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(long));

  @JsonKey(ignore: true)
  @override
  _$$RoverCommandParametersDestinationCopyWith<
          _$RoverCommandParametersDestination>
      get copyWith => __$$RoverCommandParametersDestinationCopyWithImpl<
          _$RoverCommandParametersDestination>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double x, double y) drivetrain,
    required TResult Function(double lat, double long) destination,
    required TResult Function(int piLitsLeft, int piLitsRight)
        numberPiLitsOverride,
    required TResult Function(DeviceLocation location,
            PiLitFormationType formation, double heading)
        piLitPlacement,
    required TResult Function(CameraType camera) switchCamera,
  }) {
    return destination(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
  }) {
    return destination?.call(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
    required TResult orElse(),
  }) {
    if (destination != null) {
      return destination(lat, long);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersDestination value)
        destination,
    required TResult Function(RoverCommandParametersPiLit value)
        numberPiLitsOverride,
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
    required TResult Function(RoverCommandParametersCamera value) switchCamera,
  }) {
    return destination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
  }) {
    return destination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
    required TResult orElse(),
  }) {
    if (destination != null) {
      return destination(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoverCommandParametersDestinationToJson(this);
  }
}

abstract class RoverCommandParametersDestination
    implements RoverCommandParameters {
  const factory RoverCommandParametersDestination(
          final double lat, final double long) =
      _$RoverCommandParametersDestination;

  factory RoverCommandParametersDestination.fromJson(
      Map<String, dynamic> json) = _$RoverCommandParametersDestination.fromJson;

  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoverCommandParametersDestinationCopyWith<
          _$RoverCommandParametersDestination>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoverCommandParametersPiLitCopyWith<$Res> {
  factory _$$RoverCommandParametersPiLitCopyWith(
          _$RoverCommandParametersPiLit value,
          $Res Function(_$RoverCommandParametersPiLit) then) =
      __$$RoverCommandParametersPiLitCopyWithImpl<$Res>;
  $Res call({int piLitsLeft, int piLitsRight});
}

/// @nodoc
class __$$RoverCommandParametersPiLitCopyWithImpl<$Res>
    extends _$RoverCommandParametersCopyWithImpl<$Res>
    implements _$$RoverCommandParametersPiLitCopyWith<$Res> {
  __$$RoverCommandParametersPiLitCopyWithImpl(
      _$RoverCommandParametersPiLit _value,
      $Res Function(_$RoverCommandParametersPiLit) _then)
      : super(_value, (v) => _then(v as _$RoverCommandParametersPiLit));

  @override
  _$RoverCommandParametersPiLit get _value =>
      super._value as _$RoverCommandParametersPiLit;

  @override
  $Res call({
    Object? piLitsLeft = freezed,
    Object? piLitsRight = freezed,
  }) {
    return _then(_$RoverCommandParametersPiLit(
      piLitsLeft == freezed
          ? _value.piLitsLeft
          : piLitsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      piLitsRight == freezed
          ? _value.piLitsRight
          : piLitsRight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoverCommandParametersPiLit implements RoverCommandParametersPiLit {
  const _$RoverCommandParametersPiLit(this.piLitsLeft, this.piLitsRight,
      {final String? $type})
      : $type = $type ?? 'numberPiLitsOverride';

  factory _$RoverCommandParametersPiLit.fromJson(Map<String, dynamic> json) =>
      _$$RoverCommandParametersPiLitFromJson(json);

  @override
  final int piLitsLeft;
  @override
  final int piLitsRight;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommandParameters.numberPiLitsOverride(piLitsLeft: $piLitsLeft, piLitsRight: $piLitsRight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoverCommandParametersPiLit &&
            const DeepCollectionEquality()
                .equals(other.piLitsLeft, piLitsLeft) &&
            const DeepCollectionEquality()
                .equals(other.piLitsRight, piLitsRight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(piLitsLeft),
      const DeepCollectionEquality().hash(piLitsRight));

  @JsonKey(ignore: true)
  @override
  _$$RoverCommandParametersPiLitCopyWith<_$RoverCommandParametersPiLit>
      get copyWith => __$$RoverCommandParametersPiLitCopyWithImpl<
          _$RoverCommandParametersPiLit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double x, double y) drivetrain,
    required TResult Function(double lat, double long) destination,
    required TResult Function(int piLitsLeft, int piLitsRight)
        numberPiLitsOverride,
    required TResult Function(DeviceLocation location,
            PiLitFormationType formation, double heading)
        piLitPlacement,
    required TResult Function(CameraType camera) switchCamera,
  }) {
    return numberPiLitsOverride(piLitsLeft, piLitsRight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
  }) {
    return numberPiLitsOverride?.call(piLitsLeft, piLitsRight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
    required TResult orElse(),
  }) {
    if (numberPiLitsOverride != null) {
      return numberPiLitsOverride(piLitsLeft, piLitsRight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersDestination value)
        destination,
    required TResult Function(RoverCommandParametersPiLit value)
        numberPiLitsOverride,
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
    required TResult Function(RoverCommandParametersCamera value) switchCamera,
  }) {
    return numberPiLitsOverride(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
  }) {
    return numberPiLitsOverride?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
    required TResult orElse(),
  }) {
    if (numberPiLitsOverride != null) {
      return numberPiLitsOverride(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoverCommandParametersPiLitToJson(this);
  }
}

abstract class RoverCommandParametersPiLit implements RoverCommandParameters {
  const factory RoverCommandParametersPiLit(
          final int piLitsLeft, final int piLitsRight) =
      _$RoverCommandParametersPiLit;

  factory RoverCommandParametersPiLit.fromJson(Map<String, dynamic> json) =
      _$RoverCommandParametersPiLit.fromJson;

  int get piLitsLeft => throw _privateConstructorUsedError;
  int get piLitsRight => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoverCommandParametersPiLitCopyWith<_$RoverCommandParametersPiLit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoverCommandParametersPiLitPlacementCopyWith<$Res> {
  factory _$$RoverCommandParametersPiLitPlacementCopyWith(
          _$RoverCommandParametersPiLitPlacement value,
          $Res Function(_$RoverCommandParametersPiLitPlacement) then) =
      __$$RoverCommandParametersPiLitPlacementCopyWithImpl<$Res>;
  $Res call(
      {DeviceLocation location, PiLitFormationType formation, double heading});

  $DeviceLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$RoverCommandParametersPiLitPlacementCopyWithImpl<$Res>
    extends _$RoverCommandParametersCopyWithImpl<$Res>
    implements _$$RoverCommandParametersPiLitPlacementCopyWith<$Res> {
  __$$RoverCommandParametersPiLitPlacementCopyWithImpl(
      _$RoverCommandParametersPiLitPlacement _value,
      $Res Function(_$RoverCommandParametersPiLitPlacement) _then)
      : super(
            _value, (v) => _then(v as _$RoverCommandParametersPiLitPlacement));

  @override
  _$RoverCommandParametersPiLitPlacement get _value =>
      super._value as _$RoverCommandParametersPiLitPlacement;

  @override
  $Res call({
    Object? location = freezed,
    Object? formation = freezed,
    Object? heading = freezed,
  }) {
    return _then(_$RoverCommandParametersPiLitPlacement(
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as DeviceLocation,
      formation == freezed
          ? _value.formation
          : formation // ignore: cast_nullable_to_non_nullable
              as PiLitFormationType,
      heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $DeviceLocationCopyWith<$Res> get location {
    return $DeviceLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$RoverCommandParametersPiLitPlacement
    implements RoverCommandParametersPiLitPlacement {
  const _$RoverCommandParametersPiLitPlacement(
      this.location, this.formation, this.heading,
      {final String? $type})
      : $type = $type ?? 'piLitPlacement';

  factory _$RoverCommandParametersPiLitPlacement.fromJson(
          Map<String, dynamic> json) =>
      _$$RoverCommandParametersPiLitPlacementFromJson(json);

  @override
  final DeviceLocation location;
  @override
  final PiLitFormationType formation;
  @override
  final double heading;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommandParameters.piLitPlacement(location: $location, formation: $formation, heading: $heading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoverCommandParametersPiLitPlacement &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.formation, formation) &&
            const DeepCollectionEquality().equals(other.heading, heading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(formation),
      const DeepCollectionEquality().hash(heading));

  @JsonKey(ignore: true)
  @override
  _$$RoverCommandParametersPiLitPlacementCopyWith<
          _$RoverCommandParametersPiLitPlacement>
      get copyWith => __$$RoverCommandParametersPiLitPlacementCopyWithImpl<
          _$RoverCommandParametersPiLitPlacement>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double x, double y) drivetrain,
    required TResult Function(double lat, double long) destination,
    required TResult Function(int piLitsLeft, int piLitsRight)
        numberPiLitsOverride,
    required TResult Function(DeviceLocation location,
            PiLitFormationType formation, double heading)
        piLitPlacement,
    required TResult Function(CameraType camera) switchCamera,
  }) {
    return piLitPlacement(location, formation, heading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
  }) {
    return piLitPlacement?.call(location, formation, heading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
    required TResult orElse(),
  }) {
    if (piLitPlacement != null) {
      return piLitPlacement(location, formation, heading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersDestination value)
        destination,
    required TResult Function(RoverCommandParametersPiLit value)
        numberPiLitsOverride,
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
    required TResult Function(RoverCommandParametersCamera value) switchCamera,
  }) {
    return piLitPlacement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
  }) {
    return piLitPlacement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
    required TResult orElse(),
  }) {
    if (piLitPlacement != null) {
      return piLitPlacement(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoverCommandParametersPiLitPlacementToJson(this);
  }
}

abstract class RoverCommandParametersPiLitPlacement
    implements RoverCommandParameters {
  const factory RoverCommandParametersPiLitPlacement(
      final DeviceLocation location,
      final PiLitFormationType formation,
      final double heading) = _$RoverCommandParametersPiLitPlacement;

  factory RoverCommandParametersPiLitPlacement.fromJson(
          Map<String, dynamic> json) =
      _$RoverCommandParametersPiLitPlacement.fromJson;

  DeviceLocation get location => throw _privateConstructorUsedError;
  PiLitFormationType get formation => throw _privateConstructorUsedError;
  double get heading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoverCommandParametersPiLitPlacementCopyWith<
          _$RoverCommandParametersPiLitPlacement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoverCommandParametersCameraCopyWith<$Res> {
  factory _$$RoverCommandParametersCameraCopyWith(
          _$RoverCommandParametersCamera value,
          $Res Function(_$RoverCommandParametersCamera) then) =
      __$$RoverCommandParametersCameraCopyWithImpl<$Res>;
  $Res call({CameraType camera});
}

/// @nodoc
class __$$RoverCommandParametersCameraCopyWithImpl<$Res>
    extends _$RoverCommandParametersCopyWithImpl<$Res>
    implements _$$RoverCommandParametersCameraCopyWith<$Res> {
  __$$RoverCommandParametersCameraCopyWithImpl(
      _$RoverCommandParametersCamera _value,
      $Res Function(_$RoverCommandParametersCamera) _then)
      : super(_value, (v) => _then(v as _$RoverCommandParametersCamera));

  @override
  _$RoverCommandParametersCamera get _value =>
      super._value as _$RoverCommandParametersCamera;

  @override
  $Res call({
    Object? camera = freezed,
  }) {
    return _then(_$RoverCommandParametersCamera(
      camera == freezed
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as CameraType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoverCommandParametersCamera implements RoverCommandParametersCamera {
  const _$RoverCommandParametersCamera(this.camera, {final String? $type})
      : $type = $type ?? 'switchCamera';

  factory _$RoverCommandParametersCamera.fromJson(Map<String, dynamic> json) =>
      _$$RoverCommandParametersCameraFromJson(json);

  @override
  final CameraType camera;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommandParameters.switchCamera(camera: $camera)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoverCommandParametersCamera &&
            const DeepCollectionEquality().equals(other.camera, camera));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(camera));

  @JsonKey(ignore: true)
  @override
  _$$RoverCommandParametersCameraCopyWith<_$RoverCommandParametersCamera>
      get copyWith => __$$RoverCommandParametersCameraCopyWithImpl<
          _$RoverCommandParametersCamera>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double x, double y) drivetrain,
    required TResult Function(double lat, double long) destination,
    required TResult Function(int piLitsLeft, int piLitsRight)
        numberPiLitsOverride,
    required TResult Function(DeviceLocation location,
            PiLitFormationType formation, double heading)
        piLitPlacement,
    required TResult Function(CameraType camera) switchCamera,
  }) {
    return switchCamera(camera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
  }) {
    return switchCamera?.call(camera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(int piLitsLeft, int piLitsRight)? numberPiLitsOverride,
    TResult Function(DeviceLocation location, PiLitFormationType formation,
            double heading)?
        piLitPlacement,
    TResult Function(CameraType camera)? switchCamera,
    required TResult orElse(),
  }) {
    if (switchCamera != null) {
      return switchCamera(camera);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersDestination value)
        destination,
    required TResult Function(RoverCommandParametersPiLit value)
        numberPiLitsOverride,
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
    required TResult Function(RoverCommandParametersCamera value) switchCamera,
  }) {
    return switchCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
  }) {
    return switchCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLit value)? numberPiLitsOverride,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
    TResult Function(RoverCommandParametersCamera value)? switchCamera,
    required TResult orElse(),
  }) {
    if (switchCamera != null) {
      return switchCamera(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoverCommandParametersCameraToJson(this);
  }
}

abstract class RoverCommandParametersCamera implements RoverCommandParameters {
  const factory RoverCommandParametersCamera(final CameraType camera) =
      _$RoverCommandParametersCamera;

  factory RoverCommandParametersCamera.fromJson(Map<String, dynamic> json) =
      _$RoverCommandParametersCamera.fromJson;

  CameraType get camera => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoverCommandParametersCameraCopyWith<_$RoverCommandParametersCamera>
      get copyWith => throw _privateConstructorUsedError;
}
