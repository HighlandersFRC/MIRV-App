import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:mirv/models/rover/rover_state_type.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:mirv/ui/screens/rover_status_page.dart';

class OpPgAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OpPgAppBar({Key? key, required this.roverMetrics, required this.stopCall, required this.peerConnectionState})
      : super(key: key);

  final RoverMetrics roverMetrics;
  final get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState;
  final Function() stopCall;

  Text _stateText(RoverStateType? roverState) {
    switch (roverState) {
      case RoverStateType.disconnected:
        return const Text("Disconnected");
      case RoverStateType.autonomous:
        return const Text("Autonomous");
      case RoverStateType.disconnected_fault:
        return const Text("Disconnected with Error");
      case RoverStateType.connected_disabled:
        return const Text("Disabled");
      case RoverStateType.connected_fault:
        return const Text("Connected with Error");
      case RoverStateType.connected_idle_roaming:
        return const Text("Awaiting Orders");
      case RoverStateType.connected_idle_docked:
        return const Text("Docked");
      case RoverStateType.e_stop:
        return const Text("E-Stopped"); //hexagon?
      case RoverStateType.remote_operation:
        return const Text("Controlling");
      default:
        return const Text("No Data");
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 200,
        leading: Container(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.call_end_rounded, size: 30, color: Color.fromARGB(255, 255, 255, 255)),
              label: const Text("Disconnect", style: TextStyle(fontSize: 20)),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.redAccent.shade700),
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Disconnect?'),
                    content: Text('Would  you like to discconect from ${roverMetrics.rover_id}'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            stopCall();
                            Navigator.pop(context);
                            get_pkg.Get.offAll(() => const HomePage());
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
        ),
        backgroundColor: AppThemeColor.backgroundColor,
        title: _stateText(roverMetrics.state),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoverStatusBar(
              roverMetrics: roverMetrics,
              peerConnectionState: peerConnectionState,
            ),
          ),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: AspectRatio(aspectRatio: 1.5, child: StatusPage(roverMetrics)),
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
