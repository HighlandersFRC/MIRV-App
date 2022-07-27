import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';

class GarageCommandList extends StatelessWidget {
  const GarageCommandList({
    Key? key,
    required this.garageMetrics,
    required this.sendCommand,
  }) : super(key: key);
  final GarageMetrics garageMetrics;
  final Function(String, GarageCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    var garageCommandList = garageCommandsByState[GarageStateType.retracted_latched];
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
                color: const Color.fromRGBO(50, 50, 50, 0.5),
              ),
              child: ListTile(
                  title: IconButton(
                icon: garageCommandList[index].last,
                iconSize: 70,
                onPressed: () {
                  sendCommand(garageMetrics.garage_id, garageCommandList[index].first);
                },
              )),
            ),
          ),
        );
      },
    );
  }
}
