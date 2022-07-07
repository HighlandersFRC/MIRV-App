import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_summary.dart';
import 'package:http/http.dart' as http;

class MirvApi {
  Timer? timer;
  String firstRover = "one";
  String secondRover = "two";
  String thirdRover = "three";
  String _authToken = "auth token";
  final String ipAdress = 'http://52.185.111.58:8080';

  BehaviorSubject<RoverMetrics> periodicMetricUpdates = new BehaviorSubject<RoverMetrics>();

  String getAuthToken() {
    _authToken = "new auth token";
    return "auth token";
  }

  Future<RoverMetrics> getRoverMetrics(String roverID) async {
    var response = await http.get(Uri.parse("$ipAdress/rovers/$roverID"));
    var roverMetrics = RoverMetrics.fromJson(json.decode(response.body));
    return roverMetrics;
  }

  Future<List<RoverMetrics>> getRovers() async {
    List<RoverMetrics> rovers;
    var response = await http.get(Uri.parse("$ipAdress/rovers"));
    rovers = (json.decode(response.body) as List).map((i) => RoverMetrics.fromJson(i)).toList();
    return rovers;
  }

  startPeriodicMetricUpdates() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      periodicMetricUpdates.add(RoverMetrics());
      // getRoverMetrics('roverID')
      //   .then((value) => periodicMetricUpdates.add(value))
    });
  }

  stopPeriodicMetricUpdates() {
    timer?.cancel();
  }
}
