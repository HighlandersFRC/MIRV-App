import 'package:flutter/material.dart';
import 'package:test/models/rover_summary.dart';
import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/google_map.dart';
import 'package:test/ui/screens/google_map_v2.dart';
import 'package:test/ui/screens/rover_operation_page.dart';

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
                  child: const Icon(Icons.refresh_sharp,
                      size: 50.0, color: Color.fromARGB(199, 30, 0, 0)),
                )),
          ],
        ), //appbar
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            void _pressedButton() {
              late String pageOfRover = "RoverPage${roverList[index]}";
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RoverOperationPage(roverID: roverList[index].roverId)),
              );
            }

            return Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 220),
                    border: Border.all(
                        width: 10, color: Color.fromARGB(255, 250, 250, 250)),
                    borderRadius: const BorderRadius.all(
                        const Radius.elliptical(30, 25))),
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
        ),
          floatingActionButton: FloatingActionButton(onPressed: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MapPage()),
              );
          }),
          child: const Icon(Icons.map),
          ),
        );
  }
}
