import 'package:mirv/models/rover_control/rover_command.dart';

enum PiLitStateType { off, idle, sequential, sequential_reverse, parallel }

extension PiLitStateType1 on PiLitStateType {
  String get name {
    switch (this) {
      case PiLitStateType.off:
        return 'Off';

      case PiLitStateType.idle:
        return 'Idle';
      case PiLitStateType.sequential:
        return 'Sequential';
      case PiLitStateType.sequential_reverse:
        return 'Reverse Sequential';
      case PiLitStateType.parallel:
        return 'Parallel';
    }
  }

  RoverCommand get command {
    switch (this) {
      case PiLitStateType.off:
        return RoverPiLitCommands.off;
      case PiLitStateType.idle:
        return RoverPiLitCommands.idle;
      case PiLitStateType.sequential:
        return RoverPiLitCommands.sequential;
      case PiLitStateType.sequential_reverse:
        return RoverPiLitCommands.reverseSequential;
      case PiLitStateType.parallel:
        return RoverPiLitCommands.parallel;
    }
  }
}
