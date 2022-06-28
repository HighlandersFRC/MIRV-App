// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rover_commands.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoverCommands _$RoverCommandsFromJson(Map<String, dynamic> json) {
  return _RoverCommands.fromJson(json);
}

/// @nodoc
mixin _$RoverCommands {
  RoverCommandType get commandType => throw _privateConstructorUsedError;
  dynamic get commandParameters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverCommandsCopyWith<RoverCommands> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverCommandsCopyWith<$Res> {
  factory $RoverCommandsCopyWith(
          RoverCommands value, $Res Function(RoverCommands) then) =
      _$RoverCommandsCopyWithImpl<$Res>;
  $Res call({RoverCommandType commandType, dynamic commandParameters});
}

/// @nodoc
class _$RoverCommandsCopyWithImpl<$Res>
    implements $RoverCommandsCopyWith<$Res> {
  _$RoverCommandsCopyWithImpl(this._value, this._then);

  final RoverCommands _value;
  // ignore: unused_field
  final $Res Function(RoverCommands) _then;

  @override
  $Res call({
    Object? commandType = freezed,
    Object? commandParameters = freezed,
  }) {
    return _then(_value.copyWith(
      commandType: commandType == freezed
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
              as RoverCommandType,
      commandParameters: commandParameters == freezed
          ? _value.commandParameters
          : commandParameters // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_RoverCommandsCopyWith<$Res>
    implements $RoverCommandsCopyWith<$Res> {
  factory _$$_RoverCommandsCopyWith(
          _$_RoverCommands value, $Res Function(_$_RoverCommands) then) =
      __$$_RoverCommandsCopyWithImpl<$Res>;
  @override
  $Res call({RoverCommandType commandType, dynamic commandParameters});
}

/// @nodoc
class __$$_RoverCommandsCopyWithImpl<$Res>
    extends _$RoverCommandsCopyWithImpl<$Res>
    implements _$$_RoverCommandsCopyWith<$Res> {
  __$$_RoverCommandsCopyWithImpl(
      _$_RoverCommands _value, $Res Function(_$_RoverCommands) _then)
      : super(_value, (v) => _then(v as _$_RoverCommands));

  @override
  _$_RoverCommands get _value => super._value as _$_RoverCommands;

  @override
  $Res call({
    Object? commandType = freezed,
    Object? commandParameters = freezed,
  }) {
    return _then(_$_RoverCommands(
      commandType: commandType == freezed
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
              as RoverCommandType,
      commandParameters: commandParameters == freezed
          ? _value.commandParameters
          : commandParameters // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverCommands implements _RoverCommands {
  const _$_RoverCommands(
      {required this.commandType, this.commandParameters = ""});

  factory _$_RoverCommands.fromJson(Map<String, dynamic> json) =>
      _$$_RoverCommandsFromJson(json);

  @override
  final RoverCommandType commandType;
  @override
  @JsonKey()
  final dynamic commandParameters;

  @override
  String toString() {
    return 'RoverCommands(commandType: $commandType, commandParameters: $commandParameters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverCommands &&
            const DeepCollectionEquality()
                .equals(other.commandType, commandType) &&
            const DeepCollectionEquality()
                .equals(other.commandParameters, commandParameters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(commandType),
      const DeepCollectionEquality().hash(commandParameters));

  @JsonKey(ignore: true)
  @override
  _$$_RoverCommandsCopyWith<_$_RoverCommands> get copyWith =>
      __$$_RoverCommandsCopyWithImpl<_$_RoverCommands>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverCommandsToJson(this);
  }
}

abstract class _RoverCommands implements RoverCommands {
  const factory _RoverCommands(
      {required final RoverCommandType commandType,
      final dynamic commandParameters}) = _$_RoverCommands;

  factory _RoverCommands.fromJson(Map<String, dynamic> json) =
      _$_RoverCommands.fromJson;

  @override
  RoverCommandType get commandType => throw _privateConstructorUsedError;
  @override
  dynamic get commandParameters => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverCommandsCopyWith<_$_RoverCommands> get copyWith =>
      throw _privateConstructorUsedError;
}
