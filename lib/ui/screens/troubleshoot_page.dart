import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/rover_new_op_page.dart';

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
        title: const Text("Trouble Shooting"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.to(RoverOpPage());
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
                Get.to(StatusPage());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 0, 255, 17)),
              ),
              child: Text("go back", textScaleFactor: 20),
            ),
          ),
        ],
      ),
    );
  }
}
