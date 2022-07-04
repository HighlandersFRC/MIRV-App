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

  BehaviorSubject<RoverMetrics> periodicMetricUpdates = new BehaviorSubject<RoverMetrics>();

  String getAuthToken() {
    _authToken = "new auth token";
    return "auth token";
  }

  Future<RoverMetrics> getRoverMetrics(String roverID) async {
    var response = await http.get(Uri.parse("http://172.250.250.213:8000/rovers/$roverID"));
    String lol =
        '{"roverId":"rover1","state":"docked","status":"available","battery":22,"health":{"electronics":"healthy","drivetrain":"unavailable","intake":"healthy","sensors":"healthy","garage":"degraded","power":"unavailable","general":"degraded"},"telemetry":{"location":{"long":-104.969454,"lat":40.474101},"heading":149.68,"speed":12.62}}';

    var roverMetrics = RoverMetrics.fromJson(json.decode(response.body));
    return roverMetrics;
  }

  Future<List<RoverSummary>> getRovers() async {
    List<RoverSummary> rovers;
    var response = await http.get(Uri.parse("http://172.250.250.213:8000/rovers"));
    rovers = (json.decode(response.body) as List).map((i) => RoverSummary.fromJson(i)).toList().obs;
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
