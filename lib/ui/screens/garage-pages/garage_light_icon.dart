import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_metrics.dart';

class LightImage extends StatelessWidget {
  final GarageMetrics? garageMetrics;

  LightImage({Key? key, required this.garageMetrics}) : super(key: key);

  Image? updateLightImage(bool lights_on) {
    if (lights_on == true) {
      return Image.asset('assets/images/light_off_close_up.png');
    } else if (lights_on == false) {
      return Image.asset('assets/images/light_on_close_up.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 150, child: updateLightImage(garageMetrics?.lights_on ?? false));
  }
}
