import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

class GarageCommandList extends StatelessWidget {
   GarageCommandList({
    Key? key,
    required this.state,
    required this.sendCommand,
  }) : super(key: key);
  late final GarageStateType? state;
  final Function(GarageCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    var garageCommandList = garageCommandsByState[state];
    return Container(
        child: state != null
            ? ListView.builder(
                itemCount: garageCommandList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromRGBO(50, 50, 50, 0.5),
                      ),
                      child: ListTile(
                          title: IconButton(
                        icon: garageCommandList[index].last,
                        iconSize: 70,
                        onPressed: () {
                          sendCommand(garageCommandList[index].first);
                        },
                      )),
                    ),
                  );
                },
              )
            : null);
  }
}
