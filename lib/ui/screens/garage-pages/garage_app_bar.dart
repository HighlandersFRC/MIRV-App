import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_position.dart';
import 'package:mirv/models/rover_state_type.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:mirv/ui/screens/garage-pages/garage_status_bar.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:mirv/ui/screens/rover_status_page.dart';

class GarageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GarageAppBar({Key? key, required this.garageMetrics}) : super(key: key);
  final GarageMetrics garageMetrics;


  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GarageStatusBar(garageMetrics: garageMetrics),
      ),
      ElevatedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const AspectRatio(aspectRatio: 1.5, child: StatusPage()),
              actions: [
                TextButton(
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                  child: const Text('Close'),
                )
              ],
            );
          },
        ),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
        child: const Text(
          " Status ",
          textScaleFactor: 2.5,
        ),
      )
    ]);
  }
}
