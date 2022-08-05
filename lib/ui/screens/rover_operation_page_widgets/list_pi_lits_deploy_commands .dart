import 'package:flutter/material.dart';
import 'package:mirv/models/rover_control/rover_command.dart';

class PiLitDeployCommandList extends StatelessWidget {
  const PiLitDeployCommandList({
    Key? key,
    required this.sendCommand,
  }) : super(key: key);
  final Function(RoverCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: piLitDeployCommandsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 2),
          child: ListTile(
            title: Text(piLitDeployCommandsList[index].last),
            onTap: () {
              sendCommand(piLitDeployCommandsList[index].first);
            },
          ),
        );
      },
    );
  }
}
