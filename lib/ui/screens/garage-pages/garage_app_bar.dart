import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/ui/screens/garage-pages/garage_status_bar.dart';
import 'package:mirv/ui/screens/garage_status_page.dart';

class GarageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GarageAppBar({
    Key? key,
    required this.garageMetricsObs,
    this.width = 500,
  }) : super(key: key);
  final double width;
  final Rx<GarageMetrics?> garageMetricsObs;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Obx(() => Align(
              alignment: Alignment.centerLeft,
              child: GarageStatusBar(
                garageMetrics: garageMetricsObs.value,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: AspectRatio(aspectRatio: 1.5, child: Obx(() => StatusPageGarage(garageMetricsObs.value))),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          return Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      )
                    ],
                  );
                },
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(secondaryColor)),
              child: const Text(
                " Status ",
                textScaleFactor: 2.5,
              ),
            ),
          ),
        ]);
  }
}
