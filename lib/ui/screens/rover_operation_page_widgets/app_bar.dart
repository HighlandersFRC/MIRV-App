import 'package:flutter/material.dart';
import 'package:test/functions_copy_and_paste.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:test/ui/screens/rover_status_page.dart';

class OpPgAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OpPgAppBar({Key? key, required this.mirvApi}) : super(key: key);
  final MirvApi mirvApi;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    goStatus() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StatusPage(),
        ),
      );
    }

    return AppBar(
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 0, 0, 0),
        size: 40,
      ),
      foregroundColor: Colors.black,
      shadowColor: const Color.fromARGB(0, 0, 0, 0),
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      title: const Text(
        "Rover Manual Control",
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<RoverMetrics>(
              stream: mirvApi.periodicMetricUpdates,
              builder: (context, snapshot) {
                return RoverStatusBar(roverMetrics: snapshot.data);
              }),
        ),
        ElevatedButton(
          onPressed: goStatus,
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.amber),
              backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
          child: const Text(
            " Status ",
            textScaleFactor: 2.5,
          ),
        ),
      ],
    );
  }
}
