// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'garage_commands.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GarageCommand _$GarageCommandFromJson(Map<String, dynamic> json) {
  return GeneralGarageCommand.fromJson(json);
}

/// @nodoc
mixin _$GarageCommand {
  GarageCommandType get command => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarageCommandCopyWith<GarageCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarageCommandCopyWith<$Res> {
  factory $GarageCommandCopyWith(
          GarageCommand value, $Res Function(GarageCommand) then) =
      _$GarageCommandCopyWithImpl<$Res>;
  $Res call({GarageCommandType command});
}

/// @nodoc
class _$GarageCommandCopyWithImpl<$Res>
    implements $GarageCommandCopyWith<$Res> {
  _$GarageCommandCopyWithImpl(this._value, this._then);

  final GarageCommand _value;
  // ignore: unused_field
  final $Res Function(GarageCommand) _then;

  @override
  $Res call({
    Object? command = freezed,
  }) {
    return _then(_value.copyWith(
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as GarageCommandType,
    ));
  }
}

/// @nodoc
abstract class _$$GeneralGarageCommandCopyWith<$Res>
    implements $GarageCommandCopyWith<$Res> {
  factory _$$GeneralGarageCommandCopyWith(_$GeneralGarageCommand value,
          $Res Function(_$GeneralGarageCommand) then) =
      __$$GeneralGarageCommandCopyWithImpl<$Res>;
  @override
  $Res call({GarageCommandType command});
}

/// @nodoc
class __$$GeneralGarageCommandCopyWithImpl<$Res>
    extends _$GarageCommandCopyWithImpl<$Res>
    implements _$$GeneralGarageCommandCopyWith<$Res> {
  __$$GeneralGarageCommandCopyWithImpl(_$GeneralGarageCommand _value,
      $Res Function(_$GeneralGarageCommand) _then)
      : super(_value, (v) => _then(v as _$GeneralGarageCommand));

  @override
  _$GeneralGarageCommand get _value => super._value as _$GeneralGarageCommand;

  @override
  $Res call({
    Object? command = freezed,
  }) {
    return _then(_$GeneralGarageCommand(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as GarageCommandType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralGarageCommand implements GeneralGarageCommand {
  const _$GeneralGarageCommand(this.command);

  factory _$GeneralGarageCommand.fromJson(Map<String, dynamic> json) =>
      _$$GeneralGarageCommandFromJson(json);

  @override
  final GarageCommandType command;

  @override
  String toString() {
    return 'GarageCommand(command: $command)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralGarageCommand &&
            const DeepCollectionEquality().equals(other.command, command));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(command));

  @JsonKey(ignore: true)
  @override
  _$$GeneralGarageCommandCopyWith<_$GeneralGarageCommand> get copyWith =>
      __$$GeneralGarageCommandCopyWithImpl<_$GeneralGarageCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralGarageCommandToJson(this);
  }
}

abstract class GeneralGarageCommand implements GarageCommand {
  const factory GeneralGarageCommand(final GarageCommandType command) =
      _$GeneralGarageCommand;

  factory GeneralGarageCommand.fromJson(Map<String, dynamic> json) =
      _$GeneralGarageCommand.fromJson;

  @override
  GarageCommandType get command => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$GeneralGarageCommandCopyWith<_$GeneralGarageCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
