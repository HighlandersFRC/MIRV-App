// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gamepad_command_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GamepadAxisCommand _$GamepadAxisCommandFromJson(Map<String, dynamic> json) {
  return _GamepadAxisCommand.fromJson(json);
}

/// @nodoc
mixin _$GamepadAxisCommand {
  GamepadAxisType get type => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError; //RoverStateType
  double get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamepadAxisCommandCopyWith<GamepadAxisCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamepadAxisCommandCopyWith<$Res> {
  factory $GamepadAxisCommandCopyWith(
          GamepadAxisCommand value, $Res Function(GamepadAxisCommand) then) =
      _$GamepadAxisCommandCopyWithImpl<$Res>;
  $Res call({GamepadAxisType type, double x, double y});
}

/// @nodoc
class _$GamepadAxisCommandCopyWithImpl<$Res>
    implements $GamepadAxisCommandCopyWith<$Res> {
  _$GamepadAxisCommandCopyWithImpl(this._value, this._then);

  final GamepadAxisCommand _value;
  // ignore: unused_field
  final $Res Function(GamepadAxisCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadAxisType,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_GamepadAxisCommandCopyWith<$Res>
    implements $GamepadAxisCommandCopyWith<$Res> {
  factory _$$_GamepadAxisCommandCopyWith(_$_GamepadAxisCommand value,
          $Res Function(_$_GamepadAxisCommand) then) =
      __$$_GamepadAxisCommandCopyWithImpl<$Res>;
  @override
  $Res call({GamepadAxisType type, double x, double y});
}

/// @nodoc
class __$$_GamepadAxisCommandCopyWithImpl<$Res>
    extends _$GamepadAxisCommandCopyWithImpl<$Res>
    implements _$$_GamepadAxisCommandCopyWith<$Res> {
  __$$_GamepadAxisCommandCopyWithImpl(
      _$_GamepadAxisCommand _value, $Res Function(_$_GamepadAxisCommand) _then)
      : super(_value, (v) => _then(v as _$_GamepadAxisCommand));

  @override
  _$_GamepadAxisCommand get _value => super._value as _$_GamepadAxisCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$_GamepadAxisCommand(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadAxisType,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GamepadAxisCommand implements _GamepadAxisCommand {
  const _$_GamepadAxisCommand(
      {required this.type, required this.x, required this.y});

  factory _$_GamepadAxisCommand.fromJson(Map<String, dynamic> json) =>
      _$$_GamepadAxisCommandFromJson(json);

  @override
  final GamepadAxisType type;
  @override
  final double x;
//RoverStateType
  @override
  final double y;

  @override
  String toString() {
    return 'GamepadAxisCommand(type: $type, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamepadAxisCommand &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y));

  @JsonKey(ignore: true)
  @override
  _$$_GamepadAxisCommandCopyWith<_$_GamepadAxisCommand> get copyWith =>
      __$$_GamepadAxisCommandCopyWithImpl<_$_GamepadAxisCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamepadAxisCommandToJson(this);
  }
}

abstract class _GamepadAxisCommand implements GamepadAxisCommand {
  const factory _GamepadAxisCommand(
      {required final GamepadAxisType type,
      required final double x,
      required final double y}) = _$_GamepadAxisCommand;

  factory _GamepadAxisCommand.fromJson(Map<String, dynamic> json) =
      _$_GamepadAxisCommand.fromJson;

  @override
  GamepadAxisType get type => throw _privateConstructorUsedError;
  @override
  double get x => throw _privateConstructorUsedError;
  @override //RoverStateType
  double get y => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GamepadAxisCommandCopyWith<_$_GamepadAxisCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

GamepadTriggerCommand _$GamepadTriggerCommandFromJson(
    Map<String, dynamic> json) {
  return _GamepadTriggerCommand.fromJson(json);
}

/// @nodoc
mixin _$GamepadTriggerCommand {
  GamepadTriggerType get type => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamepadTriggerCommandCopyWith<GamepadTriggerCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamepadTriggerCommandCopyWith<$Res> {
  factory $GamepadTriggerCommandCopyWith(GamepadTriggerCommand value,
          $Res Function(GamepadTriggerCommand) then) =
      _$GamepadTriggerCommandCopyWithImpl<$Res>;
  $Res call({GamepadTriggerType type, double value});
}

/// @nodoc
class _$GamepadTriggerCommandCopyWithImpl<$Res>
    implements $GamepadTriggerCommandCopyWith<$Res> {
  _$GamepadTriggerCommandCopyWithImpl(this._value, this._then);

  final GamepadTriggerCommand _value;
  // ignore: unused_field
  final $Res Function(GamepadTriggerCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadTriggerType,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_GamepadTriggerCommandCopyWith<$Res>
    implements $GamepadTriggerCommandCopyWith<$Res> {
  factory _$$_GamepadTriggerCommandCopyWith(_$_GamepadTriggerCommand value,
          $Res Function(_$_GamepadTriggerCommand) then) =
      __$$_GamepadTriggerCommandCopyWithImpl<$Res>;
  @override
  $Res call({GamepadTriggerType type, double value});
}

/// @nodoc
class __$$_GamepadTriggerCommandCopyWithImpl<$Res>
    extends _$GamepadTriggerCommandCopyWithImpl<$Res>
    implements _$$_GamepadTriggerCommandCopyWith<$Res> {
  __$$_GamepadTriggerCommandCopyWithImpl(_$_GamepadTriggerCommand _value,
      $Res Function(_$_GamepadTriggerCommand) _then)
      : super(_value, (v) => _then(v as _$_GamepadTriggerCommand));

  @override
  _$_GamepadTriggerCommand get _value =>
      super._value as _$_GamepadTriggerCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_GamepadTriggerCommand(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadTriggerType,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GamepadTriggerCommand implements _GamepadTriggerCommand {
  const _$_GamepadTriggerCommand({required this.type, required this.value});

  factory _$_GamepadTriggerCommand.fromJson(Map<String, dynamic> json) =>
      _$$_GamepadTriggerCommandFromJson(json);

  @override
  final GamepadTriggerType type;
  @override
  final double value;

  @override
  String toString() {
    return 'GamepadTriggerCommand(type: $type, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamepadTriggerCommand &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_GamepadTriggerCommandCopyWith<_$_GamepadTriggerCommand> get copyWith =>
      __$$_GamepadTriggerCommandCopyWithImpl<_$_GamepadTriggerCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamepadTriggerCommandToJson(this);
  }
}

abstract class _GamepadTriggerCommand implements GamepadTriggerCommand {
  const factory _GamepadTriggerCommand(
      {required final GamepadTriggerType type,
      required final double value}) = _$_GamepadTriggerCommand;

  factory _GamepadTriggerCommand.fromJson(Map<String, dynamic> json) =
      _$_GamepadTriggerCommand.fromJson;

  @override
  GamepadTriggerType get type => throw _privateConstructorUsedError;
  @override
  double get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GamepadTriggerCommandCopyWith<_$_GamepadTriggerCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

GamepadBumperCommand _$GamepadBumperCommandFromJson(Map<String, dynamic> json) {
  return _GamepadBumperCommand.fromJson(json);
}

/// @nodoc
mixin _$GamepadBumperCommand {
  GamepadBumperType get type => throw _privateConstructorUsedError;
  double get isPressed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamepadBumperCommandCopyWith<GamepadBumperCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamepadBumperCommandCopyWith<$Res> {
  factory $GamepadBumperCommandCopyWith(GamepadBumperCommand value,
          $Res Function(GamepadBumperCommand) then) =
      _$GamepadBumperCommandCopyWithImpl<$Res>;
  $Res call({GamepadBumperType type, double isPressed});
}

/// @nodoc
class _$GamepadBumperCommandCopyWithImpl<$Res>
    implements $GamepadBumperCommandCopyWith<$Res> {
  _$GamepadBumperCommandCopyWithImpl(this._value, this._then);

  final GamepadBumperCommand _value;
  // ignore: unused_field
  final $Res Function(GamepadBumperCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? isPressed = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadBumperType,
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_GamepadBumperCommandCopyWith<$Res>
    implements $GamepadBumperCommandCopyWith<$Res> {
  factory _$$_GamepadBumperCommandCopyWith(_$_GamepadBumperCommand value,
          $Res Function(_$_GamepadBumperCommand) then) =
      __$$_GamepadBumperCommandCopyWithImpl<$Res>;
  @override
  $Res call({GamepadBumperType type, double isPressed});
}

/// @nodoc
class __$$_GamepadBumperCommandCopyWithImpl<$Res>
    extends _$GamepadBumperCommandCopyWithImpl<$Res>
    implements _$$_GamepadBumperCommandCopyWith<$Res> {
  __$$_GamepadBumperCommandCopyWithImpl(_$_GamepadBumperCommand _value,
      $Res Function(_$_GamepadBumperCommand) _then)
      : super(_value, (v) => _then(v as _$_GamepadBumperCommand));

  @override
  _$_GamepadBumperCommand get _value => super._value as _$_GamepadBumperCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? isPressed = freezed,
  }) {
    return _then(_$_GamepadBumperCommand(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadBumperType,
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GamepadBumperCommand implements _GamepadBumperCommand {
  const _$_GamepadBumperCommand({required this.type, required this.isPressed});

  factory _$_GamepadBumperCommand.fromJson(Map<String, dynamic> json) =>
      _$$_GamepadBumperCommandFromJson(json);

  @override
  final GamepadBumperType type;
  @override
  final double isPressed;

  @override
  String toString() {
    return 'GamepadBumperCommand(type: $type, isPressed: $isPressed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamepadBumperCommand &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isPressed, isPressed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isPressed));

  @JsonKey(ignore: true)
  @override
  _$$_GamepadBumperCommandCopyWith<_$_GamepadBumperCommand> get copyWith =>
      __$$_GamepadBumperCommandCopyWithImpl<_$_GamepadBumperCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamepadBumperCommandToJson(this);
  }
}

abstract class _GamepadBumperCommand implements GamepadBumperCommand {
  const factory _GamepadBumperCommand(
      {required final GamepadBumperType type,
      required final double isPressed}) = _$_GamepadBumperCommand;

  factory _GamepadBumperCommand.fromJson(Map<String, dynamic> json) =
      _$_GamepadBumperCommand.fromJson;

  @override
  GamepadBumperType get type => throw _privateConstructorUsedError;
  @override
  double get isPressed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GamepadBumperCommandCopyWith<_$_GamepadBumperCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

GamepadDPadCommand _$GamepadDPadCommandFromJson(Map<String, dynamic> json) {
  return _GamepadDPadCommand.fromJson(json);
}

/// @nodoc
mixin _$GamepadDPadCommand {
  GamepadDPadType get type => throw _privateConstructorUsedError;
  int get isPressed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamepadDPadCommandCopyWith<GamepadDPadCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamepadDPadCommandCopyWith<$Res> {
  factory $GamepadDPadCommandCopyWith(
          GamepadDPadCommand value, $Res Function(GamepadDPadCommand) then) =
      _$GamepadDPadCommandCopyWithImpl<$Res>;
  $Res call({GamepadDPadType type, int isPressed});
}

/// @nodoc
class _$GamepadDPadCommandCopyWithImpl<$Res>
    implements $GamepadDPadCommandCopyWith<$Res> {
  _$GamepadDPadCommandCopyWithImpl(this._value, this._then);

  final GamepadDPadCommand _value;
  // ignore: unused_field
  final $Res Function(GamepadDPadCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? isPressed = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadDPadType,
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GamepadDPadCommandCopyWith<$Res>
    implements $GamepadDPadCommandCopyWith<$Res> {
  factory _$$_GamepadDPadCommandCopyWith(_$_GamepadDPadCommand value,
          $Res Function(_$_GamepadDPadCommand) then) =
      __$$_GamepadDPadCommandCopyWithImpl<$Res>;
  @override
  $Res call({GamepadDPadType type, int isPressed});
}

/// @nodoc
class __$$_GamepadDPadCommandCopyWithImpl<$Res>
    extends _$GamepadDPadCommandCopyWithImpl<$Res>
    implements _$$_GamepadDPadCommandCopyWith<$Res> {
  __$$_GamepadDPadCommandCopyWithImpl(
      _$_GamepadDPadCommand _value, $Res Function(_$_GamepadDPadCommand) _then)
      : super(_value, (v) => _then(v as _$_GamepadDPadCommand));

  @override
  _$_GamepadDPadCommand get _value => super._value as _$_GamepadDPadCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? isPressed = freezed,
  }) {
    return _then(_$_GamepadDPadCommand(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadDPadType,
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GamepadDPadCommand implements _GamepadDPadCommand {
  const _$_GamepadDPadCommand({required this.type, required this.isPressed});

  factory _$_GamepadDPadCommand.fromJson(Map<String, dynamic> json) =>
      _$$_GamepadDPadCommandFromJson(json);

  @override
  final GamepadDPadType type;
  @override
  final int isPressed;

  @override
  String toString() {
    return 'GamepadDPadCommand(type: $type, isPressed: $isPressed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamepadDPadCommand &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isPressed, isPressed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isPressed));

  @JsonKey(ignore: true)
  @override
  _$$_GamepadDPadCommandCopyWith<_$_GamepadDPadCommand> get copyWith =>
      __$$_GamepadDPadCommandCopyWithImpl<_$_GamepadDPadCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamepadDPadCommandToJson(this);
  }
}

abstract class _GamepadDPadCommand implements GamepadDPadCommand {
  const factory _GamepadDPadCommand(
      {required final GamepadDPadType type,
      required final int isPressed}) = _$_GamepadDPadCommand;

  factory _GamepadDPadCommand.fromJson(Map<String, dynamic> json) =
      _$_GamepadDPadCommand.fromJson;

  @override
  GamepadDPadType get type => throw _privateConstructorUsedError;
  @override
  int get isPressed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GamepadDPadCommandCopyWith<_$_GamepadDPadCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

GamepadButtonCommand _$GamepadButtonCommandFromJson(Map<String, dynamic> json) {
  return _GamepadButtonCommand.fromJson(json);
}

/// @nodoc
mixin _$GamepadButtonCommand {
  GamepadButtonType get type => throw _privateConstructorUsedError;
  bool get isPressed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamepadButtonCommandCopyWith<GamepadButtonCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamepadButtonCommandCopyWith<$Res> {
  factory $GamepadButtonCommandCopyWith(GamepadButtonCommand value,
          $Res Function(GamepadButtonCommand) then) =
      _$GamepadButtonCommandCopyWithImpl<$Res>;
  $Res call({GamepadButtonType type, bool isPressed});
}

/// @nodoc
class _$GamepadButtonCommandCopyWithImpl<$Res>
    implements $GamepadButtonCommandCopyWith<$Res> {
  _$GamepadButtonCommandCopyWithImpl(this._value, this._then);

  final GamepadButtonCommand _value;
  // ignore: unused_field
  final $Res Function(GamepadButtonCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? isPressed = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadButtonType,
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_GamepadButtonCommandCopyWith<$Res>
    implements $GamepadButtonCommandCopyWith<$Res> {
  factory _$$_GamepadButtonCommandCopyWith(_$_GamepadButtonCommand value,
          $Res Function(_$_GamepadButtonCommand) then) =
      __$$_GamepadButtonCommandCopyWithImpl<$Res>;
  @override
  $Res call({GamepadButtonType type, bool isPressed});
}

/// @nodoc
class __$$_GamepadButtonCommandCopyWithImpl<$Res>
    extends _$GamepadButtonCommandCopyWithImpl<$Res>
    implements _$$_GamepadButtonCommandCopyWith<$Res> {
  __$$_GamepadButtonCommandCopyWithImpl(_$_GamepadButtonCommand _value,
      $Res Function(_$_GamepadButtonCommand) _then)
      : super(_value, (v) => _then(v as _$_GamepadButtonCommand));

  @override
  _$_GamepadButtonCommand get _value => super._value as _$_GamepadButtonCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? isPressed = freezed,
  }) {
    return _then(_$_GamepadButtonCommand(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GamepadButtonType,
      isPressed: isPressed == freezed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GamepadButtonCommand implements _GamepadButtonCommand {
  const _$_GamepadButtonCommand({required this.type, required this.isPressed});

  factory _$_GamepadButtonCommand.fromJson(Map<String, dynamic> json) =>
      _$$_GamepadButtonCommandFromJson(json);

  @override
  final GamepadButtonType type;
  @override
  final bool isPressed;

  @override
  String toString() {
    return 'GamepadButtonCommand(type: $type, isPressed: $isPressed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamepadButtonCommand &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isPressed, isPressed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isPressed));

  @JsonKey(ignore: true)
  @override
  _$$_GamepadButtonCommandCopyWith<_$_GamepadButtonCommand> get copyWith =>
      __$$_GamepadButtonCommandCopyWithImpl<_$_GamepadButtonCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamepadButtonCommandToJson(this);
  }
}

abstract class _GamepadButtonCommand implements GamepadButtonCommand {
  const factory _GamepadButtonCommand(
      {required final GamepadButtonType type,
      required final bool isPressed}) = _$_GamepadButtonCommand;

  factory _GamepadButtonCommand.fromJson(Map<String, dynamic> json) =
      _$_GamepadButtonCommand.fromJson;

  @override
  GamepadButtonType get type => throw _privateConstructorUsedError;
  @override
  bool get isPressed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GamepadButtonCommandCopyWith<_$_GamepadButtonCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
