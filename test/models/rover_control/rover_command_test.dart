// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/pi_lit_formation_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:test/test.dart';

void main() {
  test('Rover Command Examples', () {
    print("----------------- RoverGeneralCommands -----------------");
    print("eStop: ${json.encode(RoverGeneralCommands.eStop.toJson())}");
    print("disable: ${json.encode(RoverGeneralCommands.disable.toJson())}");
    print("enable: ${json.encode(RoverGeneralCommands.enable.toJson())}");
    print("deploy: ${json.encode(RoverGeneralCommands.deploy.toJson())}");
    print("cancel: ${json.encode(RoverGeneralCommands.cancel.toJson())}");
    // print("stow: ${json.encode(RoverGeneralCommands.stow.toJson())}");
    print(
        "deployPiLits: ${json.encode(RoverGeneralCommands.deployPiLits(const DeviceLocation(lat: 39, long: -103.5), PiLitFormationType.taper_left_3, 45, [
          const DeviceLocation(lat: 39, long: -103.5)
        ]).toJson())}");
    print("retrievePiLits: ${json.encode(RoverGeneralCommands.retrievePiLits.toJson())}");
    print("enableRemoteOperation: ${json.encode(RoverGeneralCommands.enableRemoteOperation.toJson())}");
    print("disableRemoteOperation: ${json.encode(RoverGeneralCommands.disableRemoteOperation.toJson())}");

    print("----------------- RoverHeartbeatCommands -----------------");
    print("heartbeat: ${json.encode(RoverHeartbeatCommands.heartbeat.toJson())}");

    print("----------------- RoverIntakeCommands -----------------");
    print("pickupOnePiLit: ${json.encode(RoverIntakeCommands.pickupOnePiLit.toJson())}");
    print("placeOnePiLit: ${json.encode(RoverIntakeCommands.placeOnePiLit.toJson())}");

    print("----------------- RoverPiLitCommands -----------------");
    print("idle: ${json.encode(RoverPiLitCommands.idle.toJson())}");
    print("simultaneous: ${json.encode(RoverPiLitCommands.simultaneous.toJson())}");
    print("wave: ${json.encode(RoverPiLitCommands.wave.toJson())}");
    print("waveReverse: ${json.encode(RoverPiLitCommands.waveReverse.toJson())}");
    print("setNumberPiLits: ${json.encode(RoverPiLitCommands.setNumberPiLits(4, 4).toJson())}");

    print("----------------- RoverDrivetrainCommands -----------------");
    print("drivetrainCommand: ${json.encode(RoverDrivetrainCommands.drivetrainCommand(0.0, 0.0).toJson())}");

    print("----------------- RoverMovementCommands -----------------");
    print("movementCommand: ${json.encode(RoverDrivetrainCommands.destinationCommand(39, -105).toJson())}");

    print("----------------- RoverCameraCommands -----------------");
    print("switchWebcamFront: ${json.encode(RoverCameraCommands.switchWebcamFront)}");
    print("switchVisionFront: ${json.encode(RoverCameraCommands.switchVisionFront)}");
    print("switchVisionBack: ${json.encode(RoverCameraCommands.switchVisionBack)}");
  });
}
