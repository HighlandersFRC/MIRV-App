import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:mirv/ui/screens/rover_operation_page.dart';
import 'package:mirv/ui/screens/rover_status_page.dart';

class TroubleShootingPage extends StatefulWidget {
  const TroubleShootingPage({Key? key}) : super(key: key);

  @override
  State<TroubleShootingPage> createState() => _TroubleShootingPageState();
} //TroubleShotingPage

class _TroubleShootingPageState extends State<TroubleShootingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppThemeColor.foregroundColor,
        shadowColor: AppThemeColor.shadowColor,
        backgroundColor: AppThemeColor.backgroundColor,
        title: const Text("Trouble Shooting"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.to(RoverOperationPage(RoverMetrics(rover_id: "temp")));
              },
              child: const Icon(Icons.drive_eta))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 2000,
            height: 720,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const StatusPage());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 255, 17)),
              ),
              child: const Text("go back", textScaleFactor: 20),
            ),
          ),
        ],
      ),
    );
  }
}
