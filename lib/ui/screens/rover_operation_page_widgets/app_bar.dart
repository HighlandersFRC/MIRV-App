import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/commands_drawer.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/status_dot.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry.dart';
import 'package:mirv/ui/screens/rover_status_page.dart';

class OperationPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OperationPageAppBar({Key? key, required this.roverMetrics, required this.stopCall, required this.peerConnectionState})
      : super(key: key);

  final Rx<RoverMetrics> roverMetrics;
  final get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState;
  final Function() stopCall;

  String _stateText(RoverStateType? roverState, bool docked) {
    switch (roverState) {
      case RoverStateType.disconnected:
        return "Disconnected";
      case RoverStateType.autonomous:
        return "Autonomous";
      case RoverStateType.disconnected_fault:
        return "Disconnected with Error";
      case RoverStateType.connected_disabled:
        return "Disabled";
      case RoverStateType.connected_fault:
        return "Connected with Error";
      case RoverStateType.connected_idle:
        if (docked) {
          return "Docked";
        } else {
          return "Awaiting Orders";
        }
      case RoverStateType.e_stop:
        return "E-Stopped";
      case RoverStateType.remote_operation:
        return "Controlling";
      default:
        return "No Data";
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        foregroundColor: Color.fromARGB(0, 255, 255, 255),
        leadingWidth: 250,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10, top: 1, bottom: 1),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.call_end_rounded, size: 30, color: fontColor),
                label: const Text("Disconnect", style: TextStyle(fontSize: 20)),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Disconnect?'),
                      content: Text('Would  you like to discconect from ${roverMetrics.value.rover_id}'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              stopCall();

                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeRight,
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                              Navigator.pop(context);
                              get_pkg.Get.offAll(() => HomePage());
                            },
                            child: const Text('Yes')),
                        TextButton(
                            onPressed: () {
                              return Navigator.pop(context);
                            },
                            child: const Text('No'))
                      ],
                    );
                  },
                ),
              ),
            ),
            StatusDot(peerConnectionState),
          ],
        ),
        title: Text(_stateText(roverMetrics.value.state, roverMetrics.value.docked),
            style: const TextStyle(fontSize: 20, color: fontColor)),
        actions: [
          Obx(() => TelemetryWidget(roverMetrics.value)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoverStatusBar(roverMetrics: roverMetrics.value),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: AspectRatio(aspectRatio: 1.5, child: StatusPage(roverMetrics.value)),
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
              child: const Text(
                " Status",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ]);
  }
}
