import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirv/models/camera_modes.dart';
import 'package:mirv/models/device_location.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/pi_lit_formation_type.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/drive_to_position-widgets/drive_to_position_dialog.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/pi_lit_controll_dialog/pi_lit_dialog.dart';
import 'package:mirv/ui/screens/webrtc_connection.dart';

part 'rover_command.freezed.dart';
part 'rover_command.g.dart';

@freezed
class RoverCommand with _$RoverCommand {
  const factory RoverCommand(
    RoverSubsystemType subsystem,
    RoverCommandType command, {
    String? client_id,
    RoverCommandParameters? commandParameters,
  }) = _RoverCommand;

  factory RoverCommand.fromJson(Map<String, dynamic> json) => _$RoverCommandFromJson(json);
}

@freezed
class RoverCommandParameters with _$RoverCommandParameters {
  const factory RoverCommandParameters.drivetrain(double x, double y) = RoverCommandParametersDrivetrain;
  const factory RoverCommandParameters.destination(double lat, double long) = RoverCommandParametersDestination;
  const factory RoverCommandParameters.numberPiLitsOverride(int piLitsLeft, int piLitsRight) = RoverCommandParametersPiLit;
  // const factory RoverCommandParameters.piLitPlacementFormation(DeviceLocation location, PiLitFormationType formation, double heading) =
  //     RoverCommandParametersPiLitPlacement;
  const factory RoverCommandParameters.piLitPlacement(
          DeviceLocation location, PiLitFormationType formation, double heading, List<DeviceLocation> locations) =
      RoverCommandParametersPiLitPlacement;
  const factory RoverCommandParameters.switchCamera(CameraType camera) = RoverCommandParametersCamera;

  factory RoverCommandParameters.fromJson(Map<String, dynamic> json) => _$RoverCommandParametersFromJson(json);
}

class RoverGeneralCommands {
  static const eStop = RoverCommand(RoverSubsystemType.general, RoverCommandType.e_stop);
  static const disable = RoverCommand(RoverSubsystemType.general, RoverCommandType.disable);
  static const enable = RoverCommand(RoverSubsystemType.general, RoverCommandType.enable);
  static const deploy = RoverCommand(RoverSubsystemType.general, RoverCommandType.deploy);
  static const cancel = RoverCommand(RoverSubsystemType.general, RoverCommandType.cancel);
  static const stow = RoverCommand(RoverSubsystemType.general, RoverCommandType.stow);
  static const retrievePiLits = RoverCommand(RoverSubsystemType.general, RoverCommandType.retrieve_pi_lits);
  static const enableRemoteOperation = RoverCommand(RoverSubsystemType.general, RoverCommandType.enable_remote_operation);
  static const disableRemoteOperation = RoverCommand(RoverSubsystemType.general, RoverCommandType.disable_remote_operation);
  // static RoverCommand deployPiLitFormation(PiLitFormationType formation, DeviceLocation location, double heading) {
  //   return RoverCommand(RoverSubsystemType.general, RoverCommandType.deploy_pi_lits,
  //       commandParameters: RoverCommandParametersPiLitPlacement(location, formation, heading));
  // }
  static RoverCommand deployPiLits(
      DeviceLocation location, PiLitFormationType formation, double heading, List<DeviceLocation> locations) {
    return RoverCommand(RoverSubsystemType.general, RoverCommandType.deploy_pi_lits,
        commandParameters: RoverCommandParametersPiLitPlacement(location, formation, heading, locations));
  }
}

class RoverHeartbeatCommands {
  static const heartbeat = RoverCommand(RoverSubsystemType.heartbeat, RoverCommandType.heartbeat);
}

class RoverIntakeCommands {
  static const placeOnePiLit = RoverCommand(RoverSubsystemType.intake, RoverCommandType.place_1_pi_lit);
  static const pickupOnePiLit = RoverCommand(RoverSubsystemType.intake, RoverCommandType.pickup_1_pi_lit);
  static const unloadPiLits = RoverCommand(RoverSubsystemType.intake, RoverCommandType.unload_pi_lits);
  static const loadPiLits = RoverCommand(RoverSubsystemType.intake, RoverCommandType.load_pi_lits);
  static const deployIntake = RoverCommand(RoverSubsystemType.intake, RoverCommandType.deploy_intake);
  static const retractIntake = RoverCommand(RoverSubsystemType.intake, RoverCommandType.retract_intake);
}

class RoverPiLitCommands {
  static const idle = RoverCommand(RoverSubsystemType.pi_lit, RoverCommandType.idle);
  static const wave = RoverCommand(RoverSubsystemType.pi_lit, RoverCommandType.wave);
  static const waveReverse = RoverCommand(RoverSubsystemType.pi_lit, RoverCommandType.wave_reverse);
  static const simultaneous = RoverCommand(RoverSubsystemType.pi_lit, RoverCommandType.simultaneous);
  static RoverCommand setNumberPiLits(int piLitsLeft, int piLitsRight) => RoverCommand(
        RoverSubsystemType.pi_lit,
        RoverCommandType.set_number_pi_lits,
        commandParameters: RoverCommandParametersPiLit(piLitsLeft, piLitsRight),
      );
}

class RoverCameraCommands {
  static const switchWebcamFront = RoverCommand(RoverSubsystemType.camera, RoverCommandType.switch_camera,
      commandParameters: RoverCommandParameters.switchCamera(CameraType.webcam_front));
  static const switchVisionFront = RoverCommand(RoverSubsystemType.camera, RoverCommandType.switch_camera,
      commandParameters: RoverCommandParameters.switchCamera(CameraType.vision_front));
  static const switchVisionBack = RoverCommand(RoverSubsystemType.camera, RoverCommandType.switch_camera,
      commandParameters: RoverCommandParameters.switchCamera(CameraType.vision_back));
}

class RoverDrivetrainCommands {
  static RoverCommand drivetrainCommand(double x, double y) {
    return RoverCommand(RoverSubsystemType.drivetrain, RoverCommandType.arcade,
        commandParameters: RoverCommandParameters.drivetrain(x, y));
  }

  static RoverCommand destinationCommand(double lat, double long) {
    return RoverCommand(RoverSubsystemType.drivetrain, RoverCommandType.to_location,
        commandParameters: RoverCommandParameters.destination(lat, long));
  }
}

Map<RoverStateType, List<Pair<Function(WebRTCConnection, BuildContext), Widget>>> roverCommandsByState = {
  // Pair(RoverStateType.disconnected, false): [],
  // Pair(RoverStateType.e_stop, false): [],
  // Pair(RoverStateType.disconnected_fault, false): [],
  // Pair(RoverStateType.disabled, false): [],
  // Pair(RoverStateType.connected_fault, false): [],
  RoverStateType.idle: [
    Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.stow), Image.asset('assets/images/home.png')),
    Pair((connection, context) => PiLitDialogButton(connection.roverMetricsObs, connection.sendRoverCommand).piLitDialog(context),
        Image.asset('assets/images/pi_lit_outline_down.png')),
    Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.retrievePiLits),
        Image.asset('assets/images/pi_lit_outline_up.png')),
    Pair(
        (connection, context) =>
            DriveToPositionDialog(connection.roverMetricsObs, connection.sendRoverCommand).piLitDialog(context),
        const Icon(Icons.gps_fixed, size: 80, color: Colors.white)),
  ],
  RoverStateType.docked: [
    Pair(
        (connection, context) => connection.sendRoverCommand(RoverGeneralCommands.deploy), Image.asset('assets/images/ramp.png')),
  ],
  RoverStateType.autonomous: [
    Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.cancel),
        Image.asset('assets/images/cancel.png')),
  ],
  RoverStateType.remote_operation: [
    Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.disableRemoteOperation),
        Image.asset('assets/images/cancel.png')),
    Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.placeOnePiLit),
        Image.asset('assets/images/pi_lit_outline_down_1.png')),
    Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.pickupOnePiLit),
        Image.asset('assets/images/pi_lit_outline_up_1.png')),
  ],
  RoverStateType.remote_operation_autonomous: [
    Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.cancel),
        Image.asset('assets/images/cancel.png')),
  ],
};

List<Pair<Function(WebRTCConnection, BuildContext), Widget>> allRoverCommands = [
  Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.retractIntake), const Text('Retract Intake')),
  Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.deployIntake), const Text('Deploy Intake')),
  Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.loadPiLits), const Text('Manually Load Pi-Lits')),
  Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.unloadPiLits),
      const Text('Manually Un-load Pi-Lits')),
  Pair((connection, context) {
    String? garageId = connection.roverMetricsObs.value.garage?.garage_id;
    if (garageId != null) {
      connection.mirvApi.sendGarageCommand(garageId, GarageCommands.retract);
    }
  }, const Text('Retract Garage')),
  Pair((connection, context) {
    String? garageId = connection.roverMetricsObs.value.garage?.garage_id;
    if (garageId != null) {
      connection.mirvApi.sendGarageCommand(garageId, GarageCommands.deploy);
    }
  }, const Text('Deploy Garage')),
  Pair((connection, context) {
    String? garageId = connection.roverMetricsObs.value.garage?.garage_id;
    if (garageId != null) {
      connection.mirvApi.sendGarageCommand(garageId, GarageCommands.lightsOn);
    }
  }, const Text('Turn On Garage Lights')),
  Pair((connection, context) {
    String? garageId = connection.roverMetricsObs.value.garage?.garage_id;
    if (garageId != null) {
      connection.mirvApi.sendGarageCommand(garageId, GarageCommands.lightsOff);
    }
  }, const Text('Turn Off Garage Lights')),
  Pair((connection, context) => connection.sendRoverCommand(RoverPiLitCommands.idle), const Text('Set PiLits Lights to idle')),
  Pair((connection, context) => connection.sendRoverCommand(RoverPiLitCommands.simultaneous),
      const Text('Set PiLits Lights to sequential')),
  Pair((connection, context) => connection.sendRoverCommand(RoverPiLitCommands.wave),
      const Text('Set PiLits Lights to Reverse Sequential')),
  Pair((connection, context) => connection.sendRoverCommand(RoverPiLitCommands.waveReverse),
      const Text('Set PiLits Lights to parallel')),
  Pair((connection, context) {
    var dialog = DriveToPositionDialog(connection.roverMetricsObs, connection.sendRoverCommand);
    dialog.piLitDialog(context);
  }, const Text('Set PiLits Lights to parallel')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.retrievePiLits), const Text('Retrieve PiLits')),
  Pair((connection, context) {
    var dialog = PiLitDialogButton(connection.roverMetricsObs, connection.sendRoverCommand);
    dialog.piLitDialog(context);
  }, const Text('Deploy PiLits')),
  Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.placeOnePiLit), const Text('Place One PiLit')),
  Pair((connection, context) => connection.sendRoverCommand(RoverIntakeCommands.pickupOnePiLit), const Text('Pickup One PiLit')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.eStop), const Text('Emergency Stop')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.disable), const Text('Disable')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.enable), const Text('Enable')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.deploy), const Text('Emergency Stop')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.cancel), const Text('Cancel')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.stow), const Text('Stow')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.disable), const Text('Disable')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.enableRemoteOperation),
      const Text('Enable Remote Operation')),
  Pair((connection, context) => connection.sendRoverCommand(RoverGeneralCommands.disableRemoteOperation),
      const Text('Disable Remote Operation')),
];

// List<Pair<RoverCommand, String>> allRoverCommands = [
//   Pair(RoverIntakeCommands.placeOnePiLit, 'Place One PiLit'),
//   Pair(RoverIntakeCommands.pickupOnePiLit, 'Pickup One PiLit'),
//   Pair(RoverGeneralCommands.eStop, 'Emergency Stop'),
//   Pair(RoverGeneralCommands.disable, 'Disable'),
//   Pair(RoverGeneralCommands.enable, 'Enable'),
//   Pair(RoverGeneralCommands.deploy, 'Emergency Stop'),
//   Pair(RoverGeneralCommands.cancel, 'Cancel'),
//   Pair(RoverGeneralCommands.stow, 'Stow'),
//   Pair(RoverGeneralCommands.retrievePiLits, 'Retrieve PiLits'),
//   Pair(RoverGeneralCommands.deployPiLits(PiLitFormationType.taper_right_5, DeviceLocation(lat: 40.473951, long: -104.969730), 45),
//       'Retrieve PiLits'),
//   Pair(RoverGeneralCommands.enableRemoteOperation, 'Enable Remote Operation'),
//   Pair(RoverGeneralCommands.disableRemoteOperation, 'Disable Remote Operation'),
//   Pair(RoverGarageCommands.lock, 'Lock Garage'),
//   Pair(RoverGarageCommands.unlock, 'Unlock Garage'),
//   Pair(RoverGarageCommands.retract, 'Retract Garage'),
//   Pair(RoverGarageCommands.deploy, 'Deploy Garage'),
//   Pair(RoverGarageCommands.lightsOn, 'Turn on Garage Lights'),
//   Pair(RoverGarageCommands.lightsOff, 'Turn off Garage Lights'),
//   Pair(RoverPiLitCommands.idle, 'Set PiLits Lights to idle'),
//   Pair(RoverPiLitCommands.setNumberPiLits(4, 4), 'Set Number of Stored PiLits to 8'),
//   Pair(RoverPiLitCommands.simultaneous, 'Set PiLits Lights to sequential'),
//   Pair(RoverPiLitCommands.wave, 'Set PiLits Lights to Reverse Sequential'),
//   Pair(RoverPiLitCommands.waveReverse, 'Set PiLits Lights to parallel'),
// ];
