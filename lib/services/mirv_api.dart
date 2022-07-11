import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:http/http.dart' as http;

class MirvApi {
  Timer? timer;
  final String ipAdress = 'https://mirvcloudapi.azurewebsites.net';

  BehaviorSubject<RoverMetrics> periodicMetricUpdates =
      BehaviorSubject<RoverMetrics>();

  Future<RoverMetrics> getRoverMetrics(String roverID) async {
    var response = await http.get(Uri.parse("$ipAdress/rovers/$roverID"));
    var roverMetrics = RoverMetrics.fromJson(json.decode(response.body));
    return roverMetrics;
  }

  Future<List<RoverMetrics>> getRovers() async {
    List<RoverMetrics> rovers;
    var response = await http.get(Uri.parse("$ipAdress/rovers"));
    rovers = (json.decode(response.body) as List)
        .map((i) => RoverMetrics.fromJson(i))
        .toList();
    return rovers;
  }

  startPeriodicMetricUpdates(String roverId) {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      getRoverMetrics(roverId)
          .then((value) => periodicMetricUpdates.add(value));
    });
  }

  stopPeriodicMetricUpdates() {
    timer?.cancel();
  }
}
