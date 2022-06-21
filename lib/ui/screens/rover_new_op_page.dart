import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/rover_selection_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
          size: 40,
        ),
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: const Text(
          "Rover Manual Control",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1.75,
        ),
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
          ],
        ),
      ),
    );
  }
}
