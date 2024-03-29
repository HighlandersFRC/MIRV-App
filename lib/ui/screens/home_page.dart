import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/icons/custom_icons_icons.dart';
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
    bool validateLogin = false,
    double iconSize = 40,
    Image? image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 5,
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: fontSizeHomeMenu),
          ),
        ),
        leading: icon != null ? Icon(icon, size: iconSize) : image,
        onTap: () async {
          if (validateLogin) {
            if (await isCurrentTokenValid() == true) {
              Get.to(pageRoute);
            } else {
              Get.to(LoginPage(() => Get.off(pageRoute)));
            }
          } else {
            Get.to(pageRoute);
          }
        },
      ),
    );
  }

  Future<bool?> isCurrentTokenValid() async {
    return authService.isTokenExpired();
    // return authService.validateToken(() => notificationController.queueNotification("Login", "Error accessing authentication server"));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Rx<bool> isHomePageListMinimized = false.obs;
    isHomePageListMinimized.value = width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text("MIRV App Home", style: TextStyle(fontSize: fontSizeTitle)),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: isHomePageListMinimized.value ? width : width / 2,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _homeListTile(
                    height,
                    'Rover Operation',
                    null,
                    const RoverSelectionPage(),
                    validateLogin: true,
                    image: Image.asset('assets/images/rover_icon_home_page.png', scale: 2),
                  ),
                  _homeListTile(
                    height,
                    'Garage Operation',
                    CustomIcons.warehouse,
                    GarageSelectionPage(),
                    validateLogin: true,
                    iconSize: 30,
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
