import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:test/models/rover_health_type.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
} // StatusPage

class HealthContainer extends StatelessWidget {
  final RoverHealthType roverHealthType;
  final String name;
  const HealthContainer(
      {Key? key, required this.roverHealthType, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    goTrouble() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TroubleShootingPage()),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 1500,
          padding: const EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.colorBurn,
            boxShadow: [
              BoxShadow(
                color: roverHealthType.color1,
                spreadRadius: -5,
                blurRadius: 20,
                offset: const Offset(-5, 5),
              ),
              const BoxShadow(
                  color: Color.fromARGB(255, 250, 250, 250),
                  offset: Offset(10, -10),
                  blurRadius: 55,
                  spreadRadius: 5),
            ], //boxShadow
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomLeft,
              colors: [
                roverHealthType.color4,
                roverHealthType.color3,
                roverHealthType.color2,
                roverHealthType.color1,
              ], //colors
            ),
            borderRadius: const BorderRadius.all(
              Radius.elliptical(30, 25),
            ),
          ),
          child: ElevatedButton(
            onPressed: goTrouble,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(30, 25),
                  ),
                ),
              ), //shape
              fixedSize: MaterialStateProperty.all(
                const Size(20, 20),
              ), //size
              overlayColor: MaterialStateProperty.all(roverHealthType.color5),
              alignment: Alignment.center,
              shadowColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 0, 0, 0),
              ), //overlay color
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 128, 123, 123),
              ), //background color
              foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 0, 0, 0),
              ), //foreground color
            ),
            child: Text(
              name,
              style: GoogleFonts.play(),
              textScaleFactor: 1.9,
            ),
          ),
        ),
      ], //children
    );
  } //build widget
} //Health Container

class _StatusPageState extends State<StatusPage> {
  RoverMetrics roverMetrics = const RoverMetrics();

  Timer? timer;

  final MirvApi _mirvApi = MirvApi();

  _updateMetrics() async {
    var roverMetricsTemp = await _mirvApi.getRoverMetrics("bruh");
    setState(
      () {
        roverMetrics = roverMetricsTemp;
      }, //honestly i dont know
    ); // setState
  } //_update Metrics

  @override
  void initState() {
    super.initState();
    _updateMetrics();
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (Timer t) {
        _updateMetrics();
      }, //Update metrics
    );
  } //initState

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  } //dispose

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rover Status"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 100,
        mainAxisSpacing: 100,
        crossAxisCount: 5,
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
  } //Build Widget
}//_Status page state
