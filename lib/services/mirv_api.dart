import 'dart:convert';

import 'package:test/models/rover_summary.dart';
import 'package:http/http.dart' as http;

class MirvApi {
  String firstRover = "one";
  String secondRover = "two";
  String thirdRover = "three";
  String _authToken = "auth token";

  String getAuthToken() {
    _authToken = "new auth token";
    return "auth token";
  }

  Future<List<RoverSummary>> getRovers() async {
    List<RoverSummary> rovers;
    var response = await http.get(Uri.parse("http://localhost:8000/rovers"));
    rovers = (json.decode(response.body) as List).map((i) => RoverSummary.fromJson(i)).toList();
    return rovers;
  }
}
