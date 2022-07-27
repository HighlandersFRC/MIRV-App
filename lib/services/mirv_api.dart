import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:http/http.dart' as http;

class MirvApi {
  Timer? garageMetricsUpdatesTimer;
  Rx<GarageMetrics?> garageMetricsObs = Rx<GarageMetrics?>(null);
  AuthService authService = AuthService();

  MirvApi() {
    authService.init();
  }

  String? _getCurrentAuthToken() {
    return authService.getKeycloakAccessToken();
  }

  Future<http.Response> makeAuthenticatedGetRequest(String endpoint, {Map<String, String>? additionalHeaders}) async {
    String? token = _getCurrentAuthToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    var response = await http.get(
      Uri.parse(endpoint),
      headers: headers,
    );

    switch (response.statusCode) {
      case 401:
      case 403:
        throw UnauthorizedException();
      default:
        return response;
    }
  }

  Future<bool> testEndpoint(String endpoint) async {
    try {
      var response = await http.get(Uri.parse(endpoint)).timeout(const Duration(seconds: 2));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<http.Response> makeAuthenticatedPostRequest(String endpoint, String body,
      {Map<String, String>? additionalHeaders}) async {
    String? token = _getCurrentAuthToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    var response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: body,
    );

    switch (response.statusCode) {
      case 401:
      case 403:
        throw UnauthorizedException();
      default:
        return response;
    }
  }

  Future<RoverMetrics> getRoverMetrics(String rover_id) async {
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/rovers/$rover_id");
    return RoverMetrics.fromJson(json.decode(response.body));
  }

  Future<List<RoverMetrics>> getRovers() async {
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/rovers");
    return (json.decode(response.body) as List).map((i) => RoverMetrics.fromJson(i)).toList();
  }

  Future<http.StreamedResponse> startRoverConnection(String rover_id, RTCSessionDescription? des) async {
    String? token = _getCurrentAuthToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
      'POST',
      Uri.parse('${authService.getMirvEndpoint()}/rovers/connect'),
    );
    request.body = json.encode({
      "connection_id": "string",
      "rover_id": rover_id,
      "offer": {
        "sdp": des!.sdp,
        "type": des.type,
        "video_transform": "none",
      }
    });
    request.headers.addAll(headers);

    return request.send();
  }

  //////////////////////////////////////////////////////////////////////////////
  // Garage
  //////////////////////////////////////////////////////////////////////////////
  Future<GarageMetrics> getGarageMetrics(String garage_id) async {
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/garages/$garage_id");
    return GarageMetrics.fromJson(json.decode(response.body));
  }

  Future<List<GarageMetrics>> getGarages() async {
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/garages");
    return (json.decode(response.body) as List).map((i) => GarageMetrics.fromJson(i)).toList();
  }

  Future<bool> sendGarageCommand(String garage_id, GarageCommand command) async {
    var response = await makeAuthenticatedPostRequest(
      "${authService.getMirvEndpoint()}/garages/$garage_id/command",
      json.encode(command.toJson()),
      additionalHeaders: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  void startGarageMetricUpdates(String garage_id, {int seconds = 5}) {
    garageMetricsUpdatesTimer = Timer.periodic(Duration(seconds: seconds), (timer) {
      getGarageMetrics(garage_id).then((value) => garageMetricsObs.value = value);
    });
  }

  void stopGarageMetricUpdates() {
    garageMetricsUpdatesTimer?.cancel();
  }
}
