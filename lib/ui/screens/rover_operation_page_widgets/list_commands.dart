import 'package:flutter/material.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

class CommandList extends StatelessWidget {
  const CommandList({
    Key? key,
    required this.state,
    required this.sendCommand,
  }) : super(key: key);
  final RoverStateType? state;
  final Function(RoverCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    var commandList = roverCommandsByState[state];
    return Container(
        child: state != null
            ? ListView.builder(
                itemCount: commandList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromARGB(126, 74, 68, 68),
                      ),
                      child: ListTile(
                          title: IconButton(
                        icon: commandList[index].last,
                        iconSize: 70,
                        onPressed: () {
                          sendCommand(commandList[index].first);
                        },
                      )),
                    ),
                  );
                },
              )
            : null);
  }
}
