import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:test/ui/screens/app_bar_theme.dart';
import 'package:test/ui/screens/settings_language_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
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
      body: SettingsList(sections: [
        SettingsSection(title: Text('General'), tiles: [
          SettingsTile(
              title: Text('Language'),
              leading: Icon(Icons.language),
      // onPressed: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (BuildContext context) => LanguagePage()));
      //           },
          ),
          SettingsTile(
              title: Text('Environment'), leading: Icon(Icons.cloud_queue)),
        ]),
        SettingsSection(
          title: Text('Account'),
          tiles: [
            SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
            SettingsTile(
                title: Text('Sign Out'), leading: Icon(Icons.exit_to_app)),
          ],
        )
      ]),
    );
  }
}
