import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/map_video_display.dart';
import 'package:test/ui/screens/rover_operation_map.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/left_side_buttons.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/navigation_drawer.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/right_side_buttons.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:get/get.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';

class MapSelectionController extends GetxController {
  Rx<bool> showMap = false.obs;
}

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  RxList<RoverSummary> roverList = <RoverSummary>[].obs;
  final MirvApi _mirvApi = MirvApi();
  final mapSelectionController = Get.put(MapSelectionController());

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
      ),
      //
      drawer: const Drawer(child: NavigationDrawer()),
      endDrawer: Drawer(
        child: StreamBuilder<RoverMetrics>(
            stream: _mirvApi.periodicMetricUpdates,
            builder: (context, snapshot) {
              return CommandList(roverMetrics: roverMetrics);
            }),
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: 200,
                child: Obx(
                  () => LeftSideButtons(
                    mirvApi: _mirvApi,
                    roverMetrics: roverMetrics,
                    mapSelectionController: mapSelectionController,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Obx(() => OperationMapVideo(
                showMap: mapSelectionController.showMap.value)),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: RightSideButtons(roverMetrics: roverMetrics)),
        ],
      ),
    );
  }
}
