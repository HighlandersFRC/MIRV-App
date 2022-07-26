import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:mirv/ui/screens/info_page.dart';
import 'package:mirv/ui/screens/login_page.dart';
import 'package:mirv/ui/screens/settings.dart';
import 'package:animated_button/animated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppThemeColor.foregroundColor,
        shadowColor: AppThemeColor.shadowColor,
        backgroundColor: AppThemeColor.backgroundColor,
        title: const Text(
          "MIRV App Home",
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.center,
            child: AnimatedButton(
              shape: BoxShape.rectangle,
              height: 64,
              width: 1270,
              color: const Color.fromARGB(255, 216, 219, 222),
              onPressed: () {
                Get.to(LoginPage());
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
              duration: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Rover Selection Page',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.center,
            child: AnimatedButton(
              shape: BoxShape.rectangle,
              height: 64,
              width: 1270,
              color: const Color.fromARGB(255, 216, 219, 222),
              onPressed: () {
                Get.to(SettingsPage());
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
              duration: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.center,
            child: AnimatedButton(
              shape: BoxShape.rectangle,
              height: 64,
              width: 1270,
              color: const Color.fromARGB(255, 216, 219, 222),
              onPressed: () {
                Get.to(const InfoPage());
              },
              enabled: true,
              shadowDegree: ShadowDegree.light,
              duration: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Icon(
                      Icons.info_outlined,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Info',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
