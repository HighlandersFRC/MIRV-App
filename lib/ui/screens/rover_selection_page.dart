import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:test/functions_copy_and_paste.dart';
import 'package:test/models/rover_status_type.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/google_map_v2.dart';
import 'package:test/ui/screens/rover_new_op_page.dart';
import 'package:test/ui/screens/rover_operation_page.dart';
import 'package:test/ui/screens/rover_selection_map.dart';
import 'package:test/ui/screens/rover_status_page.dart';

class SelectedRoverController extends GetxController {
  var selectedRoverId = "".obs;
  var isConnectButtonEnabled = false.obs;

  SelectedRoverController() {
    selectedRoverId
        .listen((roverId) => isConnectButtonEnabled.value = (roverId != ""));
  }

  setSelectedRoverId(String roverId) {
    selectedRoverId.value = roverId;
  }

  verifyRoverId(List<RoverSummary> rovers) {
    if (rovers
        .where((element) => element.roverId == selectedRoverId.value)
        .isEmpty) selectedRoverId.value = "";
  }

  Color roverTileColor(
    String roverId,
    RoverStatusType value,
  ) {
    if (selectedRoverId.value == roverId) {
      return Colors.blue;
    } else {
      switch (value) {
        case RoverStatusType.available:
          return Colors.white;

        case RoverStatusType.unavailable:
          return Colors.grey;
      }
    }
  }
}

class RoverSelectionPage extends StatefulWidget {
  const RoverSelectionPage({Key? key}) : super(key: key);

  @override
  State<RoverSelectionPage> createState() => _RoverSelectionPageState();
}

class _RoverSelectionPageState extends State<RoverSelectionPage> {
  final selectedRoverController = Get.put(SelectedRoverController());
  MirvApi mirvApi = MirvApi();
  Location location = Location();
  int? groupValue = 0;
  RxList<RoverSummary> roverList = <RoverSummary>[].obs;

  void _refreshRoversList() async {
    roverList.value = await mirvApi.getRovers();
    selectedRoverController.verifyRoverId(roverList);
  }

  double roverListWidth = 300;

  Icon _batteryIcon(int batteryLevel, {int? alertLevel}) {
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return const Icon(Icons.battery_alert_rounded);
    }
    switch (result) {
      case 0:
        return const Icon(Icons.battery_0_bar_rounded);
      case 1:
        return const Icon(Icons.battery_1_bar_rounded);
      case 2:
        return const Icon(Icons.battery_2_bar_rounded);
      case 3:
        return const Icon(Icons.battery_3_bar_rounded);
      case 4:
        return const Icon(Icons.battery_4_bar_rounded);
      case 5:
        return const Icon(Icons.battery_5_bar_rounded);
      case 6:
        return const Icon(Icons.battery_6_bar_rounded);
      default:
        return const Icon(Icons.battery_full_rounded);
    }
  }

  void _infoButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StatusPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "Rover Selection",
        ),
        actions: <Widget>[
          IconButton(
              onPressed: _refreshRoversList,
              icon: const Icon(Icons.refresh_rounded, size: 45))
        ],
        leading: ElevatedButton(
            onPressed: () => NavigationRoutes.goStatus,
            child: const Icon(Icons.info_sharp)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapPage()),
          );
        }),
        child: const Icon(Icons.map),
      ),
      body: Row(
        children: [
          SizedBox(
            width: roverListWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FractionallySizedBox(
                  child: AspectRatio(
                    aspectRatio: .5,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: roverList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 4,
                            ),
                            child: Obx(
                              () => ListTile(
                                tileColor:
                                    selectedRoverController.roverTileColor(
                                  roverList[index].roverId,
                                  roverList[index].status,
                                ),
                                title: Text(
                                  "Rover ${roverList[index].roverId}",
                                ),
                                subtitle: Text(
                                    'Battery ${roverList[index].battery.toString()} \n ${roverList[index].state}'),
                                onTap: () {
                                  if (roverList[index].status ==
                                      RoverStatusType.available) {
                                    selectedRoverController.setSelectedRoverId(
                                        (roverList[index].roverId).toString());
                                  }
                                },
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _batteryIcon(roverList[index].battery,
                                        alertLevel: 20),
                                    IconButton(
                                      icon: const Icon(
                                          Icons.arrow_forward_ios_rounded),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RoverOpPage()),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              selectedRoverController
                                      .isConnectButtonEnabled.value
                                  ? Colors.blue
                                  : Colors.grey)),
                      onPressed:
                          selectedRoverController.isConnectButtonEnabled.value
                              ? () {
                                  print('click');
                                }
                              : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.link_rounded),
                          Text(' Connect'),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            width: 5,
          ),
          Expanded(child: RoverSelectionMap(location))
        ],
      ),
    );
  }
}
