import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:test/models/rover_status_type.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page.dart';
import 'package:test/ui/screens/rover_selection_map.dart';
import 'package:test/ui/screens/rover_status_page.dart';

class RoverSelectionPage extends StatefulWidget {
  const RoverSelectionPage({Key? key}) : super(key: key);

  @override
  State<RoverSelectionPage> createState() => _RoverSelectionPageState();
}

class _RoverSelectionPageState extends State<RoverSelectionPage> {
  MirvApi mirvApi = MirvApi();
  Location location = new Location();
  RxList<RoverSummary> roverList = <RoverSummary>[].obs;
  void _refreshRoversList() async {
    roverList.value = await mirvApi.getRovers();
  }

  double roverListWidth = 300;

  Icon _batteryIcon(int batteryLevel, {int? alertLevel}) {
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return Icon(Icons.battery_alert_rounded);
    }
    switch (result) {
      case 0:
        return Icon(Icons.battery_0_bar_rounded);
      case 1:
        return Icon(Icons.battery_1_bar_rounded);
      case 2:
        return Icon(Icons.battery_2_bar_rounded);
      case 3:
        return Icon(Icons.battery_3_bar_rounded);
      case 4:
        return Icon(Icons.battery_4_bar_rounded);
      case 5:
        return Icon(Icons.battery_5_bar_rounded);
      case 6:
        return Icon(Icons.battery_6_bar_rounded);
      default:
        return Icon(Icons.battery_full_rounded);
    }
  }

  Icon _getStatusIcon(RoverStatusType value) {
    switch (value) {
      case RoverStatusType.available:
        return Icon(Icons.lock_open_rounded);

      case RoverStatusType.unavailable:
        return Icon(Icons.lock_rounded);
    }
  }

  void _testButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    void _checkLocationPermission() async {
      bool _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }
      PermissionStatus _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      //String elvis = true ? 'true' : 'false';
    }
  }

  @override
  Widget build(BuildContext context) {
    _refreshRoversList();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "Rover Selection",
        ),
        actions: <Widget>[
          IconButton(
              onPressed: _refreshRoversList,
              icon: const Icon(Icons.refresh_rounded, size: 45))
        ],
        leading: ElevatedButton(
            onPressed: _testButton, child: Icon(Icons.info_sharp)),
      ), //appbar
      body: Row(
        children: [
          SizedBox(
            width: roverListWidth,
            child: Column(
              children: [
                Container(
                  height: 600,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: roverList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 4,
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RoverOperationPage(
                                        roverID: roverList[index].roverId)),
                              );
                            },
                            title: Text(
                              "Rover ${roverList[index].roverId}",
                            ),
                            subtitle: Text(
                                'Battery ${roverList[index].battery.toString()} \n ${roverList[index].state}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _getStatusIcon(roverList[index].status),
                                _batteryIcon(roverList[index].battery,
                                    alertLevel: 20),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    child: Text('Connect'),
                    onPressed: () {
                      print('click');
                    })
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
