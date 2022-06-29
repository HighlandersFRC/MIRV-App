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
  final BehaviorSubject<LatLng> locationStream = BehaviorSubject<LatLng>.seeded(
      new LatLng(40.474019558671344, -104.96957447379826));
  final List<RoverLocation> piLitMarkers = [
    RoverLocation(
        roverId: 'piLit1',
        location: new LatLng(40.47399235127373, -104.96957682073116)),
    RoverLocation(
        roverId: 'piLit2',
        location: new LatLng(40.474025762131475, -104.9695798382163)),
    RoverLocation(
        roverId: 'piLit3',
        location: new LatLng(40.47405381703737, -104.96958520263433)),
    RoverLocation(
        roverId: 'piLit4',
        location: new LatLng(40.47408365724258, -104.96959090232849))
  ];

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
                  mapSelectionController: mapSelectionController,
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Obx(() => OperationMapVideo(
                  showMap: mapSelectionController.showMap.value,
                  locationStream: locationStream,
                  piLitMarkers: piLitMarkers,
                )),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: RightSideButtons(roverMetrics: roverMetrics)),
        ],
      ),
    );
  }
}
