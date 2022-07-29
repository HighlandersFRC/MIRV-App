import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/info_page.dart';
import 'package:mirv/ui/screens/login_page.dart';
import 'package:mirv/ui/screens/garage-pages/garage-selection-page.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';
import 'package:mirv/ui/screens/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MIRV App Home",
        ),
      ),
      body: ListView(
        children: [
          ListTile(
              title: const Text(
                'Rover Selection Page',
              ),
              leading: const Icon(Icons.people),
              onTap: () {
                Get.to(LoginPage(RoverSelectionPage()));
              }),
          ListTile(
              title: const Text('Garage Selection Page'),
              leading: const Icon(Icons.people),
              onTap: () {
                Get.to(LoginPage(GarageSelectionPage()));
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
              }),
        ],
      ),
    );
  }
}
