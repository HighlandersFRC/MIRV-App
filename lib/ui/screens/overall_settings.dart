import 'package:flutter/material.dart';
import 'package:test/ui/screens/app_bar_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppBarColor.foregroundColor,
        shadowColor: AppBarColor.shadowColor,
        backgroundColor: AppBarColor.backgroundColor,
        title: const Text(
          "settings",
        ),
      ),
    );
  }
}
