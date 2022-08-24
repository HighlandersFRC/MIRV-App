// ignore_for_file: constant_identifier_names

import 'package:mirv/models/rover_control/rover_command.dart';

enum PiLitStateType { no_pi_lits, idle, wave, wave_reverse, simultaneous }

extension PiLitStateType1 on PiLitStateType {
  String get name {
    switch (this) {
      case PiLitStateType.no_pi_lits:
        return 'No Pi Lits';
      case PiLitStateType.idle:
        return 'Idle';
      case PiLitStateType.wave:
        return 'Wave';
      case PiLitStateType.wave_reverse:
        return 'Wave Reverse';
      case PiLitStateType.simultaneous:
        return 'Simultaneous';
    }
  }

  RoverCommand? get command {
    switch (this) {
      case PiLitStateType.idle:
        return RoverPiLitCommands.idle;
      case PiLitStateType.wave:
        return RoverPiLitCommands.wave;
      case PiLitStateType.wave_reverse:
        return RoverPiLitCommands.waveReverse;
      case PiLitStateType.simultaneous:
        return RoverPiLitCommands.simultaneous;
      default:
        return null;
    }
  }

  bool get enable {
    switch (this) {
      case PiLitStateType.no_pi_lits:
        return false;
      default:
        return true;
    }
  }
}
