import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/services/session_storage_service.dart';

class MirvApi {
  Timer? timer;
  SessionStorageService? _sessionStorageService;

  BehaviorSubject<RoverMetrics> periodicMetricUpdates = BehaviorSubject<RoverMetrics>();
  AuthService authService = AuthService();

  String? _getCurrentAuthToken() {
    return authService.getKeycloakAccessToken();
  }

  Future<RoverMetrics> getRoverMetrics(String roverID) async {
    String? token = _getCurrentAuthToken();
    var response = await http
        .get(Uri.parse("${authService.getMirvEndpoint()}/rovers/$roverID"), headers: {'Authorization': 'Bearer $token'});
    var roverMetrics = RoverMetrics.fromJson(json.decode(response.body));
    return roverMetrics;
  }

  Future<List<RoverMetrics>> getRovers() async {
    String? token = _getCurrentAuthToken();
    List<RoverMetrics> rovers;
    var response =
        await http.get(Uri.parse("${authService.getMirvEndpoint()}/rovers"), headers: {'Authorization': 'Bearer $token'});
    rovers = (json.decode(response.body) as List).map((i) => RoverMetrics.fromJson(i)).toList();
    return rovers;
  }

  Future<http.StreamedResponse> startRoverConnection(String roverId, RTCSessionDescription? des) async {
    String? token = _getCurrentAuthToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
      'POST',
      Uri.parse('${authService.getMirvEndpoint()}/rovers/connect'),
    );
    request.body = json.encode({
      "connection_id": "string",
      "rover_id": roverId,
      "offer": {
        "sdp": des!.sdp,
        "type": des.type,
        "video_transform": "none",
      }
    });
    request.headers.addAll(headers);

    return request.send();
  }

  startPeriodicMetricUpdates(String roverId) {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      getRoverMetrics(roverId).then((value) => periodicMetricUpdates.add(value));
    });
  }

  stopPeriodicMetricUpdates() {
    timer?.cancel();
  }
}
