import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/ui_connection_state.dart';

// ignore: must_be_immutable
class StatusDot extends StatelessWidget {
  StatusDot(
    this.peerConnectionState, {
    Key? key,
  }) : super(key: key) {
    uiConnectionState = Rx<UIConnectionState>(setEnum(peerConnectionState.value));
  }
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

  @override
  Widget build(
    BuildContext context,
  ) {
    peerConnectionState.listen((cs) {
      uiConnectionState.value = setEnum(cs);
      uiConnectionState.trigger(setEnum(cs));
    });

    return Obx(
      () => Icon(Icons.circle, color: uiConnectionState.value.iconColor, size: 35),
    );
  }
}
