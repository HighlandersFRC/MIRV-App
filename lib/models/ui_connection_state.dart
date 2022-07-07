import 'package:flutter/material.dart';

enum UIConnectionState { connected, connecting, disconnected, unavailable }

extension UIConnectionStateIconColor on UIConnectionState {
  Color get iconColor {
    var connected = Colors.green;
    var inProcceseOfConnecting = Colors.yellow;
    var disconnected = Colors.red;
    var unavailable = Colors.grey;
    switch (this) {
      case UIConnectionState.connected:
        return connected;
      case UIConnectionState.connecting:
        return inProcceseOfConnecting;
      case UIConnectionState.disconnected:
        return disconnected;
      case UIConnectionState.unavailable:
        return unavailable;
    }
  }
}
