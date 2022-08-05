import 'package:flutter/material.dart';
import 'package:mirv/constants/theme_data.dart';

import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';

class GarageCommandList extends StatelessWidget {
  const GarageCommandList({
    Key? key,
    required this.garageMetrics,
    required this.sendCommand,
    required this.changeGarageState,
    required this.resetGarageState,
  }) : super(key: key);
  final GarageMetrics garageMetrics;
  final Function(String, GarageCommand) sendCommand;
  final Function(String, GarageCommand) changeGarageState;
  final Future<void> resetGarageState;

  @override
  Widget build(BuildContext context) {
    var garageCommandList = garageCommandsByState[garageMetrics.state];
    return ListView.builder(
      itemCount: garageCommandList!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(125, 82, 81, 81),
              ),
              child: ListTile(
                  title: IconButton(
                icon: garageCommandList[index].last,
                iconSize: 100,
                onPressed: () {
                  sendCommand(garageMetrics.garage_id, garageCommandList[index].first);
                  changeGarageState(garageMetrics.garage_id, garageCommandList[index].first);
                },
              )),
            ),
          ),
        );
      },
    );
  }
}
