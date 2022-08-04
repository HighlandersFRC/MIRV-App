import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:mirv/ui/screens/garage-pages/garage-selection-page.dart';
import 'package:mirv/ui/screens/info_page.dart';
import 'package:mirv/ui/screens/login_page.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';
import 'package:mirv/ui/screens/settings.dart';

class HomePage extends StatelessWidget {
  final AuthService authService = AuthService();

  HomePage({Key? key}) : super(key: key) {
    authService.init();
  }

  Widget _homeListTile(
    double height,
    String title,
    IconData? icon,
    pageRoute, {
    bool validateLogin: false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10, //height / 20,
        horizontal: 5,
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: homeFontSize),
        ),
        leading: Icon(icon),
        onTap: () async {
          if (validateLogin) {
            if (await isCurrentTokenValid()) {
              Get.to(pageRoute);
            } else {
              Get.to(LoginPage(pageRoute));
            }
          } else {
            Get.to(pageRoute);
          }
        },
      ),
    );
  }

  Future<bool> isCurrentTokenValid() async {
    return authService.validateToken();
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _homeListTile(
                  height,
                  'Rover Selection Page',
                  Icons.people,
                  const RoverSelectionPage(),
                  validateLogin: true,
                ),
                _homeListTile(
                  height,
                  'Garage Selection Page',
                  Icons.garage_rounded,
                  GarageSelectionPage(),
                  validateLogin: true,
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
