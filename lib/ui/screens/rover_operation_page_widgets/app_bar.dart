import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as get_pkg;
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:mirv/ui/screens/rover_status_page.dart';

class OpPgAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OpPgAppBar(
      {Key? key,
      required this.periodicMetricUpdates,
      required this.roverMetrics,
      required this.stopCall,
      required this.peerConnectionState})
      : super(key: key);

  final BehaviorSubject<RoverMetrics> periodicMetricUpdates;
  final RoverMetrics roverMetrics;
  final get_pkg.Rx<RTCPeerConnectionState?> peerConnectionState;
  final Function() stopCall;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
          size: 40,
        ),
        leadingWidth: 200,
        leading: ElevatedButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Disconnect?'),
                  content: Text('Would  you like to discconect from ${roverMetrics.roverId}'),
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
              }),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [Text('Disconnect'), Icon(Icons.wifi_tethering_off_outlined, color: Colors.red)]),
        ),
        foregroundColor: AppBarColor.foregroundColor,
        shadowColor: AppBarColor.shadowColor,
        backgroundColor: AppBarColor.backgroundColor,
        title: StreamBuilder<RoverMetrics>(
            stream: periodicMetricUpdates,
            builder: (context, snapshot) {
              return Text(snapshot.data != null ? '${snapshot.data!.state}' : 'Waiting on data');
            }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<RoverMetrics>(
                stream: periodicMetricUpdates.stream,
                builder: (context, snapshot) {
                  return RoverStatusBar(
                    roverMetrics: snapshot.data,
                    peerConnectionState: peerConnectionState,
                  );
                }),
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
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.amber),
                backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
            child: const Text(
              " Status ",
              textScaleFactor: 2.5,
            ),
          )
        ]);
  }
}
