import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/garage-pages/garage-selection-page.dart';
import 'package:mirv/ui/screens/garage-pages/garage_app_bar.dart';
import 'package:mirv/ui/screens/garage-pages/garage_operation_map.dart';
import 'package:mirv/ui/screens/garage-pages/list_garage_commands.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class GarageOperationPage extends StatelessWidget {
  final GarageMetrics garageMetrics;
  //final RoverMetrics roverMetrics;
  final MirvApi _mirvGarageApi = MirvApi();
  final selectedGarageController = Get.put(SelectedGarageController());
  RxList<GarageMetrics> garageList = <GarageMetrics>[].obs;

  GarageOperationPage(this.garageMetrics, {Key? key}) : super(key: key);
  final BehaviorSubject<LatLng> locationStream =
      BehaviorSubject<LatLng>.seeded(const LatLng(40.474019558671344, -104.96957447379826));

  @override
  Widget build(BuildContext context) {
    _mirvGarageApi.getGarageMetrics(garageMetrics.garage_id);

    return Scaffold(
      appBar: GarageAppBar(
        garageMetrics: garageMetrics,
      ),
      body: Stack(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: GarageOperationMap(
                locationStream: locationStream,
                garageMetrics: garageMetrics,
              ),
            ),
          ),
          Positioned(
            top: 30,
            height: 450,
            left: 10,
            width: 110,
            child: Scrollbar(
              child: GarageCommandList(
                garageMetrics: garageMetrics,
                sendCommand: _mirvGarageApi.sendGarageCommand,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
