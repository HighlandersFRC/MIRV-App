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
  String get buttonInput => throw _privateConstructorUsedError;

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
  $Res call({String buttonInput});
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
    Object? buttonInput = freezed,
  }) {
    return _then(_value.copyWith(
      buttonInput: buttonInput == freezed
          ? _value.buttonInput
          : buttonInput // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String buttonInput});
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
    Object? buttonInput = freezed,
  }) {
    return _then(_$_RoverCommands(
      buttonInput: buttonInput == freezed
          ? _value.buttonInput
          : buttonInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoverCommands implements _RoverCommands {
  const _$_RoverCommands({required this.buttonInput});

  factory _$_RoverCommands.fromJson(Map<String, dynamic> json) =>
      _$$_RoverCommandsFromJson(json);

  @override
  final String buttonInput;

  @override
  String toString() {
    return 'RoverCommands(buttonInput: $buttonInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoverCommands &&
            const DeepCollectionEquality()
                .equals(other.buttonInput, buttonInput));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(buttonInput));

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
  const factory _RoverCommands({required final String buttonInput}) =
      _$_RoverCommands;

  factory _RoverCommands.fromJson(Map<String, dynamic> json) =
      _$_RoverCommands.fromJson;

  @override
  String get buttonInput => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoverCommandsCopyWith<_$_RoverCommands> get copyWith =>
      throw _privateConstructorUsedError;
}
