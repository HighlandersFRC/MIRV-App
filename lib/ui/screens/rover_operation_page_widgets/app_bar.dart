import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/status_dot.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/telemetry.dart';
import 'package:mirv/ui/screens/rover_status_page.dart';

class OperationPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OperationPageAppBar({Key? key, required this.roverGarageState, required this.stopCall, required this.peerConnectionState})
      : super(key: key);

  final Rx<RoverGarageState> roverGarageState;
  final get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState;
  final Function() stopCall;

  String _stateText(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disconnected:
        return "Disconnected";
      case RoverStateType.autonomous:
        return "Autonomous";
      case RoverStateType.disconnected_fault:
        return "Disconnected with Error";
      case RoverStateType.disabled:
        return "Disabled";
      case RoverStateType.fault:
        return "Fault";
      case RoverStateType.idle:
        return "Awaiting Orders";
      case RoverStateType.docked:
        return "Docked";
      case RoverStateType.e_stop:
        return "E-Stopped";
      case RoverStateType.remote_operation:
        return "Controlling";
      case RoverStateType.remote_operation_autonomous:
        return "Autonomous (Remote Operation)";
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        foregroundColor: const Color.fromARGB(0, 255, 255, 255),
        leadingWidth: 400,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.call_end_rounded, size: 30, color: fontColor),
                label: const Text("Disconnect", style: TextStyle(fontSize: 20)),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Disconnect?'),
                      content: Text('Would  you like to discconect from ${roverGarageState.value.rover_id}'),
                      actions: <Widget>[
                        ElevatedButton(
                            onPressed: () {
                              stopCall();
                              Navigator.pop(context);
                              get_pkg.Get.offAll(() => HomePage());
                            },
                            child: const Text('Yes')),
                        ElevatedButton(
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
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: StatusDot(peerConnectionState),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("ID: ${roverGarageState.value.rover_id}", style: const TextStyle(fontSize: 20, color: fontColor)),
            ),
          ],
        ),
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(_stateText(roverGarageState.value.state), style: const TextStyle(fontSize: 20, color: fontColor)),
        ]),
        actions: [
          Obx(() => TelemetryWidget(roverGarageState.value)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoverStatusBar(roverGarageState: roverGarageState.value),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: AspectRatio(aspectRatio: 1.5, child: StatusPage(roverGarageState.value)),
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
              child: const Text(
                " Status",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ]);
  }
}
