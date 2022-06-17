import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test/models/rover_health_type.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class HealthContainer extends StatelessWidget {
  final RoverHealthType roverHealthType;
  final String name;
  const HealthContainer(
      {Key? key, required this.roverHealthType, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 70),
      child: Text(
        name,
        textAlign: TextAlign.center,
        textScaleFactor: 5,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 25,
            offset: const Offset(-15, 15),
          ),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(55, -55),
              blurRadius: 15,
              spreadRadius: 1),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            roverHealthType.colorBack,
            roverHealthType.colorBack,
            roverHealthType.colorBack,
            roverHealthType.colorBack,
          ],
        ),
        //ervuneiruvnaseruv
        color: roverHealthType.colorBack,
        border: Border(
            top: BorderSide(
              width: 40,
              color: roverHealthType.colors,
            ),
            left: BorderSide(
              width: 40,
              color: roverHealthType.colors,
            ),
            bottom: BorderSide(
              width: 40,
              color: roverHealthType.colors,
            ),
            right: BorderSide(
              width: 40,
              color: roverHealthType.colors,
            )),
        borderRadius: const BorderRadius.all(
          Radius.elliptical(200, 100),
        ),
      ),
    );
  }
}

class _StatusPageState extends State<StatusPage> {
  RoverMetrics roverMetrics = RoverMetrics();

  Timer? timer;

  MirvApi _mirvApi = MirvApi();

  _updateMetrics() async {
    var roverMetricsTemp = await _mirvApi.getRoverMetrics("bruh");
    setState(
      () {
        roverMetrics = roverMetricsTemp;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _updateMetrics();
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer t) {
        _updateMetrics();
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rover Status"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 100,
        mainAxisSpacing: 100,
        crossAxisCount: 3,
        children: <Widget>[
          HealthContainer(
              roverHealthType: roverMetrics.health.sensors, name: "sensors"),
          HealthContainer(
              roverHealthType: roverMetrics.health.electronics,
              name: "electronics"),
          HealthContainer(
              roverHealthType: roverMetrics.health.drivetrain,
              name: "drivetrain"),
          HealthContainer(
              roverHealthType: roverMetrics.health.garage, name: "garage"),
          HealthContainer(
              roverHealthType: roverMetrics.health.intake, name: "intake"),
          HealthContainer(
              roverHealthType: roverMetrics.health.power, name: "power"),
          HealthContainer(
              roverHealthType: roverMetrics.health.general, name: "general"),
        ],
      ),
    );
  }
}
