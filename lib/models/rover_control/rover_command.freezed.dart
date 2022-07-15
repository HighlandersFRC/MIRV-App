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
    case 'intakeCommand':
      return IntakeRoverCommand.fromJson(json);
    case 'drivetrainCommand':
      return DrivetrainRoverCommand.fromJson(json);
    case 'movementCommand':
      return MovementRoverCommand.fromJson(json);

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
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        movementCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(MovementRoverCommand value) movementCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
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
  $Res call({RoverCommandTypeGeneral command, RoverSubsystemType subsystem});
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
    Object? subsystem = freezed,
  }) {
    return _then(_$GeneralRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeGeneral,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralRoverCommand implements GeneralRoverCommand {
  const _$GeneralRoverCommand(this.command,
      {this.subsystem = RoverSubsystemType.general, final String? $type})
      : $type = $type ?? 'generalCommand';

  factory _$GeneralRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$GeneralRoverCommandFromJson(json);

  @override
  final RoverCommandTypeGeneral command;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.generalCommand(command: $command, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralRoverCommand &&
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
  _$$GeneralRoverCommandCopyWith<_$GeneralRoverCommand> get copyWith =>
      __$$GeneralRoverCommandCopyWithImpl<_$GeneralRoverCommand>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        movementCommand,
  }) {
    return generalCommand(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
  }) {
    return generalCommand?.call(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
    required TResult orElse(),
  }) {
    if (generalCommand != null) {
      return generalCommand(command, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(MovementRoverCommand value) movementCommand,
  }) {
    return generalCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
  }) {
    return generalCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
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
      {final RoverSubsystemType subsystem}) = _$GeneralRoverCommand;

  factory GeneralRoverCommand.fromJson(Map<String, dynamic> json) =
      _$GeneralRoverCommand.fromJson;

  RoverCommandTypeGeneral get command => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$GeneralRoverCommandCopyWith<_$GeneralRoverCommand> get copyWith =>
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
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        movementCommand,
  }) {
    return intakeCommand(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
  }) {
    return intakeCommand?.call(command, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
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
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(MovementRoverCommand value) movementCommand,
  }) {
    return intakeCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
  }) {
    return intakeCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
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
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        movementCommand,
  }) {
    return drivetrainCommand(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
  }) {
    return drivetrainCommand?.call(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
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
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(MovementRoverCommand value) movementCommand,
  }) {
    return drivetrainCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
  }) {
    return drivetrainCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
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
abstract class _$$MovementRoverCommandCopyWith<$Res>
    implements $RoverCommandCopyWith<$Res> {
  factory _$$MovementRoverCommandCopyWith(_$MovementRoverCommand value,
          $Res Function(_$MovementRoverCommand) then) =
      __$$MovementRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoverCommandTypeMovement command,
      RoverCommandParameters commandParameters,
      RoverSubsystemType subsystem});

  $RoverCommandParametersCopyWith<$Res> get commandParameters;
}

/// @nodoc
class __$$MovementRoverCommandCopyWithImpl<$Res>
    extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$MovementRoverCommandCopyWith<$Res> {
  __$$MovementRoverCommandCopyWithImpl(_$MovementRoverCommand _value,
      $Res Function(_$MovementRoverCommand) _then)
      : super(_value, (v) => _then(v as _$MovementRoverCommand));

  @override
  _$MovementRoverCommand get _value => super._value as _$MovementRoverCommand;

  @override
  $Res call({
    Object? command = freezed,
    Object? commandParameters = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$MovementRoverCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeMovement,
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
class _$MovementRoverCommand implements MovementRoverCommand {
  const _$MovementRoverCommand(this.command, this.commandParameters,
      {this.subsystem = RoverSubsystemType.movement, final String? $type})
      : $type = $type ?? 'movementCommand';

  factory _$MovementRoverCommand.fromJson(Map<String, dynamic> json) =>
      _$$MovementRoverCommandFromJson(json);

  @override
  final RoverCommandTypeMovement command;
  @override
  final RoverCommandParameters commandParameters;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.movementCommand(command: $command, commandParameters: $commandParameters, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementRoverCommand &&
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
  _$$MovementRoverCommandCopyWith<_$MovementRoverCommand> get copyWith =>
      __$$MovementRoverCommandCopyWithImpl<_$MovementRoverCommand>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)
        generalCommand,
    required TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)
        intakeCommand,
    required TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        drivetrainCommand,
    required TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)
        movementCommand,
  }) {
    return movementCommand(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
  }) {
    return movementCommand?.call(command, commandParameters, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RoverCommandTypeGeneral command, RoverSubsystemType subsystem)?
        generalCommand,
    TResult Function(
            RoverCommandTypeIntake command, RoverSubsystemType subsystem)?
        intakeCommand,
    TResult Function(
            RoverCommandTypeDrivetrain command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        drivetrainCommand,
    TResult Function(
            RoverCommandTypeMovement command,
            RoverCommandParameters commandParameters,
            RoverSubsystemType subsystem)?
        movementCommand,
    required TResult orElse(),
  }) {
    if (movementCommand != null) {
      return movementCommand(command, commandParameters, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
    required TResult Function(MovementRoverCommand value) movementCommand,
  }) {
    return movementCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
  }) {
    return movementCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    TResult Function(MovementRoverCommand value)? movementCommand,
    required TResult orElse(),
  }) {
    if (movementCommand != null) {
      return movementCommand(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementRoverCommandToJson(this);
  }
}

abstract class MovementRoverCommand implements RoverCommand {
  const factory MovementRoverCommand(final RoverCommandTypeMovement command,
      final RoverCommandParameters commandParameters,
      {final RoverSubsystemType subsystem}) = _$MovementRoverCommand;

  factory MovementRoverCommand.fromJson(Map<String, dynamic> json) =
      _$MovementRoverCommand.fromJson;

  RoverCommandTypeMovement get command => throw _privateConstructorUsedError;
  RoverCommandParameters get commandParameters =>
      throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$MovementRoverCommandCopyWith<_$MovementRoverCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

RoverCommandParameters _$RoverCommandParametersFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'drivetrain':
      return RoverCommandParametersDrivetrain.fromJson(json);
    case 'movement':
      return RoverCommandParametersMovement.fromJson(json);

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
    required TResult Function(double lat, double long) movement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? movement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? movement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersMovement value) movement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersMovement value)? movement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersMovement value)? movement,
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
    required TResult Function(double lat, double long) movement,
  }) {
    return drivetrain(x, y);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? movement,
  }) {
    return drivetrain?.call(x, y);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? movement,
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
    required TResult Function(RoverCommandParametersMovement value) movement,
  }) {
    return drivetrain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersMovement value)? movement,
  }) {
    return drivetrain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersMovement value)? movement,
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
abstract class _$$RoverCommandParametersMovementCopyWith<$Res> {
  factory _$$RoverCommandParametersMovementCopyWith(
          _$RoverCommandParametersMovement value,
          $Res Function(_$RoverCommandParametersMovement) then) =
      __$$RoverCommandParametersMovementCopyWithImpl<$Res>;
  $Res call({double lat, double long});
}

/// @nodoc
class __$$RoverCommandParametersMovementCopyWithImpl<$Res>
    extends _$RoverCommandParametersCopyWithImpl<$Res>
    implements _$$RoverCommandParametersMovementCopyWith<$Res> {
  __$$RoverCommandParametersMovementCopyWithImpl(
      _$RoverCommandParametersMovement _value,
      $Res Function(_$RoverCommandParametersMovement) _then)
      : super(_value, (v) => _then(v as _$RoverCommandParametersMovement));

  @override
  _$RoverCommandParametersMovement get _value =>
      super._value as _$RoverCommandParametersMovement;

  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_$RoverCommandParametersMovement(
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
class _$RoverCommandParametersMovement
    implements RoverCommandParametersMovement {
  const _$RoverCommandParametersMovement(this.lat, this.long,
      {final String? $type})
      : $type = $type ?? 'movement';

  factory _$RoverCommandParametersMovement.fromJson(
          Map<String, dynamic> json) =>
      _$$RoverCommandParametersMovementFromJson(json);

  @override
  final double lat;
  @override
  final double long;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommandParameters.movement(lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoverCommandParametersMovement &&
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
  _$$RoverCommandParametersMovementCopyWith<_$RoverCommandParametersMovement>
      get copyWith => __$$RoverCommandParametersMovementCopyWithImpl<
          _$RoverCommandParametersMovement>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double x, double y) drivetrain,
    required TResult Function(double lat, double long) movement,
  }) {
    return movement(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? movement,
  }) {
    return movement?.call(lat, long);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double x, double y)? drivetrain,
    TResult Function(double lat, double long)? movement,
    required TResult orElse(),
  }) {
    if (movement != null) {
      return movement(lat, long);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoverCommandParametersDrivetrain value)
        drivetrain,
    required TResult Function(RoverCommandParametersMovement value) movement,
  }) {
    return movement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersMovement value)? movement,
  }) {
    return movement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoverCommandParametersDrivetrain value)? drivetrain,
    TResult Function(RoverCommandParametersMovement value)? movement,
    required TResult orElse(),
  }) {
    if (movement != null) {
      return movement(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RoverCommandParametersMovementToJson(this);
  }
}

abstract class RoverCommandParametersMovement
    implements RoverCommandParameters {
  const factory RoverCommandParametersMovement(
      final double lat, final double long) = _$RoverCommandParametersMovement;

  factory RoverCommandParametersMovement.fromJson(Map<String, dynamic> json) =
      _$RoverCommandParametersMovement.fromJson;

  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoverCommandParametersMovementCopyWith<_$RoverCommandParametersMovement>
      get copyWith => throw _privateConstructorUsedError;
}
