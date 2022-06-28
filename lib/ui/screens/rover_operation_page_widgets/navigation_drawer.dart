import 'package:flutter/material.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/rover_selection_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Container(
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
    );
  }
}
