// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/models/rover_status_type.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/rover_selection_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/models/rover_state_type.dart';
import 'package:test/models/rover_status_type.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/google_map.dart';
import 'package:test/ui/screens/google_map_v2.dart';
import 'package:test/ui/screens/rover_operation_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

///I was lazy and just copy and pasted imports from homepage lol

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  RxList<RoverSummary> roverList = <RoverSummary>[].obs;

  var bLevel = 21;

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

  Icon _getStatusIcon(RoverStatusType value) {
    switch (value) {
      case RoverStatusType.available:
        return const Icon(Icons.lock_open_rounded);

      case RoverStatusType.unavailable:
        return const Icon(Icons.lock_rounded);
    }
  }

  goSelection() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RoverSelectionPage()),
    );
  }

  goStatus() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StatusPage(),
      ),
    );
  }

  goTrouble() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TroubleShootingPage()),
    );
  }

  goHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  goInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InfoPage()),
    );
  }

  eStop() {
    print("Emergency stop hasnt been coded yet, go screw yourself");
  }

  doNothing() {
    print("he he he ha!");
  }

  @override
  Widget build(BuildContext context) {
    double _x = 0;
    double _y = 0;
    var step = 10.0;
    final JoystickMode _joystickMode = JoystickMode.all;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
          size: 40,
        ),
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: Text(
          "Rover Manual Control",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1.75,
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: goStatus,
            icon: _batteryIcon(bLevel, alertLevel: 20),
            label: const Text(
              "Status",
              textScaleFactor: 2.5,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10, 7),
                  ),
                ),
              ), //shape
              fixedSize: MaterialStateProperty.all(
                const Size(200, 300),
              ), //size
              overlayColor: MaterialStateProperty.all(Colors.amber),
              alignment: Alignment.centerLeft,
              shadowColor: MaterialStateProperty.all(
                const Color.fromARGB(100, 0, 0, 0),
              ), //overlay color
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 128, 123, 123),
              ), //background color
              foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 0, 0, 0),
              ), //foreground color
            ),
          ),
        ],
        /*  actions: <Widget>[
          ElevatedButton.icon(
            onPressed: goStatus,
            icon: _batteryIcon(bLevel, alertLevel: 20),
            label: const Text(
              "Status",
              textScaleFactor: 2.5,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(2, 1),
                  ),
                ),
              ), //shape
              fixedSize: MaterialStateProperty.all(
                const Size(200, 300),
              ), //size
              overlayColor: MaterialStateProperty.all(Colors.amber),
              alignment: Alignment.centerLeft,
              shadowColor: MaterialStateProperty.all(
                const Color.fromARGB(100, 0, 0, 0),
              ), //overlay color
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(0, 128, 123, 123),
              ), //background color
              foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 0, 0, 0),
              ), //foreground color
            ),
          ),
        ], */
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 158, 182, 193),
              ),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Icon(
                  Icons.drive_eta_sharp,
                  size: 100,
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goSelection,
                child: const Text(
                  "Go To Selection",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goStatus,
                child: const Text(
                  "Go To Status",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goTrouble,
                child: const Text(
                  "Go To Troubleshooting",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goHome,
                child: const Text(
                  "Go Home",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: goInfo,
                child: const Text(
                  "Go To Info",
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 175,
                    child: ElevatedButton.icon(
                      onPressed: doNothing,
                      label: const Text(
                        " Manual Control",
                        textScaleFactor: 1.5,
                      ),
                      icon: const Icon(
                        CupertinoIcons.antenna_radiowaves_left_right,
                        size: 60,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 98, 7, 255))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 175,
                    child: ElevatedButton.icon(
                      onPressed: doNothing,
                      label: const Text(
                        "Map",
                        textScaleFactor: 2.5,
                      ),
                      icon: const Icon(
                        Icons.map,
                        size: 60,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 98, 7, 255))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 250,
                    height: 550,
                    child: ListView(
                      children: [
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: doNothing,
                            child: Text(
                              "Command",
                              textScaleFactor: 2,
                            ),
                            style: ButtonStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: doNothing,
                            child: Text(
                              "Command",
                              textScaleFactor: 2,
                            ),
                            style: ButtonStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: doNothing,
                            child: Text(
                              "Command",
                              textScaleFactor: 2,
                            ),
                            style: ButtonStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: doNothing,
                            child: Text(
                              "Command",
                              textScaleFactor: 2,
                            ),
                            style: ButtonStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: doNothing,
                            child: Text(
                              "Command",
                              textScaleFactor: 2,
                            ),
                            style: ButtonStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: doNothing,
                            child: Text(
                              "Command",
                              textScaleFactor: 2,
                            ),
                            style: ButtonStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.amber,
              width: 800,
              height: 450,
              child: ElevatedButton(
                onPressed: doNothing,
                child: Text("video"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 194, 194, 194),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: doNothing,
                      label: Text("Commands"),
                      icon: Icon(
                        Icons.list_alt,
                      )),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                ),
                SizedBox(
                  height: 125,
                  width: 250,
                  child: GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    padding: const EdgeInsets.all(1),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: doNothing,
                          child: Text("enable"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 132, 219, 110))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: doNothing,
                          child: Text("disable"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 255, 81, 81))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                ),
                SizedBox(
                  child: Joystick(
                    mode: _joystickMode,
                    listener: (details) {
                      setState(
                        () {
                          _x = details.x;
                          _y = details.y;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 100,
                ),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: eStop,
                    label: const Text("E-STOP"),
                    icon: const Icon(Icons.warning_amber_rounded),
                    style: ButtonStyle(
                        animationDuration: Duration(seconds: 10),
                        overlayColor:
                            MaterialStateProperty.all(Colors.yellowAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 250, 250, 250),
                                width: 10),
                          ),
                        ),
                        shadowColor: MaterialStateProperty.all(
                            Color.fromARGB(0, 0, 0, 0))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}