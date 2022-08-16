import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/services/session_storage_service.dart';

class AuthService {
  static AuthService? service;
  SessionStorageService sessionStorageService = SessionStorageService();

  init() async {
    await sessionStorageService.init();
  }

  getKeycloakAuthEndpoint() {
    return Uri.parse('${getKeycloakEndpoint()}/auth/realms/${getKeycloakRealm()}/protocol/openid-connect/token');
  }

  getKeycloakUserInfoEndpoint() {
    return Uri.parse('${getKeycloakEndpoint()}/auth/realms/${getKeycloakRealm()}/protocol/openid-connect/userinfo');
  }

  Future<int> authenticateUser(String username, String password) async {
    var res = await http.post(getKeycloakAuthEndpoint(),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"username": username, "password": password, "client_id": getKeycloakClient(), "grant_type": "password"}).timeout(
      const Duration(seconds: 5),
      onTimeout: () => http.Response('Timeout', 408),
    );

    switch (res.statusCode) {
      case 200:
        sessionStorageService.saveAccessToken(res.body);
        return res.statusCode;
      default:
        debugPrint("An Error Occurred during loggin in. Status code: ${res.statusCode} , body: ${res.body.toString()}");
        return res.statusCode;
    }
  }

  // Connection closed before full header was received
  Future<bool?> validateToken(Function()? onTimeout) async {
    String? token = sessionStorageService.retriveAccessToken();
    var res = await http.post(
      getKeycloakUserInfoEndpoint(),
      headers: {"Authorization": "Bearer $token"},
      body: {"client_id": "mirv"},
    ).timeout(
      const Duration(seconds: 5),
      onTimeout: () => http.Response('Timeout', 408),
    );
    switch (res.statusCode) {
      case 200:
        return true;
      case 408:
        return null;
      default:
        return false;
    }
  }

  setMirvEndpoint(String endpoint) {
    return sessionStorageService.saveMirvEndpoint(endpoint);
  }

  setKeycloakEndpoint(String keyCloakEndpoint) {
    return sessionStorageService.saveKeycloakEndpoint(keyCloakEndpoint);
  }

  setKeycloakRealm(String keyCloakRealm) {
    return sessionStorageService.saveKeycloakRealm(keyCloakRealm);
  }

  setKeycloakClient(String keyCloakClient) {
    return sessionStorageService.saveKeycloakClient(keyCloakClient);
  }

  String getMirvEndpoint() {
    return sessionStorageService.retrieveMirvEndpoint() ?? '';
  }

  String getKeycloakEndpoint() {
    return sessionStorageService.retrieveKeycloakEndpoint() ?? '';
  }

  String getKeycloakRealm() {
    return sessionStorageService.retrieveKeycloakRealm() ?? '';
  }

  String getKeycloakClient() {
    return sessionStorageService.retrieveKeycloakClient() ?? '';
  }

  String? getKeycloakAccessToken() {
    return sessionStorageService.retriveAccessToken();
  }
}
