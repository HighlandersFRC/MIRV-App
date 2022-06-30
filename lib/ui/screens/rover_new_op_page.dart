import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/left_side_buttons.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/navigation_drawer.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/right_side_buttons.dart';
import 'package:get/get.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/telemetry_data_table.dart';

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  RxList<RoverSummary> roverList = <RoverSummary>[].obs;
  final MirvApi _mirvApi = MirvApi();

  RoverMetrics roverMetrics = const RoverMetrics();
  @override
  void initState() {
    super.initState();
    _mirvApi.startPeriodicMetricUpdates();
  }

  @override
  void dispose() {
    super.dispose();
    _mirvApi.stopPeriodicMetricUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpPgAppBar(
        mirvApi: _mirvApi,
        roverMetrics: roverMetrics,
      ),
      endDrawer: Drawer(
        child: StreamBuilder<RoverMetrics>(
            stream: _mirvApi.periodicMetricUpdates,
            builder: (context, snapshot) {
              return CommandList(roverMetrics: snapshot.data);
            }),
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: 200,
                child: LeftSideButtons(
                  mirvApi: _mirvApi,
                  roverMetrics: roverMetrics,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  color: Colors.amber,
                  width: 800,
                  height: 450,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 194, 194, 194),
                      ),
                    ),
                    child: const Text("video"),
                  ),
                ),
                StreamBuilder<RoverMetrics>(
                    stream: _mirvApi.periodicMetricUpdates,
                    builder: (context, snapshot) {
                      return Container(
                          child: snapshot.data != null
                              ? TelemeteryDataTable(
                                  roverMetrics: snapshot.data!.telemetry)
                              : Text('Waiting on data'));
                    }),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: RightSideButtons(roverMetrics: roverMetrics)),
        ],
      ),
    );
  }
}
