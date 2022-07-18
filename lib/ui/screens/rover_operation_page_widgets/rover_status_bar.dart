import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_state_type.dart';

import 'package:mirv/models/rover_health_type.dart';
import 'package:mirv/models/ui_connection_state.dart';

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
    int result = (batteryLevel / divisor).ceil();
    if (alertLevel != null && batteryLevel < alertLevel) {
      return const Icon(Icons.battery_alert_rounded);
    }
    switch (result) {
      case 0:
        return const Icon(Icons.battery_0_bar_rounded);
      case 1:
        return const Icon(Icons.battery_1_bar_rounded);
      case 2:
        return const Icon(Icons.battery_2_bar_rounded);
      case 3:
        return const Icon(Icons.battery_3_bar_rounded);
      case 4:
        return const Icon(Icons.battery_4_bar_rounded);
      case 5:
        return const Icon(Icons.battery_5_bar_rounded);
      case 6:
        return const Icon(Icons.battery_6_bar_rounded);
      default:
        return const Icon(Icons.battery_full_rounded);
    }
  }

  Text _stateText(RoverStateType roverState) {
    switch (roverState) {
      //TODO: implement all new enums so it works well
      case RoverStateType.disconnected:
        return const Text("Disconnected");
      case RoverStateType.autonomous:
        return const Text("Autonomous");
      case RoverStateType.disconnected_fault:
        return const Text("Disconnected with Error");
      case RoverStateType.connected_disabled:
        return const Text("Disabled");
      case RoverStateType.connected_fault:
        return const Text("Connected with Error");
      case RoverStateType.connected_idle_roaming:
        return const Text("Awaiting Orders");
      case RoverStateType.connected_idle_docked:
        return const Text("Docked");
      case RoverStateType.e_stop:
        return const Text("E-Stopped"); //hexagon?
      case RoverStateType.remote_operation:
        return const Text("Controlling");
      default:
        return const Text("Unknown");
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
      print('VALUE  ${uiConnectionState.value.iconColor}');
      uiConnectionState.trigger(setEnum(cs));
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: roverMetrics != null
          ? [
              Obx(
                () => Icon(
                  Icons.circle,
                  color: uiConnectionState.value.iconColor,
                ),
              ),
              _batteryIcon(roverMetrics!.battery),
              _stateText(roverMetrics!.state),

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
