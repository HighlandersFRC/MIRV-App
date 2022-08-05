import 'package:mirv/models/rover_control/rover_command.dart';

enum PiLitDeployStateType { piLit7Spear, piLit5Taper, piLit3Type1, piLit3Type2, piLit3Type3 }

extension PiLitDeployStateType1 on PiLitDeployStateType {
  String get name {
    switch (this) {
      case PiLitDeployStateType.piLit7Spear:
        return 'piLit7Spear';

      case PiLitDeployStateType.piLit5Taper:
        return 'piLit5Taper';
      case PiLitDeployStateType.piLit3Type1:
        return 'piLit3Type1';
      case PiLitDeployStateType.piLit3Type2:
        return 'Reverse piLit3Type1';
      case PiLitDeployStateType.piLit3Type3:
        return 'piLit3Type3';
    }
  }

  RoverCommand get command {
    switch (this) {
      case PiLitDeployStateType.piLit7Spear:
        return RoverPiLitDeployCommands.piLit7Spear;

      case PiLitDeployStateType.piLit5Taper:
        return RoverPiLitDeployCommands.piLit5Taper;
      case PiLitDeployStateType.piLit3Type1:
        return RoverPiLitDeployCommands.piLit3Type1;
      case PiLitDeployStateType.piLit3Type2:
        return RoverPiLitDeployCommands.piLit3Type2;
      case PiLitDeployStateType.piLit3Type3:
        return RoverPiLitDeployCommands.piLit3Type3;
    }
  }
}
