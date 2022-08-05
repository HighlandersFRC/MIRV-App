import 'package:flutter/material.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

class PiLitCommandList extends StatelessWidget {
  const PiLitCommandList({
    Key? key,
    required this.sendCommand,
  }) : super(key: key);
  final Function(RoverCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: piLitCommandsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 2),
            child: ListTile(
              title: Text(piLitCommandsList[index].last),
              onTap: () {
                sendCommand(piLitCommandsList[index].first);
              },
            ),
          );
        });
  }
}
