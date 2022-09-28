// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:mirv/models/garage/garage_commands.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_state_type.dart';
import 'package:mirv/models/pair.dart';
import 'package:mirv/models/rover/rover_state.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/ui/screens/login_page.dart';

import 'package:mirv/main.dart';

class MirvApi {
  Timer? garageMetricsUpdatesTimer;
  Rx<GarageMetrics?> garageMetricsObs = Rx<GarageMetrics?>(null);
  AuthService authService = AuthService();
  final Duration _duration = const Duration(seconds: 5);
  BuildContext? buildContext;
  bool loginDialogOpen = false;
  bool garageUpdatesActive = false;

  MirvApi({this.buildContext}) {
    authService.init();
  }

  Future<String?> _getCurrentAuthToken() async {
    return await authService.getKeycloakAccessToken();
  }

  Future<http.Response?> makeAuthenticatedGetRequest(String endpoint,
      {Map<String, String>? additionalHeaders, bool requireLogin = true, snackbarOnError}) async {
    String? token = await _getCurrentAuthToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    try {
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
        // case 408:
        //   notificationController.queueNotification("Timeout", "Request timed out");
        //   return null;
        default:
          return response;
      }
    } on SocketException catch (_) {
      notificationController.queueNotification("Internet", "No internet connection");
      return null;
    }
  }

  Future<bool> testEndpoint(String endpoint) async {
    try {
      var response = await http.get(Uri.parse(endpoint)).timeout(
            const Duration(seconds: 5),
            onTimeout: () => http.Response('Timeout', 408),
          );
      return response.statusCode == 200;
    } on SocketException catch (_) {
      notificationController.queueNotification("Internet", "No internet connection");
      return false;
    }
  }

  Future<http.Response?> makeAuthenticatedPostRequest(String endpoint, String body,
      {Map<String, String>? additionalHeaders, bool requireLogin = true}) async {
    String? token = await _getCurrentAuthToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }
    try {
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
        // case 408:
        //   notificationController.queueNotification("Timeout", "Request timed out");
        //   return null;
        default:
          return response;
      }
    } on SocketException catch (_) {
      notificationController.queueNotification("Internet", "No internet connection");
      return null;
    }
  }

  Future<RoverState?> getRoverState(String rover_id) async {
    if (loginDialogOpen) return null;
    var response = await makeAuthenticatedGetRequest("${await authService.getMirvEndpoint()}/rovers/$rover_id");
    if (response == null) return null;
    return RoverState.fromJson(json.decode(response.body));
  }

  Future<List<RoverState>?> getRoverStates() async {
    if (loginDialogOpen) return null;
    var response = await makeAuthenticatedGetRequest("${await authService.getMirvEndpoint()}/rovers");
    if (response == null) return null;
    return (json.decode(response.body) as List).map((i) => RoverState.fromJson(i)).toList();
  }

  Future<http.StreamedResponse> startRoverConnection(String rover_id, RTCSessionDescription? des) async {
    String? token = await _getCurrentAuthToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
      'POST',
      Uri.parse('${await authService.getMirvEndpoint()}/rovers/connect'),
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
    if (loginDialogOpen) return null;
    if (garage_id == null) {
      return null;
    }
    var response = await makeAuthenticatedGetRequest("${await authService.getMirvEndpoint()}/garages/$garage_id");
    if (response == null) return null;
    return response.statusCode == 200 ? GarageMetrics.fromJson(json.decode(response.body)) : null;
  }

  Future<List<GarageMetrics>?> getGarages() async {
    if (loginDialogOpen) return null;
    var response = await makeAuthenticatedGetRequest("${await authService.getMirvEndpoint()}/garages");
    if (response == null) return null;
    return (json.decode(response.body) as List).map((i) => GarageMetrics.fromJson(i)).toList();
  }

  Future<bool?> sendGarageCommand(String garage_id, GarageCommand command) async {
    if (loginDialogOpen) return false;
    var response = await makeAuthenticatedPostRequest(
        "${await authService.getMirvEndpoint()}/garages/$garage_id/command", json.encode(command.toJson()),
        additionalHeaders: {'Content-Type': 'application/json'});
    if (response == null) return null;
    updateGarageMetrics(garage_id);
    return response.statusCode == 200;
  }

  void updateGarageMetrics(String garage_id) {
    if (loginDialogOpen) return;
    getGarageMetrics(garage_id).then((value) => garageMetricsObs.value = value);
  }

  void startGarageMetricUpdates(String garage_id, {int seconds = 5}) {
    if (garageUpdatesActive) return;
    garageUpdatesActive = true;
    garageMetricsUpdatesTimer = Timer.periodic(_duration, (timer) {
      if (loginDialogOpen) return;
      updateGarageMetrics(garage_id);
    });
  }

  Future<void> resetGarageMetricsUpdates(String garage_id, {int seconds = 5}) async {
    garageMetricsUpdatesTimer?.cancel();
    garageMetricsUpdatesTimer = Timer.periodic(_duration, (timer) {
      if (loginDialogOpen) return;
      getGarageMetrics(garage_id).then((value) => garageMetricsObs.value = value);
    });
  }

  void stopGarageMetricUpdates() {
    garageMetricsUpdatesTimer?.cancel();
  }

  Future<void> updateGarageState(String garage_id, GarageCommand command) async {
    var tempGarageMetrics = garageMetricsObs.value;
    if (tempGarageMetrics == null) return;

    GarageStateType state = tempGarageMetrics.state;
    bool lights_on = tempGarageMetrics.lights_on;
    if (command == GarageCommands.unlock) {
      state = GarageStateType.retracted_unlatched;
    } else if (command == GarageCommands.lock) {
      state = GarageStateType.retracted_latched;
    } else if (command == GarageCommands.retract) {
      state = GarageStateType.in_motion_retract;
    } else if (command == GarageCommands.deploy) {
      state = GarageStateType.in_motion_deploy;
    } else if (command == GarageCommands.stop) {
      state = GarageStateType.unavailable;
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
    loginDialogOpen = true;

    Get.to(WillPopScope(
      onWillPop: () async => false,
      child: LoginPage(() => Get.back()),
    ));

    loginDialogOpen = false;
  }

  Future<String?> getDeviceId() async {
    String username = await authService.getUsername();
    var deviceInfo = DeviceInfoPlugin();
    String? deviceId;
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id;
    }
    return '$username-$deviceId';
  }
}
