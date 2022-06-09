import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

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

  List<String> getRovers() {
    return <String>[firstRover, secondRover, thirdRover];
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> entries = <String>[];
  MirvApi mirvApi = MirvApi();
  var roverList = <String>['1', '2', '3'];

  void _refreshRoversList() {
    entries = mirvApi.getRovers();
    setState(() {
      entries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text(
            "Rover Selection",
            textScaleFactor: 2,
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: GestureDetector(
                  onTap: _refreshRoversList,
                  child: const Icon(Icons.replay_circle_filled_sharp,
                      size: 50.0, color: Color.fromARGB(199, 30, 0, 0)),
                )),
          ],
        ), //appbar
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            void _pressedButton() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RoverPage(roverID: roverList[index])),
              );
            }

            return Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 220, 220, 220),
                    border: Border.all(
                        width: 10,
                        color: const Color.fromARGB(255, 250, 250, 250)),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(30, 25))),
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
                    textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: true),
                  ),
                ));
          },
          itemCount: roverList.length,
        ));
  }
}

double _x = 100;
double _y = 100;

const step = 10.0;

JoystickMode _joystickMode = JoystickMode.all;

class RoverPage extends StatelessWidget {
  final String roverID;
  const RoverPage({Key? key, required this.roverID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(
          'Rover Control $roverID',
          textScaleFactor: 2,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: const Color.fromARGB(255, 30, 0, 0),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.green,
            ),
            Align(
              alignment: const Alignment(0, 0.8),
              child: Joystick(
                mode: _joystickMode,
                listener: (details) {
                  setState(() {
                    _x = _x + step * details.x;
                    _y = _y + step * details.y;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
