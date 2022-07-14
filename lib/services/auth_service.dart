import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/services/session_storage_service.dart';

class AuthService {
  static AuthService? service;
  SessionStorageService? sessionStorageService;

  getKeycloakAuthEndpoint() {
    return Uri.parse('${getKeycloakEndpoint()}/auth/realms/${getKeycloakRealm()}/protocol/openid-connect/token');
  }

  AuthService() {
    init();
  }
  init() async {
    sessionStorageService = await SessionStorageService.getInstance();
  }

// put apipath here
  static Future<AuthService?> getInstance() async {
    service ??= AuthService();
    return service;
  }

  Future<int> authenticateUser(String username, String password) async {
    var res = await http.post(getKeycloakAuthEndpoint(),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"username": username, "password": password, "client_id": "${getKeycloakClient()}", "grant_type": "password"});

    if (res.statusCode == 200) {
      //copy
      sessionStorageService?.saveAccessToken(res.body);
      return res.statusCode;
      //
    } else {
      debugPrint("An Error Occurred during loggin in. Status code: ${res.statusCode} , body: ${res.body.toString()}");
      return res.statusCode;
    }
  }

  setMirvEndpoint(String endpoint) {
    return sessionStorageService?.saveMirvEndpoint(endpoint);
  }

  setKeycloakEndpoint(String keyCloakEndpoint) {
    return sessionStorageService?.saveKeycloakEndpoint(keyCloakEndpoint);
  }

  setKeycloakRealm(String keyCloakRealm) {
    return sessionStorageService?.saveKeycloakRealm(keyCloakRealm);
  }

  setKeycloakClient(String keyCloakClient) {
    return sessionStorageService?.saveKeycloakClient(keyCloakClient);
  }

  String? getMirvEndpoint() {
    return sessionStorageService?.retrieveMirvEndpoint();
  }

  String? getKeycloakEndpoint() {
    return sessionStorageService?.retrieveKeycloakEndpoint();
  }

  String? getKeycloakRealm() {
    return sessionStorageService?.retrieveKeycloakRealm();
  }

  String? getKeycloakClient() {
    return sessionStorageService?.retrieveKeycloakClient();
  }
}
