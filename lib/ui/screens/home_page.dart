import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/ui/screens/app_bar_theme.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/overall_settings.dart';
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
              title: const Text('Rover Selection Page'),
              leading: const Icon(Icons.people),
              onTap: () {
                Get.to(const RoverSelectionPage());
              }),
          ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Get.to(SettingsPage());
              }),
          ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.info_outline_rounded),
              onTap: () {
                Get.to(const InfoPage());
              })
        ],
      ),
    );
  }
}
