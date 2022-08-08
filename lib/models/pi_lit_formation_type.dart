import 'package:mirv/models/rover_control/rover_command.dart';

enum PiLitFormationType { taper_right_3, taper_left_3, taper_right_5, taper_left_5, spear_7 }

extension PiLitFormationType1 on PiLitFormationType {
  int get piLitsRequired {
    switch (this) {
      case PiLitFormationType.taper_right_5:
        return 5;
      case PiLitFormationType.taper_left_5:
        return 5;
      case PiLitFormationType.spear_7:
        return 7;
      case PiLitFormationType.taper_right_3:
        return 3;
      case PiLitFormationType.taper_left_3:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case PiLitFormationType.spear_7:
        return 'spear_7';

      case PiLitFormationType.taper_right_5:
        return 'taper_right_5';
      case PiLitFormationType.taper_left_5:
        return 'taper_left_5';
      case PiLitFormationType.taper_right_3:
        return 'Reverse taper_left_5';
      case PiLitFormationType.taper_left_3:
        return 'taper_left_3';
    }
  }

  RoverCommand get command {
    switch (this) {
      case PiLitFormationType.spear_7:
        return RoverPiLitFormationCommands.spear_7;

      case PiLitFormationType.taper_right_5:
        return RoverPiLitFormationCommands.taper_right_5;
      case PiLitFormationType.taper_left_5:
        return RoverPiLitFormationCommands.taper_left_5;
      case PiLitFormationType.taper_right_3:
        return RoverPiLitFormationCommands.taper_right_3;
      case PiLitFormationType.taper_left_3:
        return RoverPiLitFormationCommands.taper_left_3;
    }
  }
}
