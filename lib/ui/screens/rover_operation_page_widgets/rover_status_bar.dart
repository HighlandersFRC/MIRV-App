import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_health_type.dart';
import 'package:mirv/models/ui_connection_state.dart';

// ignore: must_be_immutable
class RoverStatusBar extends StatelessWidget {
  RoverStatusBar({
    Key? key,
    required this.roverMetrics,
    required this.peerConnectionState,
  }) : super(key: key) {
    uiConnectionState = Rx<UIConnectionState>(setEnum(peerConnectionState.value));
  }
  final RoverMetrics? roverMetrics;
  final Rx<RTCPeerConnectionState?> peerConnectionState;
  late Rx<UIConnectionState> uiConnectionState;

  setEnum(rtcPeerConnectionState) {
    switch (rtcPeerConnectionState) {
      case RTCPeerConnectionState.RTCPeerConnectionStateFailed:
      case RTCPeerConnectionState.RTCPeerConnectionStateClosed:
      case null:
      case RTCPeerConnectionState.RTCPeerConnectionStateDisconnected:
        return UIConnectionState.disconnected;

      case RTCPeerConnectionState.RTCPeerConnectionStateNew:
      case RTCPeerConnectionState.RTCPeerConnectionStateConnected:
        return UIConnectionState.connected;

      case RTCPeerConnectionState.RTCPeerConnectionStateConnecting:
        return UIConnectionState.connecting;
    }
  }

  Icon _batteryIcon(int batteryLevel, {int? alertLevel}) {
    double divisor = 100 / 7;
    double size = 40;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return Icon(Icons.battery_alert_rounded, size: size);
    }
    switch (result) {
      case 0:
        return Icon(Icons.battery_0_bar_rounded, size: size);
      case 1:
        return Icon(Icons.battery_1_bar_rounded, size: size);
      case 2:
        return Icon(Icons.battery_2_bar_rounded, size: size);
      case 3:
        return Icon(Icons.battery_3_bar_rounded, size: size);
      case 4:
        return Icon(Icons.battery_4_bar_rounded, size: size);
      case 5:
        return Icon(Icons.battery_5_bar_rounded, size: size);
      case 6:
        return Icon(Icons.battery_6_bar_rounded, size: size);
      default:
        return Icon(Icons.battery_full_rounded, size: size);
    }
  }

  _healthIcon({required RoverHealthType roverHealthType, required IconData healthIconChoice}) {
    switch (roverHealthType) {
      case RoverHealthType.degraded:
        return Icon(healthIconChoice, color: Colors.red);
      case RoverHealthType.unhealthy:
        return Icon(healthIconChoice, color: Colors.yellow);
      default:
        return Visibility(visible: false, child: Icon(healthIconChoice));
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    peerConnectionState.listen((cs) {
      uiConnectionState.value = setEnum(cs);
      uiConnectionState.trigger(setEnum(cs));
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: roverMetrics != null
          ? [
              Obx(
                () => Icon(Icons.circle, color: uiConnectionState.value.iconColor, size: 35),
              ),
              _batteryIcon(roverMetrics!.battery_percent),
              Text("${roverMetrics!.battery_percent}%", style: TextStyle(fontSize: 20)),

              _healthIcon(roverHealthType: roverMetrics!.health.electronics, healthIconChoice: Icons.circle), //enconder
              _healthIcon(roverHealthType: roverMetrics!.health.electronics, healthIconChoice: Icons.handyman), //mechanical
              _healthIcon(roverHealthType: roverMetrics!.health.general, healthIconChoice: Icons.sensors),

              //lidar
              _healthIcon(roverHealthType: roverMetrics!.health.drivetrain, healthIconChoice: Icons.camera_alt), //camera
              _healthIcon(roverHealthType: roverMetrics!.health.intake, healthIconChoice: Icons.rotate_90_degrees_ccw), //imu
              _healthIcon(roverHealthType: roverMetrics!.health.sensors, healthIconChoice: Icons.gps_fixed), //gps
              _healthIcon(roverHealthType: roverMetrics!.health.garage, healthIconChoice: Icons.garage), //garage
            ]
          : [],
    );
  }
}
