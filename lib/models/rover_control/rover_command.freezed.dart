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

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RoverCommand', 'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RoverCommand {
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem) generalCommand,
    required TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem) intakeCommand,
    required TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)
        drivetrainCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverCommandCopyWith<RoverCommand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverCommandCopyWith<$Res> {
  factory $RoverCommandCopyWith(RoverCommand value, $Res Function(RoverCommand) then) = _$RoverCommandCopyWithImpl<$Res>;
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
abstract class _$$GeneralRoverCommandCopyWith<$Res> implements $RoverCommandCopyWith<$Res> {
  factory _$$GeneralRoverCommandCopyWith(_$GeneralRoverCommand value, $Res Function(_$GeneralRoverCommand) then) =
      __$$GeneralRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call({RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem});
}

/// @nodoc
class __$$GeneralRoverCommandCopyWithImpl<$Res> extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$GeneralRoverCommandCopyWith<$Res> {
  __$$GeneralRoverCommandCopyWithImpl(_$GeneralRoverCommand _value, $Res Function(_$GeneralRoverCommand) _then)
      : super(_value, (v) => _then(v as _$GeneralRoverCommand));

  @override
  _$GeneralRoverCommand get _value => super._value as _$GeneralRoverCommand;

  @override
  $Res call({
    Object? commandType = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$GeneralRoverCommand(
      commandType == freezed
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
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
  const _$GeneralRoverCommand(this.commandType, {this.subsystem = RoverSubsystemType.general, final String? $type})
      : $type = $type ?? 'generalCommand';

  factory _$GeneralRoverCommand.fromJson(Map<String, dynamic> json) => _$$GeneralRoverCommandFromJson(json);

  @override
  final RoverCommandTypeGeneral commandType;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.generalCommand(commandType: $commandType, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralRoverCommand &&
            const DeepCollectionEquality().equals(other.commandType, commandType) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(commandType), const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$GeneralRoverCommandCopyWith<_$GeneralRoverCommand> get copyWith =>
      __$$GeneralRoverCommandCopyWithImpl<_$GeneralRoverCommand>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem) generalCommand,
    required TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem) intakeCommand,
    required TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)
        drivetrainCommand,
  }) {
    return generalCommand(commandType, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
  }) {
    return generalCommand?.call(commandType, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
    required TResult orElse(),
  }) {
    if (generalCommand != null) {
      return generalCommand(commandType, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
  }) {
    return generalCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
  }) {
    return generalCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
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
  const factory GeneralRoverCommand(final RoverCommandTypeGeneral commandType, {final RoverSubsystemType subsystem}) =
      _$GeneralRoverCommand;

  factory GeneralRoverCommand.fromJson(Map<String, dynamic> json) = _$GeneralRoverCommand.fromJson;

  RoverCommandTypeGeneral get commandType => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$GeneralRoverCommandCopyWith<_$GeneralRoverCommand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IntakeRoverCommandCopyWith<$Res> implements $RoverCommandCopyWith<$Res> {
  factory _$$IntakeRoverCommandCopyWith(_$IntakeRoverCommand value, $Res Function(_$IntakeRoverCommand) then) =
      __$$IntakeRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call({RoverCommandTypeIntake commandType, RoverSubsystemType subsystem});
}

/// @nodoc
class __$$IntakeRoverCommandCopyWithImpl<$Res> extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$IntakeRoverCommandCopyWith<$Res> {
  __$$IntakeRoverCommandCopyWithImpl(_$IntakeRoverCommand _value, $Res Function(_$IntakeRoverCommand) _then)
      : super(_value, (v) => _then(v as _$IntakeRoverCommand));

  @override
  _$IntakeRoverCommand get _value => super._value as _$IntakeRoverCommand;

  @override
  $Res call({
    Object? commandType = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$IntakeRoverCommand(
      commandType == freezed
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
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
  const _$IntakeRoverCommand(this.commandType, {this.subsystem = RoverSubsystemType.intake, final String? $type})
      : $type = $type ?? 'intakeCommand';

  factory _$IntakeRoverCommand.fromJson(Map<String, dynamic> json) => _$$IntakeRoverCommandFromJson(json);

  @override
  final RoverCommandTypeIntake commandType;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.intakeCommand(commandType: $commandType, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntakeRoverCommand &&
            const DeepCollectionEquality().equals(other.commandType, commandType) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(commandType), const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$IntakeRoverCommandCopyWith<_$IntakeRoverCommand> get copyWith =>
      __$$IntakeRoverCommandCopyWithImpl<_$IntakeRoverCommand>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem) generalCommand,
    required TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem) intakeCommand,
    required TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)
        drivetrainCommand,
  }) {
    return intakeCommand(commandType, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
  }) {
    return intakeCommand?.call(commandType, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
    required TResult orElse(),
  }) {
    if (intakeCommand != null) {
      return intakeCommand(commandType, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
  }) {
    return intakeCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
  }) {
    return intakeCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
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
  const factory IntakeRoverCommand(final RoverCommandTypeIntake commandType, {final RoverSubsystemType subsystem}) =
      _$IntakeRoverCommand;

  factory IntakeRoverCommand.fromJson(Map<String, dynamic> json) = _$IntakeRoverCommand.fromJson;

  RoverCommandTypeIntake get commandType => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$IntakeRoverCommandCopyWith<_$IntakeRoverCommand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DrivetrainRoverCommandCopyWith<$Res> implements $RoverCommandCopyWith<$Res> {
  factory _$$DrivetrainRoverCommandCopyWith(_$DrivetrainRoverCommand value, $Res Function(_$DrivetrainRoverCommand) then) =
      __$$DrivetrainRoverCommandCopyWithImpl<$Res>;
  @override
  $Res call({RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem});
}

/// @nodoc
class __$$DrivetrainRoverCommandCopyWithImpl<$Res> extends _$RoverCommandCopyWithImpl<$Res>
    implements _$$DrivetrainRoverCommandCopyWith<$Res> {
  __$$DrivetrainRoverCommandCopyWithImpl(_$DrivetrainRoverCommand _value, $Res Function(_$DrivetrainRoverCommand) _then)
      : super(_value, (v) => _then(v as _$DrivetrainRoverCommand));

  @override
  _$DrivetrainRoverCommand get _value => super._value as _$DrivetrainRoverCommand;

  @override
  $Res call({
    Object? commandType = freezed,
    Object? x = freezed,
    Object? y = freezed,
    Object? subsystem = freezed,
  }) {
    return _then(_$DrivetrainRoverCommand(
      commandType == freezed
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
              as RoverCommandTypeDrivetrain,
      x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      subsystem: subsystem == freezed
          ? _value.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as RoverSubsystemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrivetrainRoverCommand implements DrivetrainRoverCommand {
  const _$DrivetrainRoverCommand(this.commandType, this.x, this.y,
      {this.subsystem = RoverSubsystemType.drivetrain, final String? $type})
      : $type = $type ?? 'drivetrainCommand';

  factory _$DrivetrainRoverCommand.fromJson(Map<String, dynamic> json) => _$$DrivetrainRoverCommandFromJson(json);

  @override
  final RoverCommandTypeDrivetrain commandType;
  @override
  final double x;
  @override
  final double y;
  @override
  @JsonKey()
  final RoverSubsystemType subsystem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoverCommand.drivetrainCommand(commandType: $commandType, x: $x, y: $y, subsystem: $subsystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrivetrainRoverCommand &&
            const DeepCollectionEquality().equals(other.commandType, commandType) &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y) &&
            const DeepCollectionEquality().equals(other.subsystem, subsystem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(commandType),
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y),
      const DeepCollectionEquality().hash(subsystem));

  @JsonKey(ignore: true)
  @override
  _$$DrivetrainRoverCommandCopyWith<_$DrivetrainRoverCommand> get copyWith =>
      __$$DrivetrainRoverCommandCopyWithImpl<_$DrivetrainRoverCommand>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem) generalCommand,
    required TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem) intakeCommand,
    required TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)
        drivetrainCommand,
  }) {
    return drivetrainCommand(commandType, x, y, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
  }) {
    return drivetrainCommand?.call(commandType, x, y, subsystem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoverCommandTypeGeneral commandType, RoverSubsystemType subsystem)? generalCommand,
    TResult Function(RoverCommandTypeIntake commandType, RoverSubsystemType subsystem)? intakeCommand,
    TResult Function(RoverCommandTypeDrivetrain commandType, double x, double y, RoverSubsystemType subsystem)? drivetrainCommand,
    required TResult orElse(),
  }) {
    if (drivetrainCommand != null) {
      return drivetrainCommand(commandType, x, y, subsystem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralRoverCommand value) generalCommand,
    required TResult Function(IntakeRoverCommand value) intakeCommand,
    required TResult Function(DrivetrainRoverCommand value) drivetrainCommand,
  }) {
    return drivetrainCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
  }) {
    return drivetrainCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralRoverCommand value)? generalCommand,
    TResult Function(IntakeRoverCommand value)? intakeCommand,
    TResult Function(DrivetrainRoverCommand value)? drivetrainCommand,
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
  const factory DrivetrainRoverCommand(final RoverCommandTypeDrivetrain commandType, final double x, final double y,
      {final RoverSubsystemType subsystem}) = _$DrivetrainRoverCommand;

  factory DrivetrainRoverCommand.fromJson(Map<String, dynamic> json) = _$DrivetrainRoverCommand.fromJson;

  RoverCommandTypeDrivetrain get commandType => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  @override
  RoverSubsystemType get subsystem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DrivetrainRoverCommandCopyWith<_$DrivetrainRoverCommand> get copyWith => throw _privateConstructorUsedError;
}
