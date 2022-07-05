import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/ui/screens/app_bar_theme.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: AppBarColor.foregroundColor,
            shadowColor: AppBarColor.shadowColor,
            backgroundColor: AppBarColor.backgroundColor,
            title: Text("info")));
  }
}
