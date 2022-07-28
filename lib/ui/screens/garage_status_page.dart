import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/rover/rover_health_type.dart';

class StatusPageGarage extends StatelessWidget {
  final GarageMetrics garageMetrics;
  const StatusPageGarage(this.garageMetrics, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 50,
      mainAxisSpacing: 100,
      crossAxisCount: 4,
      children: <Widget>[
        HealthContainer(garageMetrics.health.motor_controllers, "General"),
      ],
    );
  }
}

class HealthContainer extends StatelessWidget {
  late final DeviceHealthType roverHealthType;
  final String name;
  HealthContainer(DeviceHealthType? roverHealthTypeTemp, this.name, {Key? key}) : super(key: key) {
    roverHealthType = roverHealthTypeTemp ?? DeviceHealthType.unavailable;
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
            ],
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomLeft,
              colors: [
                roverHealthType.color4,
                roverHealthType.color3,
                roverHealthType.color2,
                roverHealthType.color1,
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
              overlayColor: MaterialStateProperty.all(roverHealthType.color5),
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
