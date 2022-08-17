import 'package:flutter/material.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/pi_lit_formation_type.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_control/rover_command_type.dart';

class TaskProgressIndicator extends StatelessWidget {
  final RoverGarageState currentState;
  final RoverGarageState initialState;
  final RoverCommand? currentCommand;

  const TaskProgressIndicator(this.currentState, this.initialState, this.currentCommand, {Key? key}) : super(key: key);

  String? getTaskName(RoverCommand? command) {
    switch (command?.command) {
      case RoverCommandType.deploy_pi_lits:
        return "Deploying Pi-Lits";
      case RoverCommandType.retrieve_pi_lits:
        return "Retrieving Pi-Lits";
      default:
        return null;
    }
  }

  Pair<double, String> getTaskProgress(RoverCommand command, RoverGarageState currentState, RoverGarageState initialState) {
    switch (command.command) {
      case RoverCommandType.deploy_pi_lits:
        RoverCommandParametersPiLitPlacement params = command.commandParameters as RoverCommandParametersPiLitPlacement;
        int piLitsGoal = params.formation.piLitsRequired;
        int deltaPiLitsStowed = initialState.pi_lits.numPiLitsStowed - currentState.pi_lits.numPiLitsStowed;
        double progress = deltaPiLitsStowed / piLitsGoal;
        return Pair(progress, "$deltaPiLitsStowed out of $piLitsGoal deployed");
      case RoverCommandType.retrieve_pi_lits:
        int piLitsGoal = initialState.pi_lits.deployed_pi_lits.length;
        int deltaPiLitsDeployed = initialState.pi_lits.deployed_pi_lits.length - currentState.pi_lits.deployed_pi_lits.length;
        double progress = deltaPiLitsDeployed / piLitsGoal;
        return Pair(progress, "$deltaPiLitsDeployed out of $piLitsGoal retrieved");
      default:
        return Pair(0.1, "Unknown");
    }
  }

  @override
  Widget build(BuildContext context) {
    String? taskName = getTaskName(currentCommand);
    if (taskName == null || currentState.state != RoverStateType.autonomous) {
      return const SizedBox();
    }
    Pair<double, String> progress = getTaskProgress(currentCommand!, currentState, initialState);
    // String taskName = "Deploying Pi-Lits";
    // Pair<double, String> progress = Pair(0.5, "3 out of 7 deployed");
    return Positioned(
      top: 10,
      height: 20,
      right: 0,
      left: 0,
      child: Stack(
        children: [
          LinearProgressIndicator(
            value: progress.first,
            minHeight: 20,
            color: const Color.fromARGB(255, 255, 153, 0),
            backgroundColor: const Color.fromARGB(148, 158, 158, 158),
          ),
          Center(child: Text("$taskName: ${progress.last}", style: const TextStyle(color: Colors.black))),
        ],
      ),
    );
  }
}
