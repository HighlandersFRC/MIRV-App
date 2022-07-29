import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mirv/models/rover_health_type.dart';
import 'package:mirv/models/rover_metrics.dart';

class StatusPage extends StatelessWidget {
  final RoverMetrics? roverMetrics;
  const StatusPage(this.roverMetrics, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 50,
      mainAxisSpacing: 100,
      crossAxisCount: 4,
      children: <Widget>[
        HealthContainer(roverMetrics?.health.sensors, "Sensors"),
        HealthContainer(roverMetrics?.health.electronics, "Electronics"),
        HealthContainer(roverMetrics?.health.drivetrain, "Drivetrain"),
        HealthContainer(roverMetrics?.health.garage, "Garage"),
        HealthContainer(roverMetrics?.health.intake, "Intake"),
        HealthContainer(roverMetrics?.health.power, "Power"),
        HealthContainer(roverMetrics?.health.general, "General"),
      ],
    );
  }
}

class HealthContainer extends StatelessWidget {
  late final RoverHealthType roverHealthType;
  final RoverMetrics? roverMetrics;

  final String name;
  HealthContainer(RoverHealthType? roverHealthTypeTemp, this.name, {Key? key, this.roverMetrics}) : super(key: key) {
    roverHealthType = roverHealthTypeTemp ?? RoverHealthType.unavailable;
  }

  @override
  Widget build(BuildContext context) {
    // var healthWidgetList = <Widget>[HealthContainer(roverMetrics?.health, name)];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //   Container(
        // height: 150,
        // width: 1500,
        //     padding: const EdgeInsets.only(top: 0),
        //     color: Colors.green,
        //     child:

        ElevatedButton(
          onPressed: () {
            Get.dialog(AlertDialog(
              title: Text('$name Status'),
              content: Text('Rover is ${roverHealthType.toString().replaceAll('RoverHealthType.', '')}.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Close')),
              ],
            ));

            // if (HealthContainer == HealthContainer(roverMetrics?.health.sensors, 'sensors')) {
            //   Get.dialog(AlertDialog(
            //     title: const Text('Sensor Status'),
            //     content: Text('Rover is ${roverHealthType.toString()}'),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: const Text('Close')),
            //     ],
            //   ));
            // } else if (HealthContainer == roverMetrics?.health.electronics) {
            //   Get.dialog(AlertDialog(
            //     title: const Text('Electronic Status'),
            //     content: Text('Rover is ${roverHealthType.toString()}'),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: const Text('Close')),
            //     ],
            //   ));
            // } else if (HealthContainer == roverMetrics?.health.drivetrain) {
            //   Get.dialog(AlertDialog(
            //     title: const Text('Drivetrain Status'),
            //     content: Text('Rover is ${roverHealthType.toString()}'),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: const Text('Close')),
            //     ],
            //   ));
            // } else if (HealthContainer == roverMetrics?.health.garage) {
            //   Get.dialog(AlertDialog(
            //     title: const Text('Garage Status'),
            //     content: Text('Rover is ${roverHealthType.toString()}'),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: const Text('Close')),
            //     ],
            //   ));
            // } else if (HealthContainer == roverMetrics?.health.intake) {
            //   Get.dialog(AlertDialog(
            //     title: const Text('Intake Status'),
            //     content: Text('Rover is ${roverHealthType.toString()}'),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: const Text('Close')),
            //     ],
            //   ));
            // } else if (HealthContainer == roverMetrics?.health.power) {
            //   Get.dialog(AlertDialog(
            //     title: const Text('Power Status'),
            //     content: Text('Rover is ${roverHealthType.toString()}'),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: const Text('Close')),
            //     ],
            //   ));
            // } else if (HealthContainer ==roverMetrics?.health.general) {
            //    Get.dialog(AlertDialog(
            //     title: const Text('General Status'),
            //     content: Text('Rover is ${roverHealthType.toString()}'),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: const Text('Close')),
            //     ],
            //   ));
            // }
          },
          style: ButtonStyle(
            backgroundColor: roverHealthType.color1,
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(),
            ),
            fixedSize: MaterialStateProperty.all(
              const Size(150, 150),
            ),
            alignment: Alignment.center,
          ),
          child: Text(
            name,
          ),
        ),
        //   ),
      ],
    );
  }
}
