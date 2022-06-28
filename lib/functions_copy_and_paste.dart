import 'package:flutter/material.dart';
import 'package:test/ui/screens/home_page.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/overall_settings.dart';
import 'package:test/ui/screens/rover_new_op_page.dart';
import 'package:test/ui/screens/rover_selection_page.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'package:test/ui/screens/troubleshoot_page.dart';

class NavigationRoutes {
  static goSelection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RoverSelectionPage()),
    );
  }

  static goOp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RoverOpPage()),
    );
  }

  static goStatus(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusPage(),
      ),
    );
  }

  static goTrouble(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TroubleShootingPage()),
    );
  }

  static goHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  static goSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  static goInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoPage()),
    );
  }
}
