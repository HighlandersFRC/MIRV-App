import 'package:flutter/material.dart';

import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/pair.dart';

class GarageCommandList extends StatelessWidget {
  const GarageCommandList({
    Key? key,
    required this.garageMetrics,
    required this.sendCommand,
  }) : super(key: key);
  final GarageMetrics? garageMetrics;
  final Function(String, GarageCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    var garageCommandList = garageCommandsByState[Pair(garageMetrics?.state, garageMetrics?.lights_on)] ?? [];
    return ListView.builder(
      itemCount: garageCommandList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color.fromARGB(125, 82, 81, 81),
              ),
              child: ListTile(
                  title: IconButton(
                padding: const EdgeInsets.all(3),
                icon: garageCommandList[index].last,
                iconSize: 300,
                onPressed: () {
                  sendCommand(garageMetrics!.garage_id, garageCommandList[index].first);
                },
              )),
            ),
          ),
        );
      },
    );
  }
}
