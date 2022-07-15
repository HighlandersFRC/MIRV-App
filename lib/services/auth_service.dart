import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/constants/api_path.dart';
import 'package:mirv/services/session_storage_service.dart';

class AuthService {
  static AuthService? service;
  static const baseKeycloakUrl = "http://20.221.15.60:8080";

  static final Uri KEYCLOAK_USER_INFO = Uri.parse('$baseKeycloakUrl/auth/realms/vtti/protocol/openid-connect/userinfo');

  static Future<AuthService?> getInstance() async {
    service ??= AuthService();
    return service;
  }

  Future<int> authenticateUser(String username, String password) async {
    var res = await http.post(ApiPath.KEYCLOAK_AUTH,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"username": username, "password": password, "client_id": "mirv", "grant_type": "password"});

    if (res.statusCode == 200) {
      var sessionStorageService = await SessionStorageService.getInstance();
      sessionStorageService.saveAccessToken(res.body);
      return res.statusCode;
    } else {
      debugPrint("An Error Occurred during loggin in. Status code: ${res.statusCode} , body: ${res.body.toString()}");
      return res.statusCode;
    }
  }

  Future<bool> validateToken() async {
    var sessionStorageService = await SessionStorageService.getInstance();
    String? token = sessionStorageService.retriveAccessToken();
    var res = await http.post(KEYCLOAK_USER_INFO, headers: {"Authorization": "Bearer $token"}, body: {"client_id": "mirv"});
    return res.statusCode == 200 ? true : false;
  }
}
