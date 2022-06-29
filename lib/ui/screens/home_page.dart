import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/overall_settings.dart';
import 'package:test/ui/screens/rover_operation_map.dart';
import 'package:test/ui/screens/rover_selection_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "MIRV App Home",
        ),
      ),
      body: ListView(
        children: [
          buildMenuItem(
              text: 'Rover Selection Page',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0)),
          buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 1)),
          buildMenuItem(
              text: 'About',
              icon: Icons.info_outline_rounded,
              onClicked: () => selectedItem(context, 2)),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
      child: ListTile(
          leading: Icon(icon),
          title: Text(text),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: onClicked),
    );
  }

  selectedItem(context, int index) {
    switch (index) {
      case 0:
        Get.to(RoverSelectionPage());
        break;
      case 1:
        Get.to(SettingsPage());
        break;
      case 2:
        Get.to(InfoPage());
    }
  }
}
