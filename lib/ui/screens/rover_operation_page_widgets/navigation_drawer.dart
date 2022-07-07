import 'package:flutter/material.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/rover_selection_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            onPressed: () {
              Get.to(const RoverSelectionPage());
            },
            child: const Text(
              "Go To Selection",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.left,
              style: TextStyle(color: Color.fromARGB(150, 0, 0, 0), fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        ListTile(
          title: TextButton(
            onPressed: () {
              Get.to(const StatusPage());
            },
            child: const Text(
              "Go To Status",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.left,
              style: TextStyle(color: Color.fromARGB(150, 0, 0, 0), fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        ListTile(
          title: TextButton(
            onPressed: () {
              Get.to(const TroubleShootingPage());
            },
            child: const Text(
              "Go To Troubleshooting",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.left,
              style: TextStyle(color: Color.fromARGB(150, 0, 0, 0), fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        ListTile(
          title: TextButton(
            onPressed: () {
              Get.to(const HomePage());
            },
            child: const Text(
              "Go Home",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.left,
              style: TextStyle(color: Color.fromARGB(150, 0, 0, 0), fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        ListTile(
          title: TextButton(
            onPressed: () {
              Get.to(const InfoPage());
            },
            child: const Text(
              "Go To Info",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.left,
              style: TextStyle(color: Color.fromARGB(150, 0, 0, 0), fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
    );
  }
}
