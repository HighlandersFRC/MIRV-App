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
  switch (json['runtimeType']) {
    case 'generalCommand':
      return GeneralRoverCommand.fromJson(json);
    case 'heartbeatCommand':
      return HeartbeatRoverCommand.fromJson(json);
    case 'intakeCommand':
      return IntakeRoverCommand.fromJson(json);
    case 'garageCommand':
      return GarageRoverCommand.fromJson(json);
    case 'drivetrainCommand':
      return DrivetrainRoverCommand.fromJson(json);
    case 'destinationCommand':
      return DrivetrainRoverCommandDestination.fromJson(json);
    case 'piLitCommand':
      return PiLitRoverCommand.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RoverCommand',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RoverCommand {
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) =>
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
  $Res call({RoverSubsystemType subsystem});
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
  }) {
    return _then(_value.copyWith(
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }
}

/// @nodoc
abstract class _$$GeneralRoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$GeneralRoverCommandCopyWith(_$GeneralRoverCommand value,
          $Res Function(_$GeneralRoverCommand) then) =
      __$$GeneralRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoverCommandTypeGeneral command,
      RoverCommandParameters? commandParameters,
      RoverSubsystemType subsystem});

  $RoverCommandParametersCopyWith<$Res>? get commandParameters;
}

/// @nodoc
class __$$GeneralRoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$GeneralRoverCommandCopyWith<$Res> {
  __$$GeneralRoverCommandCopyWithImpl(
      _$GeneralRoverCommand _value, $Res Function(_$GeneralRoverCommand) _then)
      : super(_value, (v) => _then(v as _$GeneralRoverCommand));

  @override
  _$GeneralRoverCommand get _value => super._value as _$GeneralRoverCommand;

  @override
  $Res call({
    Object? command = freezed,
    Object? commandParameters = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$GeneralRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeGeneral,
      commandParameters: commandParameters == freezed
          ? _value.commandParameters
          : commandParameters // ignore: cast_nullable_to_non_nullable
              as RoverCommandParameters?,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
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
@JsonSerializable()
class _$GeneralRoverCommand implements GeneralRoverCommand {
  const _$GeneralRoverCommand(this.command,
      {this.commandParameters,
      this.subsystem = RoverSubsystemType.general,
      final String? $type})
      : $type = $type ?? 'generalCommand';

  factory _$GeneralRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$GeneralRoverCommandFromJson(json);

  @override
  final RoverCommandTypeGeneral command;
  @override
  final RoverCommandParameters? commandParameters;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.generalCommand(command: $command, commandParameters: $commandParameters, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralRoverCommand &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality()
                .equals(other.commandParameters, commandParameters) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(commandParameters),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$GeneralRoverCommandCopyWith<_$GeneralRoverCommand> get copyWith =>
      __$$GeneralRoverCommandCopyWithImpl<_$GeneralRoverCommand>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) {
    return generalCommand(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) {
    return generalCommand?.call(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) {
    if (generalCommand != null) {
      return generalCommand(command, commandParameters, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) {
    return generalCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) {
    return generalCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) {
    if (generalCommand != null) {
      return generalCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralRoverCommandToJson(this);
  }
}

abstract class GeneralRoverCommand implements RoverCommand {
  const factory GeneralRoverCommand(final RoverCommandTypeGeneral command,
      {final RoverCommandParameters? commandParameters,
      final RoverSubsystemType subsystem}) = _$GeneralRoverCommand;

  factory GeneralRoverCommand.fromJson(Map<String, dynamic> json) =
      _$GeneralRoverCommand.fromJson;

  RoverCommandTypeGeneral get command => throw _privateConstructorUsedError;
  RoverCommandParameters? get commandParameters =>
      throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$GeneralRoverCommandCopyWith<_$GeneralRoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeartbeatRoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$HeartbeatRoverCommandCopyWith(_$HeartbeatRoverCommand value,
          $Res Function(_$HeartbeatRoverCommand) then) =
      __$$HeartbeatRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call({RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem});
}

/// @nodoc
class __$$HeartbeatRoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$HeartbeatRoverCommandCopyWith<$Res> {
  __$$HeartbeatRoverCommandCopyWithImpl(_$HeartbeatRoverCommand _value,
      $Res Function(_$HeartbeatRoverCommand) _then)
      : super(_value, (v) => _then(v as _$HeartbeatRoverCommand));

  @override
  _$HeartbeatRoverCommand get _value => super._value as _$HeartbeatRoverCommand;

  @override
  $Res call({
    Object? command = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$HeartbeatRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeHeartbeat,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeartbeatRoverCommand implements HeartbeatRoverCommand {
  const _$HeartbeatRoverCommand(this.command,
      {this.subsystem = RoverSubsystemType.heartbeat, final String? $type})
      : $type = $type ?? 'heartbeatCommand';

  factory _$HeartbeatRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$HeartbeatRoverCommandFromJson(json);

  @override
  final RoverCommandTypeHeartbeat command;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.heartbeatCommand(command: $command, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartbeatRoverCommand &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$HeartbeatRoverCommandCopyWith<_$HeartbeatRoverCommand> get copyWith =>
      __$$HeartbeatRoverCommandCopyWithImpl<_$HeartbeatRoverCommand>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) {
    return heartbeatCommand(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) {
    return heartbeatCommand?.call(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) {
    if (heartbeatCommand != null) {
      return heartbeatCommand(command, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) {
    return heartbeatCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) {
    return heartbeatCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) {
    if (heartbeatCommand != null) {
      return heartbeatCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HeartbeatRoverCommandToJson(this);
  }
}

abstract class HeartbeatRoverCommand implements RoverCommand {
  const factory HeartbeatRoverCommand(final RoverCommandTypeHeartbeat command,
      {final RoverSubsystemType subsystem}) = _$HeartbeatRoverCommand;

  factory HeartbeatRoverCommand.fromJson(Map<String, dynamic> json) =
      _$HeartbeatRoverCommand.fromJson;

  RoverCommandTypeHeartbeat get command => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$HeartbeatRoverCommandCopyWith<_$HeartbeatRoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IntakeRoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$IntakeRoverCommandCopyWith(_$IntakeRoverCommand value,
          $Res Function(_$IntakeRoverCommand) then) =
      __$$IntakeRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call({RoverCommandTypeIntake command, RoverSubsystemType subsystem});
}

/// @nodoc
class __$$IntakeRoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$IntakeRoverCommandCopyWith<$Res> {
  __$$IntakeRoverCommandCopyWithImpl(
      _$IntakeRoverCommand _value, $Res Function(_$IntakeRoverCommand) _then)
      : super(_value, (v) => _then(v as _$IntakeRoverCommand));

  @override
  _$IntakeRoverCommand get _value => super._value as _$IntakeRoverCommand;

  @override
  $Res call({
    Object? command = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$IntakeRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeIntake,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntakeRoverCommand implements IntakeRoverCommand {
  const _$IntakeRoverCommand(this.command,
      {this.subsystem = RoverSubsystemType.intake, final String? $type})
      : $type = $type ?? 'intakeCommand';

  factory _$IntakeRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$IntakeRoverCommandFromJson(json);

  @override
  final RoverCommandTypeIntake command;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.intakeCommand(command: $command, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntakeRoverCommand &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$IntakeRoverCommandCopyWith<_$IntakeRoverCommand> get copyWith =>
      __$$IntakeRoverCommandCopyWithImpl<_$IntakeRoverCommand>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) {
    return intakeCommand(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) {
    return intakeCommand?.call(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) {
    if (intakeCommand != null) {
      return intakeCommand(command, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) {
    return intakeCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) {
    return intakeCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) {
    if (intakeCommand != null) {
      return intakeCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IntakeRoverCommandToJson(this);
  }
}

abstract class IntakeRoverCommand implements RoverCommand {
  const factory IntakeRoverCommand(final RoverCommandTypeIntake command,
      {final RoverSubsystemType subsystem}) = _$IntakeRoverCommand;

  factory IntakeRoverCommand.fromJson(Map<String, dynamic> json) =
      _$IntakeRoverCommand.fromJson;

  RoverCommandTypeIntake get command => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$IntakeRoverCommandCopyWith<_$IntakeRoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GarageRoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$GarageRoverCommandCopyWith(_$GarageRoverCommand value,
          $Res Function(_$GarageRoverCommand) then) =
      __$$GarageRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call({GarageCommandType command, RoverSubsystemType subsystem});
}

/// @nodoc
class __$$GarageRoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$GarageRoverCommandCopyWith<$Res> {
  __$$GarageRoverCommandCopyWithImpl(
      _$GarageRoverCommand _value, $Res Function(_$GarageRoverCommand) _then)
      : super(_value, (v) => _then(v as _$GarageRoverCommand));

  @override
  _$GarageRoverCommand get _value => super._value as _$GarageRoverCommand;

  @override
  $Res call({
    Object? command = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$GarageRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as GarageCommandType,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GarageRoverCommand implements GarageRoverCommand {
  const _$GarageRoverCommand(this.command,
      {this.subsystem = RoverSubsystemType.garage, final String? $type})
      : $type = $type ?? 'garageCommand';

  factory _$GarageRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$GarageRoverCommandFromJson(json);

  @override
  final GarageCommandType command;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.garageCommand(command: $command, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GarageRoverCommand &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$GarageRoverCommandCopyWith<_$GarageRoverCommand> get copyWith =>
      __$$GarageRoverCommandCopyWithImpl<_$GarageRoverCommand>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) {
    return garageCommand(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) {
    return garageCommand?.call(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) {
    if (garageCommand != null) {
      return garageCommand(command, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) {
    return garageCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) {
    return garageCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) {
    if (garageCommand != null) {
      return garageCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GarageRoverCommandToJson(this);
  }
}

abstract class GarageRoverCommand implements RoverCommand {
  const factory GarageRoverCommand(final GarageCommandType command,
      {final RoverSubsystemType subsystem}) = _$GarageRoverCommand;

  factory GarageRoverCommand.fromJson(Map<String, dynamic> json) =
      _$GarageRoverCommand.fromJson;

  GarageCommandType get command => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$GarageRoverCommandCopyWith<_$GarageRoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DrivetrainRoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$DrivetrainRoverCommandCopyWith(_$DrivetrainRoverCommand value,
          $Res Function(_$DrivetrainRoverCommand) then) =
      __$$DrivetrainRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoverCommandTypeDrivetrain command,
      RoverCommandParameters commandParameters,
      RoverSubsystemType subsystem});

  $RoverCommandParametersCopyWith<$Res> get commandParameters;
}

/// @nodoc
class __$$DrivetrainRoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$DrivetrainRoverCommandCopyWith<$Res> {
  __$$DrivetrainRoverCommandCopyWithImpl(_$DrivetrainRoverCommand _value,
      $Res Function(_$DrivetrainRoverCommand) _then)
      : super(_value, (v) => _then(v as _$DrivetrainRoverCommand));

  @override
  _$DrivetrainRoverCommand get _value =>
      super._value as _$DrivetrainRoverCommand;

  @override
  $Res call({
    Object? command = freezed,
    Object? commandParameters = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$DrivetrainRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeDrivetrain,
      commandParameters == freezed
          ? _value.commandParameters
          : commandParameters // ignore: cast_nullable_to_non_nullable
              as RoverCommandParameters,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }

  @override
  $RoverCommandParametersCopyWith<$Res> get commandParameters {
    return $RoverCommandParametersCopyWith<$Res>(_value.commandParameters,
        (value) {
      return _then(_value.copyWith(commandParameters: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$DrivetrainRoverCommand implements DrivetrainRoverCommand {
  const _$DrivetrainRoverCommand(this.command, this.commandParameters,
      {this.subsystem = RoverSubsystemType.drivetrain, final String? $type})
      : $type = $type ?? 'drivetrainCommand';

  factory _$DrivetrainRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$DrivetrainRoverCommandFromJson(json);

  @override
  final RoverCommandTypeDrivetrain command;
  @override
  final RoverCommandParameters commandParameters;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.drivetrainCommand(command: $command, commandParameters: $commandParameters, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrivetrainRoverCommand &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality()
                .equals(other.commandParameters, commandParameters) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(commandParameters),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$DrivetrainRoverCommandCopyWith<_$DrivetrainRoverCommand> get copyWith =>
      __$$DrivetrainRoverCommandCopyWithImpl<_$DrivetrainRoverCommand>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) {
    return drivetrainCommand(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) {
    return drivetrainCommand?.call(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) {
    if (drivetrainCommand != null) {
      return drivetrainCommand(command, commandParameters, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) {
    return drivetrainCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) {
    return drivetrainCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) {
    if (drivetrainCommand != null) {
      return drivetrainCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DrivetrainRoverCommandToJson(this);
  }
}

abstract class DrivetrainRoverCommand implements RoverCommand {
  const factory DrivetrainRoverCommand(final RoverCommandTypeDrivetrain command,
      final RoverCommandParameters commandParameters,
      {final RoverSubsystemType subsystem}) = _$DrivetrainRoverCommand;

  factory DrivetrainRoverCommand.fromJson(Map<String, dynamic> json) =
      _$DrivetrainRoverCommand.fromJson;

  RoverCommandTypeDrivetrain get command => throw _privateConstructorUsedError;
  RoverCommandParameters get commandParameters =>
      throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DrivetrainRoverCommandCopyWith<_$DrivetrainRoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DrivetrainRoverCommandDestinationCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$DrivetrainRoverCommandDestinationCopyWith(
          _$DrivetrainRoverCommandDestination value,
          $Res Function(_$DrivetrainRoverCommandDestination) then) =
      __$$DrivetrainRoverCommandDestinationCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoverCommandTypeDrivetrain command,
      RoverCommandParameters commandParameters,
      RoverSubsystemType subsystem});

  $RoverCommandParametersCopyWith<$Res> get commandParameters;
}

/// @nodoc
class __$$DrivetrainRoverCommandDestinationCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$DrivetrainRoverCommandDestinationCopyWith<$Res> {
  __$$DrivetrainRoverCommandDestinationCopyWithImpl(
      _$DrivetrainRoverCommandDestination _value,
      $Res Function(_$DrivetrainRoverCommandDestination) _then)
      : super(_value, (v) => _then(v as _$DrivetrainRoverCommandDestination));

  @override
  _$DrivetrainRoverCommandDestination get _value =>
      super._value as _$DrivetrainRoverCommandDestination;

  @override
  $Res call({
    Object? command = freezed,
    Object? commandParameters = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$DrivetrainRoverCommandDestination(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeDrivetrain,
      commandParameters == freezed
          ? _value.commandParameters
          : commandParameters // ignore: cast_nullable_to_non_nullable
              as RoverCommandParameters,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }

  @override
  $RoverCommandParametersCopyWith<$Res> get commandParameters {
    return $RoverCommandParametersCopyWith<$Res>(_value.commandParameters,
        (value) {
      return _then(_value.copyWith(commandParameters: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$DrivetrainRoverCommandDestination
    implements DrivetrainRoverCommandDestination {
  const _$DrivetrainRoverCommandDestination(
      this.command, this.commandParameters,
      {this.subsystem = RoverSubsystemType.movement, final String? $type})
      : $type = $type ?? 'destinationCommand';

  factory _$DrivetrainRoverCommandDestination.fromJson(
          Map<String, dynamic> json) =>
      _$$DrivetrainRoverCommandDestinationFromJson(json);

  @override
  final RoverCommandTypeDrivetrain command;
  @override
  final RoverCommandParameters commandParameters;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.destinationCommand(command: $command, commandParameters: $commandParameters, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrivetrainRoverCommandDestination &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality()
                .equals(other.commandParameters, commandParameters) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(commandParameters),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$DrivetrainRoverCommandDestinationCopyWith<
          _$DrivetrainRoverCommandDestination>
      get copyWith => __$$DrivetrainRoverCommandDestinationCopyWithImpl<
          _$DrivetrainRoverCommandDestination>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) {
    return destinationCommand(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) {
    return destinationCommand?.call(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) {
    if (destinationCommand != null) {
      return destinationCommand(command, commandParameters, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) {
    return destinationCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) {
    return destinationCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) {
    if (destinationCommand != null) {
      return destinationCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DrivetrainRoverCommandDestinationToJson(this);
  }
}

abstract class DrivetrainRoverCommandDestination implements RoverCommand {
  const factory DrivetrainRoverCommandDestination(
          final RoverCommandTypeDrivetrain command,
          final RoverCommandParameters commandParameters,
          {final RoverSubsystemType subsystem}) =
      _$DrivetrainRoverCommandDestination;

  factory DrivetrainRoverCommandDestination.fromJson(
      Map<String, dynamic> json) = _$DrivetrainRoverCommandDestination.fromJson;

  RoverCommandTypeDrivetrain get command => throw _privateConstructorUsedError;
  RoverCommandParameters get commandParameters =>
      throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DrivetrainRoverCommandDestinationCopyWith<
          _$DrivetrainRoverCommandDestination>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PiLitRoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$PiLitRoverCommandCopyWith(
          _$PiLitRoverCommand value, $Res Function(_$PiLitRoverCommand) then) =
      __$$PiLitRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call({RoverCommandTypePiLit command, RoverSubsystemType subsystem});
}

/// @nodoc
class __$$PiLitRoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$PiLitRoverCommandCopyWith<$Res> {
  __$$PiLitRoverCommandCopyWithImpl(
      _$PiLitRoverCommand _value, $Res Function(_$PiLitRoverCommand) _then)
      : super(_value, (v) => _then(v as _$PiLitRoverCommand));

  @override
  _$PiLitRoverCommand get _value => super._value as _$PiLitRoverCommand;

  @override
  $Res call({
    Object? command = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$PiLitRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypePiLit,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PiLitRoverCommand implements PiLitRoverCommand {
  const _$PiLitRoverCommand(this.command,
      {this.subsystem = RoverSubsystemType.pi_lit, final String? $type})
      : $type = $type ?? 'piLitCommand';

  factory _$PiLitRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$PiLitRoverCommandFromJson(json);

  @override
  final RoverCommandTypePiLit command;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.piLitCommand(command: $command, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PiLitRoverCommand &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$PiLitRoverCommandCopyWith<_$PiLitRoverCommand> get copyWith =>
      __$$PiLitRoverCommandCopyWithImpl<_$PiLitRoverCommand>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)
        heartbeatCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            GarageCommandType command, RoverSubsystemType subsystem)
        garageCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        destinationCommand,
    required TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)
        piLitCommand,
  }) {
    return piLitCommand(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
  }) {
    return piLitCommand?.call(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command,
            RoverCommandParameters? commandParameters,
            RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeHeartbeat command, RoverSubsystemType subsystem)?
        heartbeatCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(GarageCommandType command, RoverSubsystemType subsystem)?
        garageCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        destinationCommand,
    TResult Function(
            RoverCommandTypePiLit command, RoverSubsystemType subsystem)?
        piLitCommand,
    required TResult orElse(),
  }) {
    if (piLitCommand != null) {
      return piLitCommand(command, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(HeartbeatRoverCommand value) heartbeatCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(GarageRoverCommand value) garageCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(DrivetrainRoverCommandDestination value)
        destinationCommand,
    required TResult Function(PiLitRoverCommand value) piLitCommand,
  }) {
    return piLitCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
  }) {
    return piLitCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(HeartbeatRoverCommand value)? heartbeatCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(GarageRoverCommand value)? garageCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(DrivetrainRoverCommandDestination value)?
        destinationCommand,
    TResult Function(PiLitRoverCommand value)? piLitCommand,
    required TResult orElse(),
  }) {
    if (piLitCommand != null) {
      return piLitCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PiLitRoverCommandToJson(this);
  }
}

abstract class PiLitRoverCommand implements RoverCommand {
  const factory PiLitRoverCommand(final RoverCommandTypePiLit command,
      {final RoverSubsystemType subsystem}) = _$PiLitRoverCommand;

  factory PiLitRoverCommand.fromJson(Map<String, dynamic> json) =
      _$PiLitRoverCommand.fromJson;

  RoverCommandTypePiLit get command => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PiLitRoverCommandCopyWith<_$PiLitRoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverCommandParameters _$RoverCommandParametersFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'drivetrain':
      return RoverCommandParametersDrivetrain.fromJson(json);
    case 'destination':
      return RoverCommandParametersDestination.fromJson(json);
    case 'piLitPlacement':
      return RoverCommandParametersPiLitPlacement.fromJson(json);

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
    required TResult Function(
            DeviceLocation location, PiLitFormationType formation)
        piLitPlacement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersDestination value)
        destination,
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
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
    required TResult Function(
            DeviceLocation location, PiLitFormationType formation)
        piLitPlacement,
  }) {
    return drivetrain(x, y);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
  }) {
    return drivetrain?.call(x, y);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
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
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
  }) {
    return drivetrain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
  }) {
    return drivetrain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
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
    required TResult Function(
            DeviceLocation location, PiLitFormationType formation)
        piLitPlacement,
  }) {
    return destination(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
  }) {
    return destination?.call(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
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
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
  }) {
    return destination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
  }) {
    return destination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
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
abstract class _$$RoverCommandParametersPiLitPlacementCopyWith<$Res> {
  factory _$$RoverCommandParametersPiLitPlacementCopyWith(
          _$RoverCommandParametersPiLitPlacement value,
          $Res Function(_$RoverCommandParametersPiLitPlacement) then) =
      __$$RoverCommandParametersPiLitPlacementCopyWithImpl<$Res>;
  $Res call({DeviceLocation location, PiLitFormationType formation});

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
  const _$RoverCommandParametersPiLitPlacement(this.location, this.formation,
      {final String? $type})
      : $type = $type ?? 'piLitPlacement';

  factory _$RoverCommandParametersPiLitPlacement.fromJson(
          Map<String, dynamic> json) =>
      _$$RoverCommandParametersPiLitPlacementFromJson(json);

  @override
  final DeviceLocation location;
  @override
  final PiLitFormationType formation;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommandParameters.piLitPlacement(location: $location, formation: $formation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoverCommandParametersPiLitPlacement &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.formation, formation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(formation));

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
    required TResult Function(
            DeviceLocation location, PiLitFormationType formation)
        piLitPlacement,
  }) {
    return piLitPlacement(location, formation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
  }) {
    return piLitPlacement?.call(location, formation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? destination,
    TResult Function(DeviceLocation location, PiLitFormationType formation)?
        piLitPlacement,
    required TResult orElse(),
  }) {
    if (piLitPlacement != null) {
      return piLitPlacement(location, formation);
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
    required TResult Function(RoverCommandParametersPiLitPlacement value)
        piLitPlacement,
  }) {
    return piLitPlacement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
  }) {
    return piLitPlacement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersDestination value)? destination,
    TResult Function(RoverCommandParametersPiLitPlacement value)?
        piLitPlacement,
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
          final DeviceLocation location, final PiLitFormationType formation) =
      _$RoverCommandParametersPiLitPlacement;

  factory RoverCommandParametersPiLitPlacement.fromJson(
          Map<String, dynamic> json) =
      _$RoverCommandParametersPiLitPlacement.fromJson;

  DeviceLocation get location => throw _privateConstructorUsedError;
  PiLitFormationType get formation => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoverCommandParametersPiLitPlacementCopyWith<
          _$RoverCommandParametersPiLitPlacement>
      get copyWith => throw _privateConstructorUsedError;
}
