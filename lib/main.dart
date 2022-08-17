import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/ui/screens/home_page.dart';

void main() {
  if (WebRTC.platformIsDesktop) {
  } else if (WebRTC.platformIsAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  runApp(
    GetMaterialApp(title: 'MIRV Mobile App', home: HomePage(), theme: overallTheme),
  );
}
