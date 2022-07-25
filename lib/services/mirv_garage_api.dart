import 'dart:async';
import 'dart:convert';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/services/auth_service.dart';
import 'package:rxdart/subjects.dart';

class MirvGarageApi {
  AuthService authService = AuthService();
  Timer? garageTimer;
  BehaviorSubject<GarageMetrics> periodicMetricUpdates = BehaviorSubject<GarageMetrics>();
  RTCPeerConnection? peerConnection;
  RTCDataChannel? _dataChannel;

  String? _getCurrentAuthToken() {
    return authService.getKeycloakAccessToken();
  }

  Future<GarageMetrics> getGarageMetrics(String garageID) async {
    String? token = _getCurrentAuthToken();
    GarageMetrics garageMetrics = GarageMetrics(garage_id: '', latched: true);
    print(json.encode(garageMetrics.toJson()));

    return garageMetrics;
  }

  Future<List<GarageMetrics>> getGarages() async {
    String? token = _getCurrentAuthToken();
    List<GarageMetrics> garages;
    GarageMetrics garageMetrics = const GarageMetrics(garage_id: '', latched: true);
    String response = '[${json.encode(garageMetrics.toJson())}]';

    garages = (json.decode(response) as List).map((i) => GarageMetrics.fromJson(i)).toList();
    return garages;
  }

  sendGarageCommand(GarageCommand command) {
    print("Sending garage command: ${json.encode(command.toJson())}");
    if (peerConnection?.connectionState == RTCPeerConnectionState.RTCPeerConnectionStateConnected &&
        _dataChannel?.state == RTCDataChannelState.RTCDataChannelOpen) {
      _dataChannel?.send(RTCDataChannelMessage(json.encode(command.toJson())));
    }
  }
}
