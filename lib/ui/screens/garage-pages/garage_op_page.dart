import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/garage/garage_command_type.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/garage-pages/garage-selection-page.dart';
import 'package:mirv/ui/screens/garage-pages/garage_app_bar.dart';
import 'package:mirv/ui/screens/garage-pages/garage_image_states.dart';
import 'package:mirv/ui/screens/garage-pages/garage_light_icon.dart';
import 'package:mirv/ui/screens/garage-pages/list_garage_commands.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/garage-pages/update_lock_image.dart';
import 'package:rxdart/subjects.dart';

class GarageOperationPage extends StatelessWidget {
  final MirvApi _mirvGarageApi = MirvApi();
  late GarageCommandType command;
  late final GarageCommand _garageCommand = GarageCommand(command);
  final selectedGarageController = Get.put(SelectedGarageController());
  RxList<GarageMetrics?> garageList = <GarageMetrics?>[].obs;
  late String garage_id;

  GarageOperationPage(GarageMetrics garageMetrics, {Key? key}) : super(key: key) {
    _mirvGarageApi.garageMetricsObs.value = garageMetrics;
    garage_id = garageMetrics.garage_id;
  }

  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));

  @override
  Widget build(BuildContext context) {
    _mirvGarageApi.startGarageMetricUpdates(garage_id);
    return Scaffold(
      appBar: (GarageAppBar(
        garageMetricsObs: _mirvGarageApi.garageMetricsObs,
      )),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            height: 450,
            left: 10,
            width: 110,
            child: Scrollbar(
              child: Obx(
                () => GarageCommandList(
                  garageMetrics: _mirvGarageApi.garageMetricsObs.value!,
                  sendCommand: _mirvGarageApi.sendGarageCommand,
                  changeGarageState: _mirvGarageApi.updateGarageState,
                  resetGarageState: _mirvGarageApi.resetGarageMetricsUpdates(garage_id),
                ),
              ),
            ),
          ),
          Obx (() =>
            Positioned(
              right: 200,
              child: StateImages(garageMetrics: _mirvGarageApi.garageMetricsObs.value!)),
          ),
          Obx (() =>
            Positioned(
              top: 70,
              right: 65,
              child: LockImage(garageMetrics: _mirvGarageApi.garageMetricsObs.value!)),
          ),
   Obx (() =>
  Positioned(
              top: 350,
              right: 155,
              child: LightImage(garageMetrics: _mirvGarageApi.garageMetricsObs.value!,)),)
        ],
      ),
    );
  }
}
