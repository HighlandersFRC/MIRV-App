import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/models/device_health.dart';
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

  Icon _batteryIcon(int? batteryLevel, {int? alertLevel}) {
    double size = 40;
    if (batteryLevel == null) {
      return Icon(Icons.battery_unknown_rounded, size: size);
    }
    double divisor = 100 / 7;
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

  _healthIcon({required DeviceHealthType roverHealthType, required IconData healthIconChoice}) {
    switch (roverHealthType) {
      case DeviceHealthType.degraded:
        return Icon(healthIconChoice, color: Colors.red);
      case DeviceHealthType.unhealthy:
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
              _batteryIcon(roverMetrics!.battery_percent, alertLevel: 20),
              Text("${roverMetrics!.battery_percent}%", style: TextStyle(fontSize: 20)),

              _healthIcon(
                  roverHealthType: roverMetrics!.subsystems.electronics.health, healthIconChoice: Icons.circle), //enconder
              _healthIcon(
                  roverHealthType: roverMetrics!.subsystems.electronics.health, healthIconChoice: Icons.handyman), //mechanical
              _healthIcon(roverHealthType: roverMetrics!.subsystems.general.health, healthIconChoice: Icons.sensors),

              //lidar
              _healthIcon(
                  roverHealthType: roverMetrics!.subsystems.drivetrain.health, healthIconChoice: Icons.camera_alt), //camera
              _healthIcon(
                  roverHealthType: roverMetrics!.subsystems.intake.health, healthIconChoice: Icons.rotate_90_degrees_ccw), //imu
              _healthIcon(roverHealthType: roverMetrics!.subsystems.sensors.health, healthIconChoice: Icons.gps_fixed), //gps
              _healthIcon(roverHealthType: roverMetrics!.subsystems.garage.health, healthIconChoice: Icons.garage), //garage
            ]
          : [],
    );
  }
}
