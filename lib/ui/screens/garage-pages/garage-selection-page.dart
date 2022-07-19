import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/Blocs/autocomplete/search_bar.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_status_type.dart';
import 'package:mirv/models/place.dart';
import 'package:location/location.dart';
import 'package:mirv/services/mirv_garage_api.dart';
import 'package:mirv/ui/screens/rover_operation_page.dart';
import 'package:mirv/ui/screens/rover_selection_map.dart';

class SelectedGarageController extends GetxController {
  Rx<String> selectedGarageId = "".obs;
  Rx<bool> isConnectButtonEnabled = false.obs;
  Rx<bool> isGarageListMinimized = false.obs;
  Rx<Place?> searchSelect = Rx<Place?>(null);

  SelectedGarageController() {
    selectedGarageId.listen((selectedGarage) => isConnectButtonEnabled.value = (selectedGarage != ""));
  }

  setSelectedGarageId(String garageId) {
    selectedGarageId.value = garageId;
  }

  verifyGarageId(List<GarageMetrics> garages) {
    if (garages.where((element) => element.garageId == selectedGarageId.value).isEmpty) selectedGarageId.value = "";
  }

  Color garageTileColor(
    String garageId,
    GarageStatusType value,
  ) {
    if (selectedGarageId.value == garageId) {
      return Colors.blue;
    } else {
      return Colors.white;
      // switch (value) {
      //   case GarageStatusType.available:
      //     return Colors.white;

      //   case GarageStatusType.unavailable:
      //     return Colors.grey;
      // }
    }
  }
}

class GarageSelectionPage extends StatelessWidget {
  GarageSelectionPage({Key? key}) : super(key: key);
  final selectedGarageController = Get.put(SelectedGarageController());
  MirvGarageApi mirvGarageApi = MirvGarageApi();
  Location location = Location();
  int? groupValue = 0;
  RxList<GarageMetrics> garageList = <GarageMetrics>[].obs;

  void _refreshGaragesList() async {
    garageList.value = await mirvGarageApi.getGarages();
    selectedGarageController.verifyGarageId(garageList);
  }

  double garageListWidth = 300;

  @override
  Widget build(BuildContext context) {
    _refreshGaragesList();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    selectedGarageController.isGarageListMinimized.value = width < 600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: const Text(
          "Garage Selection",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: IconButton(onPressed: _refreshGaragesList, icon: const Icon(Icons.refresh_rounded, size: 45)),
          ),
        ],
      ),
      body: Row(
        children: [
          Obx(
            () => SizedBox(
              width: selectedGarageController.isGarageListMinimized.value ? 150 : 300,
              child: Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () => Future(_refreshGaragesList),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: garageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 4,
                            ),
                            child: Obx(
                              () => selectedGarageController.isGarageListMinimized.value
                                  ? ListTile(
                                      tileColor: selectedGarageController.garageTileColor(
                                        garageList[index].garageId,
                                        garageList[index].status,
                                      ),
                                      title: Text(garageList[index].garageId.toString()),
                                      onTap: () {
                                        if (garageList[index].status == GarageStatusType.available) {
                                          selectedGarageController.setSelectedGarageId((garageList[index].garageId).toString());
                                        }
                                      })
                                  : ListTile(
                                      tileColor: selectedGarageController.garageTileColor(
                                        garageList[index].garageId,
                                        garageList[index].status,
                                      ),
                                      title: selectedGarageController.isGarageListMinimized.value
                                          ? Text(garageList[index].garageId.toString())
                                          : Text(
                                              "garage ${garageList[index].garageId}",
                                            ),
                                                                            onTap: () {
                                        if (garageList[index].status == GarageStatusType.available) {
                                          selectedGarageController.setSelectedGarageId((garageList[index].garageId).toString());
                                        }
                                      },
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
                                    selectedGarageController.isConnectButtonEnabled.value ? Colors.blue : Colors.grey)),
                            onPressed: selectedGarageController.isConnectButtonEnabled.value
                                ? () {
                                    Get.to(RoverOperationPage(garageList.firstWhere(
                                        (element) => selectedGarageController.selectedGarageId.value == element.garageId)));
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
                                selectedGarageController.isGarageListMinimized.value =
                                    !selectedGarageController.isGarageListMinimized.value;
                              },
                              child: selectedGarageController.isGarageListMinimized.value
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
                  SizedBox(height: 70, child: SearchBar(selectedGarageController: selectedGarageController)),
                  Expanded(
                    child: Obx(
                      // ignore: invalid_use_of_protected_member
                      () => (RoverSelectionMap(
                          garageList.value, selectedGarageController.selectedGarageId, selectedGarageController)),
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
