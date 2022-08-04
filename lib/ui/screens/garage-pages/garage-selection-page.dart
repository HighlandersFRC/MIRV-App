import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/garage-pages/garage_op_page.dart';

class SelectedGarageController extends GetxController {
  Rx<String> selectedGarageId = "".obs;
  Rx<bool> isConnectButtonEnabled = false.obs;
  Rx<bool> isGarageListMinimized = false.obs;
  Rx<Place?> searchSelect = Rx<Place?>(null);

  SelectedGarageController() {
    selectedGarageId.listen((selectedGarageId) => isConnectButtonEnabled.value = (selectedGarageId != ""));
  }

  setSelectedGarageId(String garageId) {
    if (garageId == selectedGarageId.value) {
      selectedGarageId.trigger(garageId);
    } else {
      selectedGarageId.value = garageId;
    }
  }

  verifyGarageId(List<GarageMetrics> garages) {
    if (garages.where((element) => element.garage_id == selectedGarageId.value).isEmpty) selectedGarageId.value = "";
  }

  Color garageTileColor(
    String garageId,
  ) {
    if (selectedGarageId.value == garageId) {
      return tileColorSelected;
    } else {
      return tileColorAvailible;
    }
  }
}

class GarageSelectionPage extends StatelessWidget {
  GarageSelectionPage({
    Key? key,
  }) : super(key: key);
  final selectedGarageController = Get.put(SelectedGarageController());

  late MirvApi? mirvGarageApi = MirvApi();
  int? groupValue = 0;
  RxList<GarageMetrics> garageList = <GarageMetrics>[].obs;
  final TextEditingController typeAheadController = TextEditingController();

  void _refreshGaragesList() async {
    garageList.value = await mirvGarageApi!.getGarages();
    selectedGarageController.verifyGarageId(garageList);
  }

  double garageListWidth = 300;

  @override
  Widget build(BuildContext context) {
    _refreshGaragesList();
    double width = MediaQuery.of(context).size.width;
    selectedGarageController.isGarageListMinimized.value = width < 600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Garage Selection",
        ),
      ),
      body: Row(
        children: [
          Obx(
            () => Expanded(
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
                                        garageList[index].garage_id,
                                      ),
                                      title: Text(garageList[index].garage_id.toString()),
                                      onTap: () {
                                        selectedGarageController.setSelectedGarageId((garageList[index].garage_id).toString());
                                      })
                                  : ListTile(
                                      tileColor: selectedGarageController.garageTileColor(
                                        garageList[index].garage_id,
                                      ),
                                      title: selectedGarageController.isGarageListMinimized.value
                                          ? Text(garageList[index].garage_id.toString())
                                          : Text(
                                              "garage ${garageList[index].garage_id}",
                                            ),
                                      subtitle: selectedGarageController.isGarageListMinimized.value
                                          ? const SizedBox()
                                          : Text('State: ${garageList[index].state.toString()}'),
                                      onTap: () {
                                        selectedGarageController.setSelectedGarageId((garageList[index].garage_id).toString());
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
                        child: ElevatedButton(
                          onPressed: selectedGarageController.isConnectButtonEnabled.value
                              ? () {
                                  Get.to(
                                    () => (GarageOperationPage(
                                      garageList.firstWhere(
                                        (element) => selectedGarageController.selectedGarageId.value == element.garage_id,
                                      ),
                                    )),
                                  );
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
        ],
      ),
    );
  }
}
