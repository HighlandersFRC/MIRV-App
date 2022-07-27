import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/ui/screens/garage-pages/garage_status_bar.dart';
import 'package:mirv/ui/screens/garage_status_page.dart';

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
              content: AspectRatio(aspectRatio: 1.5, child: StatusPageGarage(garageMetrics)),
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