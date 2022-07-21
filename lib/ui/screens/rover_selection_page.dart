import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/Blocs/autocomplete/search_bar.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:location/location.dart';
import 'package:mirv/models/rover_status_type.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/rover_new_op_page.dart';
import 'package:mirv/ui/screens/rover_operation_page.dart';
import 'package:mirv/ui/screens/rover_selection_map.dart';

class SelectedRoverController extends GetxController {
  Rx<String> selectedRoverId = "".obs;
  Rx<bool> isConnectButtonEnabled = false.obs;
  Rx<bool> isRoverListMinimized = false.obs;
  Rx<Place?> searchSelect = Rx<Place?>(null);

  SelectedRoverController() {
    selectedRoverId.listen((selectedroverId) => isConnectButtonEnabled.value = (selectedroverId != ""));
  }

  setSelectedRoverId(String roverId) {
    if (roverId == selectedRoverId.value) {
      selectedRoverId.trigger(roverId);
    } else {
    selectedRoverId.value = roverId;}
  }

  verifyRoverId(List<RoverMetrics> rovers) {
    if (rovers.where((element) => element.roverId == selectedRoverId.value).isEmpty) selectedRoverId.value = "";
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
  final TextEditingController typeAheadController = TextEditingController();
  Rx<Future<void>?> centerRover = Rx<Future<void>?>(null);
  GoogleMapController? _mapController;

  int? groupValue = 0;
  RxList<RoverMetrics> roverList = <RoverMetrics>[].obs;

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

  @override
  Widget build(BuildContext context) {
    _refreshRoversList();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    selectedRoverController.isRoverListMinimized.value = width < 600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: const Text(
          "Rover Selection",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: IconButton(onPressed: _refreshRoversList, icon: const Icon(Icons.refresh_rounded, size: 45)),
          ),
        ],
      ),
      body: Row(
        children: [
          Obx(
            () => SizedBox(
              width: selectedRoverController.isRoverListMinimized.value ? 150 : 300,
              child: Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () => Future(_refreshRoversList),
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
                              () => selectedRoverController.isRoverListMinimized.value
                                  ? ListTile(
                                      tileColor: selectedRoverController.roverTileColor(
                                        roverList[index].roverId,
                                        roverList[index].status,
                                      ),
                                      title: Text(roverList[index].roverId.toString()),
                                      onTap: () {
                                        _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                                          target: LatLng(
                                              roverList[index].telemetry.location.lat, roverList[index].telemetry.location.long),
                                        )));
                                        if (roverList[index].status == RoverStatusType.available) {
                                          selectedRoverController.setSelectedRoverId((roverList[index].roverId).toString());
                                        }
                                      })
                                  : ListTile(
                                      tileColor: selectedRoverController.roverTileColor(
                                        roverList[index].roverId,
                                        roverList[index].status,
                                      ),
                                      title: selectedRoverController.isRoverListMinimized.value
                                          ? Text(roverList[index].roverId.toString())
                                          : Text(
                                              "Rover ${roverList[index].roverId}",
                                            ),
                                      subtitle: selectedRoverController.isRoverListMinimized.value
                                          ? const SizedBox()
                                          : Text('Battery ${roverList[index].battery.toString()} \n ${roverList[index].state}'),
                                      onTap: () {
                                        
                                        if (roverList[index].status == RoverStatusType.available) {
                                          selectedRoverController.setSelectedRoverId((roverList[index].roverId).toString());
                                        }
                                      },
                                      trailing: selectedRoverController.isRoverListMinimized.value
                                          ? const SizedBox()
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                _batteryIcon(roverList[index].battery, alertLevel: 20),
                                              ],
                                            ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx(
                          () => ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    selectedRoverController.isConnectButtonEnabled.value ? Colors.blue : Colors.grey)),
                            onPressed: selectedRoverController.isConnectButtonEnabled.value
                                ? () {
                                    Get.to(RoverOperationPage(roverList.firstWhere(
                                        (element) => selectedRoverController.selectedRoverId.value == element.roverId)));
                                  }
                                : null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.link_rounded),
                                Text(' Connect'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  width < 600
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: Obx(
                            () => ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.green),
                              onPressed: () {
                                selectedRoverController.isRoverListMinimized.value =
                                    !selectedRoverController.isRoverListMinimized.value;
                              },
                              child: selectedRoverController.isRoverListMinimized.value
                                  ? const Icon(Icons.keyboard_arrow_right)
                                  : const Icon(Icons.keyboard_arrow_left),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: 5,
          ),
          Expanded(
              child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: 70,
                      child:
                          SearchBar(selectedRoverController: selectedRoverController, typeAheadController: typeAheadController)),
                  Expanded(
                    child: Obx(
                      // ignore: invalid_use_of_protected_member
                      () =>
                          (RoverSelectionMap(roverList.value, selectedRoverController.selectedRoverId, selectedRoverController)),
                    ),
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
