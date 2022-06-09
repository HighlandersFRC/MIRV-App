import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/models/rover_summary.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MirvApi {
  String firstRover = "one";
  String secondRover = "two";
  String thirdRover = "three";
  String _authToken = "auth token";

  String getAuthToken() {
    _authToken = "new auth token";
    return "auth token";
  }

  Future<List<RoverSummary>> getRovers() async {
    List<RoverSummary> rovers;
    var response = await http.get(Uri.parse("http://localhost:8000/rovers"));
    print(response.body);
    // response = '[{"roverId":"rover_1","state":"docked","status":"available","battery":99},{"roverId":"rover_2","state":"remoteOperation","status":"available","battery":20}]';
    // var resp = json.decode('{"roverId": "rover_1", "state": "docked", "status": "available", "battery": "99"}');
    // var temp = RoverSummary.fromJson(resp);
    rovers = (json.decode(response.body) as List).map((i) => RoverSummary.fromJson(i)).toList();
    return rovers;
    // return <String>[firstRover, secondRover, thirdRover];
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RoverSummary> roverList = <RoverSummary>[];
  MirvApi mirvApi = MirvApi();
  // var roverList = <String>['1', '2', '3'];

  void _refreshRoversList() async {
    roverList = await mirvApi.getRovers();
    setState(() {
      roverList;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshRoversList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        appBar: AppBar(
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
          title: const Text(
            "Rover Selection",
            textScaleFactor: 2,
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: GestureDetector(
                  onTap: _refreshRoversList,
                  child: const Icon(Icons.replay_circle_filled_sharp, size: 50.0, color: Color.fromARGB(199, 30, 0, 0)),
                )),
          ],
        ), //appbar
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            void _pressedButton() {
              late String pageOfRover = "RoverPage${roverList[index]}";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoverPage(roverID: roverList[index].roverId)),
              );
            }

            return Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 220),
                    border: Border.all(width: 10, color: Color.fromARGB(255, 250, 250, 250)),
                    borderRadius: const BorderRadius.all(const Radius.elliptical(30, 25))),
                child: ListTile(
                  trailing: ElevatedButton(
                    onPressed: _pressedButton,
                    child: const Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 50,
                      color: Color.fromARGB(255, 30, 0, 0),
                    ),
                  ),
                  title: Text(
                    "Rover ${roverList[index]}",
                    textAlign: TextAlign.left,
                    textScaleFactor: 3,
                    textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: true),
                  ),
                ));
          },
          itemCount: roverList.length,
        ));
  }
}

class RoverPage extends StatelessWidget {
  final String roverID;
  RoverPage({Key? key, required this.roverID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void _goBack() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(
          'Rover Control $roverID',
          textScaleFactor: 2,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Color.fromARGB(255, 30, 0, 0),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 220, 220, 220),
            border: Border.all(width: 50, color: Color.fromARGB(255, 250, 250, 250)),
            borderRadius: const BorderRadius.all(const Radius.circular(70))),
        child: Text(
          "Video Here",
          textScaleFactor: 1.7,
        ),
        margin: EdgeInsets.only(bottom: 400),
      ),
    );
  }
}
