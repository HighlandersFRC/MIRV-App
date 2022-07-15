import 'package:flutter/material.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: AppBarColor.foregroundColor,
            shadowColor: AppBarColor.shadowColor,
            backgroundColor: AppBarColor.backgroundColor,
            title: const Text("info")));
  }
}
