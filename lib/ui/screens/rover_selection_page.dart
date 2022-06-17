import 'package:flutter/material.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/rover_operation_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';

class RoverSelectionPage extends StatefulWidget {
  const RoverSelectionPage({Key? key}) : super(key: key);

  @override
  State<RoverSelectionPage> createState() => _RoverSelectionPageState();
}

class _RoverSelectionPageState extends State<RoverSelectionPage> {
  List<RoverSummary> roverList = <RoverSummary>[];
  MirvApi mirvApi = MirvApi();

  void _refreshRoversList() async {
    roverList = await mirvApi.getRovers();
    setState(
      () {
        roverList;
      },
    );
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
    _refreshRoversList();
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
              child: const Icon(
                Icons.refresh_sharp,
                size: 50.0,
                color: Color.fromARGB(199, 30, 0, 0),
              ),
            ),
          ),
        ],
        leading: ElevatedButton(
            onPressed: _testButton, child: Icon(Icons.info_sharp)),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          void _pressedButton() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RoverOperationPage(roverID: roverList[index].roverId),
              ),
            );
          }

          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 220, 220, 220),
              border: Border.all(
                width: 10,
                color: const Color.fromARGB(255, 250, 250, 250),
              ),
              borderRadius: const BorderRadius.all(
                Radius.elliptical(30, 25),
              ),
            ),
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
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: true),
              ),
            ),
          );
        },
        itemCount: roverList.length,
      ),
    );
  }
}
