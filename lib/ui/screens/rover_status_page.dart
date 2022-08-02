import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mirv/models/device_health.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/ui/screens/webrtc_connection.dart';

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
        HealthContainer(roverMetrics.subsystems.sensors, "Sensors"),
        HealthContainer(roverMetrics.subsystems.electronics, "Electronics"),
        HealthContainer(roverMetrics.subsystems.drivetrain, "Drivetrain"),
        HealthContainer(roverMetrics.subsystems.garage, "Garage"),
        HealthContainer(roverMetrics.subsystems.intake, "Intake"),
        HealthContainer(roverMetrics.subsystems.power, "Power"),
        HealthContainer(roverMetrics.subsystems.general, "General"),
      ],
    );
  }
}

class HealthContainer extends StatelessWidget {
  late DeviceHealth subsystemHealth;
  late final DeviceHealthType deviceHealthType = subsystemHealth.health;

  final String name;
  HealthContainer(this.subsystemHealth, this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.dialog(AlertDialog(
              title: Text('$name Status'),
              content: Text(subsystemHealth.details != null
                  ? 'Health: ${subsystemHealth.health.toString().replaceAll('DeviceHealthType.', '')} \n \n Details: ${subsystemHealth.details}'
                  : 'Health: ${subsystemHealth.health.toString().replaceAll('DeviceHealthType.', '')}'),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Close')),
              ],
            ));
          },
          style: ButtonStyle(
            backgroundColor: deviceHealthType.color1,
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
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
      ],
    );
  }
}
