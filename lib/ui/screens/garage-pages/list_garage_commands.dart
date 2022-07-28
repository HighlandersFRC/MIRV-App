import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/services/mirv_api.dart';

class GarageCommandList extends StatelessWidget {
  GarageCommandList({
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
  late MirvApi _mirvGarageApi = MirvApi();

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
                color: const Color.fromRGBO(50, 50, 50, 0.5),
              ),
              child: ListTile(
                  title: IconButton(
                icon: garageCommandList[index].last,
                iconSize: 70,
                onPressed: () {
                  sendCommand(garageMetrics.garage_id, garageCommandList[index].first);
                  changeGarageState(garageMetrics.garage_id, garageCommandList[index].first);
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
