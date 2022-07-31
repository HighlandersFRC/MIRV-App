import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mirv/Blocs/autocomplete/search_bar.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/models/device_status_type.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/rover_operation_page.dart';
import 'package:mirv/ui/screens/rover_selection_map.dart';

class SelectedRoverController extends GetxController {
  Rx<String> selectedRoverId = "".obs;
  Rx<bool> isConnectButtonEnabled = false.obs;
  Rx<bool> isRoverListMinimized = false.obs;
  Rx<Place?> searchSelect = Rx<Place?>(null);

  SelectedRoverController() {
    selectedRoverId.listen((selectedRoverId) => isConnectButtonEnabled.value = (selectedRoverId != ""));
  }

  setSelectedRoverId(String rover_id) {
    if (rover_id == selectedRoverId.value) {
      selectedRoverId.trigger(rover_id);
    } else {
      selectedRoverId.value = rover_id;
    }
  }

  verifyRoverId(List<RoverMetrics> rovers) {
    if (rovers.where((element) => element.rover_id == selectedRoverId.value).isEmpty) selectedRoverId.value = "";
  }

  Color roverTileColor(
    String rover_id,
    DeviceStatusType value,
  ) {
    if (selectedRoverId.value == rover_id) {
      return secondaryColor;
    } else {
      switch (value) {
        case DeviceStatusType.available:
          return tileColor;

        case DeviceStatusType.unavailable:
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
  late GarageMetrics garageMetrics;

  late MirvApi mirvApi = MirvApi();
  final TextEditingController typeAheadController = TextEditingController();

  int? groupValue = 0;
  RxList<RoverMetrics> roverList = <RoverMetrics>[].obs;

  void _refreshRoversList() async {
    roverList.value = await mirvApi.getRovers();
    selectedRoverController.verifyRoverId(roverList);
  }

  double roverListWidth = 300;

  Icon _batteryIcon(int? batteryLevel, {int? alertLevel}) {
    double size = 40;
    if (batteryLevel == null) {
      return Icon(Icons.battery_unknown_rounded, size: size);
    }
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return Icon(Icons.battery_alert_rounded, size: size);
    }
    switch (result) {
      case 0:
        return Icon(Icons.battery_0_bar_rounded, size: size);
      case 1:
        return Icon(Icons.battery_1_bar_rounded, size: size);
      case 2:
        return Icon(Icons.battery_2_bar_rounded, size: size);
      case 3:
        return Icon(Icons.battery_3_bar_rounded, size: size);
      case 4:
        return Icon(Icons.battery_4_bar_rounded, size: size);
      case 5:
        return Icon(Icons.battery_5_bar_rounded, size: size);
      case 6:
        return Icon(Icons.battery_6_bar_rounded, size: size);
      default:
        return Icon(Icons.battery_full_rounded, size: size);
    }
  }

  @override
  Widget build(BuildContext context) {
    _refreshRoversList();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    selectedRoverController.isRoverListMinimized.value = width < 600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                        roverList[index].rover_id,
                                        roverList[index].status,
                                      ),
                                      title: Text(roverList[index].rover_id.toString()),
                                      onTap: () {
                                        if (roverList[index].status == DeviceStatusType.available) {
                                          selectedRoverController.setSelectedRoverId((roverList[index].rover_id).toString());
                                        }
                                      })
                                  : ListTile(
                                      tileColor: selectedRoverController.roverTileColor(
                                        roverList[index].rover_id,
                                        roverList[index].status,
                                      ),
                                      title: selectedRoverController.isRoverListMinimized.value
                                          ? Text(roverList[index].rover_id.toString())
                                          : Text(
                                              "Rover ${roverList[index].rover_id}",
                                            ),
                                      subtitle: selectedRoverController.isRoverListMinimized.value
                                          ? const SizedBox()
                                          : Text(
                                              'Battery ${roverList[index].battery_percent.toString()} \n ${roverList[index].state}'),
                                      onTap: () {
                                        if (roverList[index].status == DeviceStatusType.available) {
                                          selectedRoverController.setSelectedRoverId((roverList[index].rover_id).toString());
                                        }
                                      },
                                      trailing: selectedRoverController.isRoverListMinimized.value
                                          ? const SizedBox()
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                _batteryIcon(roverList[index].battery_percent),
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
                            onPressed: selectedRoverController.isConnectButtonEnabled.value
                                ? () {
                                    Get.to(RoverOperationPage(roverList.firstWhere(
                                        (element) => selectedRoverController.selectedRoverId.value == element.rover_id)));
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
