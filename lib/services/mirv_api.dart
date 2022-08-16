// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/rover/rover_state.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/ui/screens/login_page.dart';

class MirvApi {
  Timer? garageMetricsUpdatesTimer;
  Rx<GarageMetrics?> garageMetricsObs = Rx<GarageMetrics?>(null);
  AuthService authService = AuthService();
  final Duration _duration = const Duration(seconds: 5);
  BuildContext? buildContext;
  bool unauthorizedDialogOpen = false;

  MirvApi({this.buildContext}) {
    authService.init();
  }

  String? _getCurrentAuthToken() {
    return authService.getKeycloakAccessToken();
  }

  Future<http.Response?> makeAuthenticatedGetRequest(String endpoint,
      {Map<String, String>? additionalHeaders, bool requireLogin = true, snackbarOnError}) async {
    String? token = _getCurrentAuthToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    var response = await http
        .get(
          Uri.parse(endpoint),
          headers: headers,
        )
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => http.Response('Timeout', 408),
        );
    switch (response.statusCode) {
      case 401:
      case 403:
        if (requireLogin && buildContext != null) forceLogin(buildContext!);
        return null;
      case 408:
        Get.snackbar("Timeout", "Request timed out");
        return null;
      default:
        return response;
    }
  }

  Future<bool> testEndpoint(String endpoint) async {
    var response = await http.get(Uri.parse(endpoint)).timeout(
          const Duration(seconds: 5),
          onTimeout: () => http.Response('Timeout', 408),
        );
    return response.statusCode == 200;
  }

  Future<http.Response?> makeAuthenticatedPostRequest(String endpoint, String body,
      {Map<String, String>? additionalHeaders, bool requireLogin = true}) async {
    String? token = _getCurrentAuthToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    var response = await http
        .post(
          Uri.parse(endpoint),
          headers: headers,
          body: body,
        )
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => http.Response('Timeout', 408),
        );

    switch (response.statusCode) {
      case 401:
      case 403:
        if (requireLogin && buildContext != null) forceLogin(buildContext!);
        return null;
      case 408:
        Get.snackbar("Timeout", "Request timed out");
        return null;
      default:
        return response;
    }
  }

  Future<RoverState?> getRoverState(String rover_id) async {
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/rovers/$rover_id");
    if (response == null) return null;
    return RoverState.fromJson(json.decode(response.body));
  }

  Future<List<RoverState>?> getRoverStates() async {
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/rovers");
    if (response == null) return null;
    return (json.decode(response.body) as List).map((i) => RoverState.fromJson(i)).toList();
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

    return request.send().timeout(
          const Duration(seconds: 30),
        );
  }

  //////////////////////////////////////////////////////////////////////////////
  // Garage
  //////////////////////////////////////////////////////////////////////////////

  Future<GarageMetrics?> getGarageMetrics(String? garage_id) async {
    if (garage_id == null) {
      return null;
    }
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/garages/$garage_id");
    if (response == null) return null;
    return response.statusCode == 200 ? GarageMetrics.fromJson(json.decode(response.body)) : null;
  }

  Future<List<GarageMetrics>?> getGarages() async {
    var response = await makeAuthenticatedGetRequest("${authService.getMirvEndpoint()}/garages");
    if (response == null) return null;
    return (json.decode(response.body) as List).map((i) => GarageMetrics.fromJson(i)).toList();
  }

  Future<bool?> sendGarageCommand(String garage_id, GarageCommand command) async {
    var response = await makeAuthenticatedPostRequest(
        "${authService.getMirvEndpoint()}/garages/$garage_id/command", json.encode(command.toJson()),
        additionalHeaders: {'Content-Type': 'application/json'});
    if (response == null) return null;
    return response.statusCode == 200;
  }

  void startGarageMetricUpdates(String garage_id, {int seconds = 5}) {
    garageMetricsUpdatesTimer = Timer.periodic(_duration, (timer) {
      getGarageMetrics(garage_id).then((value) => garageMetricsObs.value = value);
    });
  }

  Future<void> resetGarageMetricsUpdates(String garage_id, {int seconds = 5}) async {
    garageMetricsUpdatesTimer?.cancel();
    garageMetricsUpdatesTimer = Timer.periodic(_duration, (timer) {
      getGarageMetrics(garage_id).then((value) => garageMetricsObs.value = value);
    });
  }

  void stopGarageMetricUpdates() {
    garageMetricsUpdatesTimer?.cancel();
  }

  Future<void> updateGarageState(String garage_id, GarageCommand command) async {
    var tempGarageMetrics = garageMetricsObs.value;
    GarageStateType state = tempGarageMetrics!.state;
    bool lights_on = tempGarageMetrics.lights_on;
    Rx<GarageStateType?> garageStateObs = Rx<GarageStateType?>(state);
    if (command == GarageCommands.unlock) {
      state = GarageStateType.retracted_unlatched;
    } else if (command == GarageCommands.lock) {
      state = GarageStateType.retracted_latched;
    } else if (command == GarageCommands.retract) {
      state = GarageStateType.retracted_latched;
    } else if (command == GarageCommands.deploy) {
      state = GarageStateType.deployed;
    } else if (command == GarageCommands.lightsOff) {
      state = tempGarageMetrics.state;
      lights_on = true;
    } else if (command == GarageCommands.lightsOn) {
      state = tempGarageMetrics.state;
      lights_on = false;
    } else {
      state = GarageStateType.unavailable;
    }
    garageMetricsObs.value = tempGarageMetrics.copyWith(state: state, lights_on: lights_on);
  }

  forceLogin(BuildContext context) {
    unauthorizedDialogOpen = true;

    Get.to(WillPopScope(
      onWillPop: () async => false,
      child: LoginPage(() => Get.back()),
    ));

    unauthorizedDialogOpen = false;
  }
}
