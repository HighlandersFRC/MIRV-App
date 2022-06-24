import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/disable_toggle.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/rover_status_bar.dart';
import 'package:test/ui/screens/rover_selection_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';
import 'package:get/get.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  RxList<RoverSummary> roverList = <RoverSummary>[].obs;
  final MirvApi _mirvApi = MirvApi();

  RoverMetrics roverMetrics = const RoverMetrics();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _mirvApi.startPeriodicMetricUpdates();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<RoverMetrics>(
                  stream: _mirvApi.periodicMetricUpdates,
                  builder: (context, snapshot) {
                    return RoverStatusBar(roverMetrics: snapshot.data);
                  }),
            ),
            ElevatedButton(
              onPressed: goStatus,
              child: const Text(
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
          ]),

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
      //),
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
      endDrawer: CommandList(roverMetrics: roverMetrics),
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
                    height: 15,
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
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
                    height: 500,
                    child: ListView(
                      children: [
                        Container(
                          height: 55,
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
                          height: 55,
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
                          height: 55,
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
                          height: 55,
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
                          height: 55,
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
                          height: 55,
                          child: ElevatedButton(
                            onPressed: doNothing,
                            child: Text(
                              "Command",
                              textScaleFactor: 2,
                            ),
                            style: ButtonStyle(),
                          ),
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
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      label: Text("Commands"),
                      icon: Icon(
                        Icons.list_alt,
                      )),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                ),
                SizedBox(height: 100, width: 225, child: ToggleDisable()),
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[700]),
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
