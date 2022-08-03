
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
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
  final double iconSize = 40;

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

  IconData _batteryIcon(int? batteryLevel, {int? alertLevel}) {
    double size = 40;
    if (batteryLevel == null) {
      return Icons.battery_unknown_rounded;
    }
    double divisor = 100 / 7;
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return Icons.battery_alert_rounded;
    }
    switch (result) {
      case 0:
        return Icons.battery_0_bar_rounded;
      case 1:
        return Icons.battery_1_bar_rounded;
      case 2:
        return Icons.battery_2_bar_rounded;
      case 3:
        return Icons.battery_3_bar_rounded;
      case 4:
        return Icons.battery_4_bar_rounded;
      case 5:
        return Icons.battery_5_bar_rounded;
      case 6:
        return Icons.battery_6_bar_rounded;
      default:
        return Icons.battery_full_rounded;
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
              Icon(_batteryIcon(roverMetrics!.battery_percent, alertLevel: 20), size: iconSize, color: primaryColor),
              Text("${roverMetrics!.battery_percent}%", style: const TextStyle(fontSize: 20, color: fontColor)),
              _healthIcon(roverHealthType: roverMetrics!.subsystems.electronics.health, healthIconChoice: Icons.bolt),
              _healthIcon(roverHealthType: roverMetrics!.subsystems.power.health, healthIconChoice: Icons.power),
              _healthIcon(roverHealthType: roverMetrics!.subsystems.general.health, healthIconChoice: Icons.smart_toy_outlined),
              _healthIcon(roverHealthType: roverMetrics!.subsystems.drivetrain.health, healthIconChoice: Icons.handyman),
              _healthIcon(roverHealthType: roverMetrics!.subsystems.intake.health, healthIconChoice: Icons.rotate_90_degrees_ccw),
              _healthIcon(roverHealthType: roverMetrics!.subsystems.sensors.health, healthIconChoice: Icons.sensors),
              _healthIcon(roverHealthType: roverMetrics!.subsystems.garage.health, healthIconChoice: Icons.garage),
            ]
          : [],
    );
  }
}
