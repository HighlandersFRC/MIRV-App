import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';

void main() {
  test('testing rover command to json', () {
    final String result = json.encode(RoverGeneralCommands.eStop.toJson());
    print(result);
  });
  test('joystick command', () {
    final String result = json.encode(RoverDrivetrainCommands.drivetrainCommand(RoverCommandTypeDrivetrain.arcade, 0.5, 0.5));
    print(result);
  });
  test('joystick command', () {
    final String result = json.encode(RoverDrivetrainCommands.drivetrainCommand(RoverCommandTypeDrivetrain.arcade, 0.5, 0.5));
    print(result);
  });
}