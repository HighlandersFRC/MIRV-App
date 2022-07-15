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

  @override
  Widget build(BuildContext context) {
    //hard Coded state
    var commandList = roverCommandsByState[roverMetrics?.state];
    return Container(
        child: roverMetrics != null
            ? ListView.builder(
                itemCount: commandList!.length,
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
