import 'dart:convert';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_summary.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/services/auth_service.dart';

class MirvGarageApi {
  AuthService authService = AuthService();

  String? _getCurrentAuthToken() {
    return authService.getKeycloakAccessToken();
  }

  Future<GarageMetrics> getGarageMetrics() async {
    String? token = _getCurrentAuthToken();
    GarageMetrics garageMetrics = GarageMetrics();
    print(json.encode(garageMetrics.toJson()));

    return garageMetrics;
  }

  Future<List<GarageMetrics>> getGarages() async {
    String? token = _getCurrentAuthToken();
    List<GarageMetrics> garages;
    GarageMetrics garageMetrics = const GarageMetrics();
    String response = '[${json.encode(garageMetrics.toJson())}]';

    garages = (json.decode(response) as List).map((i) => GarageMetrics.fromJson(i)).toList();
    return garages;
  }
}
