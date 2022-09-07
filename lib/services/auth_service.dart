import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/constants/settings_default.dart';
import 'package:mirv/services/secure_storage_service.dart';

class AuthService {
  static AuthService? service;
  SecureStorageService secureStorageService = SecureStorageService();

  init() async {
    await secureStorageService.applyDefaults();
  }

  Future<Uri> getKeycloakAuthEndpoint() async {
    return Uri.parse('${await getKeycloakEndpoint()}/auth/realms/${await getKeycloakRealm()}/protocol/openid-connect/token');
  }

  Future<Uri> getKeycloakUserInfoEndpoint() async {
    return Uri.parse('${await getKeycloakEndpoint()}/auth/realms/${await getKeycloakRealm()}/protocol/openid-connect/userinfo');
  }

  Future<int> authenticateUser(String username, String password) async {
    try {
      var res = await http.post(await getKeycloakAuthEndpoint(), headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }, body: {
        "username": username,
        "password": password,
        "client_id": await getKeycloakClient(),
        "client_secret": await getKeycloakClientSecret(),
        "grant_type": "password"
      }).timeout(
        const Duration(seconds: 5),
        onTimeout: () => http.Response('Timeout', 408),
      );

      switch (res.statusCode) {
        case 200:
          secureStorageService.saveAccessToken(res.body);
          return res.statusCode;
        default:
          debugPrint("An Error Occurred during loggin in. Status code: ${res.statusCode} , body: ${res.body.toString()}");
          return res.statusCode;
      }
    } on SocketException catch (_) {
      return 408;
    }
  }

  Future<bool> isTokenExpired() async {
    int? expirationDelta = await secureStorageService.retrieveAccessTokenExpiration();
    int? creationTime = await secureStorageService.retrieveAccessTokenCreationDate();
    int currentTime = (DateTime.now().millisecondsSinceEpoch / 1000).round();

    if (expirationDelta == null || creationTime == null) return false;

    return currentTime < creationTime + expirationDelta;
  }

  // Connection closed before full header was received
  Future<bool?> validateToken(Function()? onTimeout) async {
    try {
      String? token = await secureStorageService.retrieveAccessToken();
      var res = await http.post(
        await getKeycloakUserInfoEndpoint(),
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
    } on SocketException catch (_) {
      Get.snackbar("Internet", "No internet connection");
      return null;
    }
  }

  setMirvEndpoint(String endpoint) => secureStorageService.saveCloudEndpoint(endpoint);
  setKeycloakEndpoint(String keyCloakEndpoint) => secureStorageService.saveKeycloakEndpoint(keyCloakEndpoint);
  setKeycloakRealm(String keyCloakRealm) => secureStorageService.saveKeycloakRealm(keyCloakRealm);
  setKeycloakClient(String keyCloakClient) => secureStorageService.saveKeycloakClient(keyCloakClient);
  setUsername(String val) => secureStorageService.saveUsername(val);
  setPassword(String val) => secureStorageService.savePassword(val);
  setKeycloakClientSecret(String val) => secureStorageService.saveKeycloakClientSecret(val);
  setUseStunServer(bool val) => secureStorageService.saveUseStunServer(val);

  Future<String> getMirvEndpoint() async => (await secureStorageService.retrieveCloudEndpoint()) ?? '';
  Future<String> getKeycloakEndpoint() async => (await secureStorageService.retrieveKeycloakEndpoint()) ?? '';
  Future<String> getKeycloakRealm() async => (await secureStorageService.retrieveKeycloakRealm()) ?? '';
  Future<String> getKeycloakClient() async => (await secureStorageService.retrieveKeycloakClient()) ?? '';
  Future<String> getKeycloakClientSecret() async => (await secureStorageService.retrieveKeycloakClientSecret()) ?? '';
  Future<String> getUsername() async => (await secureStorageService.retrieveUsername()) ?? '';
  Future<String> getPassword() async => (await secureStorageService.retrievePassword()) ?? '';
  Future<String?> getKeycloakAccessToken() async => secureStorageService.retrieveAccessToken();
  Future<bool> getUseStunServer() async => (await secureStorageService.retrieveUseStunServer()) ?? SettingsDefaults.useStunServer;
}
