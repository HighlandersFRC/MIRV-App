import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mirv/models/device_health.dart';
import 'package:mirv/models/rover/rover_metrics.dart';

class StatusPage extends StatelessWidget {
  final RoverMetrics roverMetrics;
  const StatusPage(this.roverMetrics, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 50,
      mainAxisSpacing: 100,
      crossAxisCount: 4,
      children: <Widget>[
        HealthContainer(roverMetrics.subsystems.sensors, "sensors"),
        HealthContainer(roverMetrics.subsystems.electronics, "electronics"),
        HealthContainer(roverMetrics.subsystems.drivetrain, "drivetrain"),
        HealthContainer(roverMetrics.subsystems.garage, "garage"),
        HealthContainer(roverMetrics.subsystems.intake, "intake"),
        HealthContainer(roverMetrics.subsystems.power, "power"),
        HealthContainer(roverMetrics.subsystems.general, "general"),
      ],
    );
  }
}

class HealthContainer extends StatelessWidget {
  late DeviceHealth subsystemHealth;
  final String name;
  HealthContainer(this.subsystemHealth, this.name, {Key? key}) : super(key: key);

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
                color: subsystemHealth.health.color1,
                spreadRadius: -5,
                blurRadius: 20,
                offset: const Offset(-5, 5),
              ),
              const BoxShadow(
                  color: Color.fromARGB(255, 250, 250, 250), offset: Offset(10, -10), blurRadius: 55, spreadRadius: 5),
            ],
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomLeft,
              colors: [
                subsystemHealth.health.color4,
                subsystemHealth.health.color3,
                subsystemHealth.health.color2,
                subsystemHealth.health.color1,
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.elliptical(30, 25),
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              // ignore: todo
              // TODO: Make these not buttons
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(30, 25),
                  ),
                ),
              ),
              fixedSize: MaterialStateProperty.all(
                const Size(20, 20),
              ),
              overlayColor: MaterialStateProperty.all(subsystemHealth.health.color5),
              alignment: Alignment.center,
              shadowColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 0, 0, 0),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 128, 123, 123),
              ),
              foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            child: Text(
              name,
              style: GoogleFonts.play(),
              textScaleFactor: 1.9,
            ),
          ),
        ),
      ],
    );
  }
}
