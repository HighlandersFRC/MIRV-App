import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/ui/screens/garage-pages/garage-selection-page.dart';
import 'package:mirv/ui/screens/info_page.dart';
import 'package:mirv/ui/screens/login_page.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';
import 'package:mirv/ui/screens/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Padding _homeListTile(
    double height,
    String title,
    IconData? icon,
    pageRoute,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 20, horizontal: 5),
      child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: homeFontSize),
          ),
          leading: Icon(icon),
          onTap: () {
            Get.to(pageRoute);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    Rx<bool> isHomePageListMinimized = false.obs;
    isHomePageListMinimized.value = width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MIRV App Home",
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: isHomePageListMinimized.value ? width : width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _homeListTile(
                  height,
                  'Rover Selection Page',
                  Icons.people,
                  LoginPage(const RoverSelectionPage()),
                ),
                _homeListTile(
                  height,
                  'Garage Selection Page',
                  Icons.garage_rounded,
                  LoginPage(GarageSelectionPage()),
                ),
                _homeListTile(
                  height,
                  'Settings',
                  Icons.settings,
                  SettingsPage(),
                ),
                _homeListTile(
                  height,
                  'About',
                  Icons.info_outline_rounded,
                  const InfoPage(),
                )
              ],
            ),
          ),
          Expanded(
            child: isHomePageListMinimized.value
                ? const SizedBox()
                : SizedBox(
                    child: Image.asset(
                      'assets/images/mars_rover_new.png',
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
