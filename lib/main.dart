import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/login_page.dart';

void main() {
  if (WebRTC.platformIsDesktop) {
    //debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  } else if (WebRTC.platformIsAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
  }
  runApp(
    const GetMaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
