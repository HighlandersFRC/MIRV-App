import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test/ui/screens/rover_selection_page.dart';

void main() {
  runApp(
    const GetMaterialApp(home: MyApp()),
  );
}

// jacob wasn't here

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RoverSelectionPage(),
    );
  }
}

// zoya was here
//hailey was not here but jacob was here too
//hailey

