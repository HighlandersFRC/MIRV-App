import 'package:flutter/material.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';

class CommandList extends StatelessWidget {
  const CommandList({
    Key? key,
    required this.roverMetrics,
    required this.sendCommand,
  }) : super(key: key);
  final RoverMetrics? roverMetrics;
  final Function(RoverCommand) sendCommand;

  List<String> _stateListCommands(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
        return <String>[];
      case RoverStateType.docked:
        return <String>['Undock'];
      case RoverStateType.eStop:
        return <String>[]; //hexagon?
      case RoverStateType.remoteOperation:
        return <String>['Disable', 'Reset', 'Intake', 'Store', 'Deposit', 'Switch Left', 'Switch Right'];
    }
  }

  @override
  Widget build(BuildContext context) {
    //hard Coded state
    var commandList = roverCommandsByState[RoverStateType.remoteOperation]!;
    return Container(
        child: roverMetrics != null
            ? ListView.builder(
                itemCount: commandList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: ElevatedButton(
                    child: Text(commandList[index].last),
                    onPressed: () {
                      sendCommand(commandList[index].first);
                    },
                  ));
                },
              )
            : null);
  }
}
