import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/app_bar_theme.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:test/ui/screens/rover_status_page.dart';

class OpPgAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OpPgAppBar(
      {Key? key,
      required this.periodicMetricUpdates,
      required this.roverMetrics,
      required this.stopCall})
      : super(key: key);

  final BehaviorSubject<RoverMetrics> periodicMetricUpdates;
  final RoverMetrics roverMetrics;
  final Function() stopCall;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

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
                  content: Text(
                      'Would  you like to discconect from ${roverMetrics.roverId}'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          stopCall();
                          Navigator.pop(context);
                          Get.offAll(HomePage());
                        },
                        child: Text('Yes')),
                    TextButton(
                        onPressed: () {
                          return Navigator.pop(context);
                        },
                        child: Text('No'))
                  ],
                );
              }),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('Disconnect'),
            Icon(Icons.wifi_tethering_off_outlined, color: Colors.red)
          ]),
        ),
        foregroundColor: AppBarColor.foregroundColor,
        shadowColor: AppBarColor.shadowColor,
        backgroundColor: AppBarColor.backgroundColor,
        title: StreamBuilder<RoverMetrics>(
            stream: periodicMetricUpdates,
            builder: (context, snapshot) {
              return Text(snapshot.data != null
                  ? '${snapshot.data!.state}'
                  : 'Waiting on data');
            }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<RoverMetrics>(
                stream: periodicMetricUpdates.stream,
                builder: (context, snapshot) {
                  return RoverStatusBar(roverMetrics: snapshot.data);
                }),
          ),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: AspectRatio(
                      aspectRatio: 1.5, child: Container(child: StatusPage())),
                  actions: [
                    TextButton(
                      onPressed: () {
                        return Navigator.pop(context);
                      },
                      child: Text('Close'),
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
