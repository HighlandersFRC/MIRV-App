import 'dart:async';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mirv/models/rover_health_type.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/troubleshoot_page.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
} // StatusPage

class HealthContainer extends StatelessWidget {
  late RoverHealthType roverHealthType;
  final String name;
  HealthContainer(RoverHealthType? roverHealthTypeTemp, this.name, {Key? key}) : super(key: key) {
    roverHealthType = roverHealthTypeTemp ?? RoverHealthType.unavailable;
  }

  @override
  Widget build(BuildContext context) {
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
                  color: Color.fromARGB(255, 250, 250, 250), offset: Offset(10, -10), blurRadius: 55, spreadRadius: 5),
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
            onPressed: () {
              Get.to(const TroubleShootingPage());
            },
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
  RoverMetrics? roverMetrics;

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
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 50,
      mainAxisSpacing: 100,
      crossAxisCount: 4,
      children: <Widget>[
        HealthContainer(roverMetrics?.health.sensors, "sensors"),
        HealthContainer(roverMetrics?.health.electronics, "electronics"),
        HealthContainer(roverMetrics?.health.drivetrain, "drivetrain"),
        HealthContainer(roverMetrics?.health.garage, "garage"),
        HealthContainer(roverMetrics?.health.intake, "intake"),
        HealthContainer(roverMetrics?.health.power, "power"),
        HealthContainer(roverMetrics?.health.general, "general"),
      ],
    );
  } //Build Widget
}//_Status page state
