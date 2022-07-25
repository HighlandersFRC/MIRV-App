import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/models/pair.dart';

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
    Map<GarageStateType?, List<Pair<GarageCommand, Image>>> garageCommandsByState = {
      GarageStateType.locked: [
        // Pair(.eStop, "E-Stop"),
        Pair(GarageGeneralCommands.unlock, Image.asset('assets/images/unlock.png')),
        // Pair( GarageGeneralCommands.cancel, "Cancel Current Command"),
      ],
      GarageStateType.unlocked: [
        // Pair( GarageGeneralCommands.eStop, "E-Stop"),
        Pair(GarageGeneralCommands.lock, Image.asset('assets/images/lock.png')),
        // Pair( GarageGeneralCommands.cancel, "Cancel Current Command"),
      ],
      GarageStateType.up: [
        Pair(GarageGeneralCommands.down, Image.asset('assets/images/down_arrow.png')),
      ],
      GarageStateType.down: [
        Pair(GarageGeneralCommands.up, Image.asset('assets/images/up_arrow.png')),
      ],
      null: [],
    };

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
