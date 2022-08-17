// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  final selectedGarageController = Get.put(SelectedGarageController());
  late final String garage_id;
  final double? setWidth;
  final double? setHeight;

  GarageOperationPage(GarageMetrics garageMetrics, {Key? key, this.setWidth, this.setHeight}) : super(key: key) {
    _mirvGarageApi.garageMetricsObs.value = garageMetrics;
    garage_id = garageMetrics.garage_id;
  }

  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));

  @override
  Widget build(BuildContext context) {
    _mirvGarageApi.startGarageMetricUpdates(garage_id);
    double width = setWidth ?? MediaQuery.of(context).size.width;
    double height = setHeight ?? MediaQuery.of(context).size.height;
    _mirvGarageApi.buildContext = context;
    return Scaffold(
      appBar: (GarageAppBar(garageMetricsObs: _mirvGarageApi.garageMetricsObs, width: width)),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            bottom: 30,
            left: 10,
            width: 110,
            child: Scrollbar(
              child: Obx(
                () => GarageCommandList(
                  garageMetrics: _mirvGarageApi.garageMetricsObs.value,
                  sendCommand: _mirvGarageApi.sendGarageCommand,
                  resetGarageState: _mirvGarageApi.resetGarageMetricsUpdates(garage_id),
                ),
              ),
            ),
          ),
          Obx(
            () => Positioned(
                right: width / 4,
                child: StateImages(
                    garageMetrics: _mirvGarageApi.garageMetricsObs.value,
                    width: (width - 110) - (width / 4))), //(width - 110 - (width / 4))
          ),
          Obx(
            () => Positioned(
                top: 70, right: 25, child: LockImage(garageMetrics: _mirvGarageApi.garageMetricsObs.value, width: width / 4)),
          ),
          Obx(
            () => Positioned(
                top: height / 2,
                right: 25,
                child: LightImage(garageMetrics: _mirvGarageApi.garageMetricsObs.value, width: width / 4)),
          )
        ],
      ),
    );
  }
}
