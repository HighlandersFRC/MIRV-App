import 'package:flutter/material.dart';
import 'package:mirv/models/garage/garage_metrics.dart';

class LightImage extends StatelessWidget {
  final GarageMetrics? garageMetrics;
  final double width;

  const LightImage({Key? key, required this.garageMetrics, this.width = 60}) : super(key: key);

  Image? updateLightImage(bool lightsOn) {
    if (lightsOn) {
      return Image.asset('assets/images/light_off_close_up.png', width: width);
    } else {
      return Image.asset('assets/images/light_on_close_up.png', width: width);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 150, child: updateLightImage(garageMetrics?.lights_on ?? false));
  }
}
