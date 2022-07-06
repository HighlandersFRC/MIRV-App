import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/ui/screens/app_bar_theme.dart';
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
      appBar: AppBar(
        foregroundColor: AppBarColor.foregroundColor,
        shadowColor: AppBarColor.shadowColor,
        backgroundColor: AppBarColor.backgroundColor,
        title: const Text(
          "MIRV App Home",
        ),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text('Rover Selection Page'),
              leading: Icon(Icons.people),
              onTap: () {
                Get.to(RoverSelectionPage());
              }),
          ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Get.to(SettingsPage());
              }),
          ListTile(
              title: Text('About'),
              leading: Icon(Icons.info_outline_rounded),
              onTap: () {
                Get.to(InfoPage());
              })
        ],
      ),
    );
  }
}
