import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mirv/icons/custom_icons_icons.dart';
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
        HealthContainer(roverMetrics.subsystems.sensors, "Sensors", Icons.sensors),
        HealthContainer(roverMetrics.subsystems.electronics, "Electronics", Icons.bolt),
        HealthContainer(roverMetrics.subsystems.drivetrain, "Drivetrain", CustomIcons.steering_wheel),
        HealthContainer(roverMetrics.subsystems.garage, "Garage", CustomIcons.warehouse),
        HealthContainer(roverMetrics.subsystems.intake, "Intake", Icons.rotate_90_degrees_ccw),
        HealthContainer(roverMetrics.subsystems.power, "Power", Icons.power),
        HealthContainer(roverMetrics.subsystems.general, "General", Icons.smart_toy_outlined),
      ],
    );
  }
}

class HealthContainer extends StatelessWidget {
  final DeviceHealth subsystemHealth;
  final String name;
  final IconData icon;
  HealthContainer(this.subsystemHealth, this.name, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Get.dialog(AlertDialog(
              title: Text('$name Status'),
              content: Text(subsystemHealth.details != null
                  ? ' Health: ${subsystemHealth.health.toString().replaceAll('DeviceHealthType.', '')} \n \n Details: ${subsystemHealth.details}'
                  : ' Health: ${subsystemHealth.health.toString().replaceAll('DeviceHealthType.', '')}'),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Close')),
              ],
            ));
          },
          label: Text(name),
          icon: Icon(icon),
          style: ButtonStyle(
            backgroundColor: subsystemHealth.health.color1,
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
        ),
      ],
    );
  }
}
