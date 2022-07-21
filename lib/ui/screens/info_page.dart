import 'package:flutter/material.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: AppThemeColor.foregroundColor,
            shadowColor: AppThemeColor.shadowColor,
            backgroundColor: AppThemeColor.backgroundColor,
            title: const Text("About")),
        body: Center(
            child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'About the MIRV Rover: Multi Incident Response Vehicle',
                      style: TextStyle(
                        height: 5,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      )),
                  TextSpan(
                      text:
                          '\nThe Multi Incident Response Vehicle (MIRV) is a rover that can navigate, deploy, and recover road flares from a level 4 autonomous F-150 truck, both autonomously or remote-controlled.\nThe MIRV rover is built using the Robot Operating System (ROS). The rover utilizes cameras, GPS, and LiDAR to retrieve and deploy Pi-Lit flares. The rover is designed to maneuver on rough highway shoulders. The MIRV rover will also operate autonomously or by remote control.',
                      style: TextStyle(
                        height: 2,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      )),
                  TextSpan(
                      text: '\nAbout Neaera Consulting',
                      style: TextStyle(
                        height: 5,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      )),
                  TextSpan(
                      text:
                          '\nNeaera Consulting Group was started in 2004, with an emphasis on Network integration, Security services, and application development in the insurance industry. In the past 5 years, Neaera has moved into the Connected and Automated vehicle industries working with USDOT, WYDOT and other transportation entities.  ',
                      style: TextStyle(
                        height: 2,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        )));
  }
}
