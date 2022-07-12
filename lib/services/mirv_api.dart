import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:http/http.dart' as http;
import 'package:test/services/session_storage_service.dart';

class MirvApi {
  Timer? timer;
  final String ipAddress = 'http://52.185.79.181:8080';
  SessionStorageService? _sessionStorageService;

  BehaviorSubject<RoverMetrics> periodicMetricUpdates = BehaviorSubject<RoverMetrics>();

  MirvApi() {
    _getSessionStorageService();
  }

  _getSessionStorageService() async {
    _sessionStorageService = await SessionStorageService.getInstance();
  }

  Future<String?> _getCurrentAuthToken() async {
    _sessionStorageService ??= await SessionStorageService.getInstance();
    return _sessionStorageService?.retriveAccessToken();
  }

  Future<RoverMetrics> getRoverMetrics(String roverID) async {
    String? token = await _getCurrentAuthToken();
    var response = await http.get(Uri.parse("$ipAddress/rovers/$roverID"), headers: {'Authorization': 'Bearer $token'});
    var roverMetrics = RoverMetrics.fromJson(json.decode(response.body));
    return roverMetrics;
  }

  Future<List<RoverMetrics>> getRovers() async {
    String? token = await _getCurrentAuthToken();
    List<RoverMetrics> rovers;
    var response = await http.get(Uri.parse("$ipAddress/rovers"), headers: {'Authorization': 'Bearer $token'});
    rovers = (json.decode(response.body) as List).map((i) => RoverMetrics.fromJson(i)).toList();
    return rovers;
  }

  Future<http.StreamedResponse> startRoverConnection(String roverId, RTCSessionDescription? des) async {
    String? token = await _getCurrentAuthToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
      'POST',
      Uri.parse('$ipAddress/rovers/connect'),
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
