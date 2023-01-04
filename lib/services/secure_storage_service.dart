// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mirv/constants/settings_default.dart';
import 'package:mirv/models/auth/token_model.dart';
import 'package:mirv/models/bool_parse.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
  static const String ACCESS_TOKEN_KEY = "ACCESS_TOKEN";
  static const String ACCESS_TOKEN_CREATION_DATE_KEY = "ACCESS_TOKEN_CREATION_DATE";

  static const String USERNAME_KEY = "USERNAME";
  static const String PASSWORD_KEY = "PASSWORD";
  static const String CLOUD_ENDPOINT_TOKEN_KEY = "CLOUD_ENDPOINT_TOKEN";
  static const String KEYCLOAK_ENDPOINT_TOKEN_KEY = "KEYCLOAK_ENDPOINT_TOKEN";
  static const String KEYCLOAK_REALM_TOKEN_KEY = "KEYCLOAK_REALM_TOKEN";
  static const String KEYCLOAK_CLIENT_TOKEN_KEY = "KEYCLOAK_CLIENT_TOKEN";
  static const String KEYCLOAK_CLIENT_SECRET_KEY = "KEY_CLOAK_CLIENT_SECRET";
  static const String USE_STUN_SERVER_KEY = "USE_STUN_SERVER";
  static const String USE_KEYCLOAK_KEY = "USE_KEYCLOAK";

  applyDefaults() async {
    if (await retrieveCloudEndpoint() == null) {
      saveCloudEndpoint(SettingsDefaults.endpoint);
    }
    if (await retrieveKeycloakEndpoint() == null) {
      saveKeycloakEndpoint(SettingsDefaults.keycloakEndpoint);
    }
    if (await retrieveKeycloakRealm() == null) {
      saveKeycloakRealm(SettingsDefaults.keycloakRealm);
    }
    if (await retrieveKeycloakClient() == null) {
      saveKeycloakClient(SettingsDefaults.keycloakClient);
    }
  }

  void saveUsername(String val) async => await _storage.write(key: USERNAME_KEY, value: val);
  void savePassword(String val) async => await _storage.write(key: PASSWORD_KEY, value: val);
  void saveCloudEndpoint(String val) async => await _storage.write(key: CLOUD_ENDPOINT_TOKEN_KEY, value: val);
  void saveKeycloakEndpoint(String val) async => await _storage.write(key: KEYCLOAK_ENDPOINT_TOKEN_KEY, value: val);
  void saveKeycloakRealm(String val) async => await _storage.write(key: KEYCLOAK_REALM_TOKEN_KEY, value: val);
  void saveKeycloakClient(String val) async => await _storage.write(key: KEYCLOAK_CLIENT_TOKEN_KEY, value: val);
  void saveKeycloakClientSecret(String val) async => await _storage.write(key: KEYCLOAK_CLIENT_SECRET_KEY, value: val);
  void saveUseStunServer(bool val) async => await _storage.write(key: USE_STUN_SERVER_KEY, value: val.toString());
  void saveUseKeycloak(bool val) async => await _storage.write(key: USE_KEYCLOAK_KEY, value: val.toString());

  void saveAccessToken(String val) async {
    await _storage.write(key: ACCESS_TOKEN_KEY, value: val);
    saveAccessTokenCreationDate(DateTime.now());
  }

  void saveAccessTokenCreationDate(DateTime date) async {
    await _storage.write(key: ACCESS_TOKEN_CREATION_DATE_KEY, value: (date.millisecondsSinceEpoch / 1000).round().toString());
  }

  Future<String?> retrieveUsername() async => await _storage.read(key: USERNAME_KEY);
  Future<String?> retrievePassword() async => await _storage.read(key: PASSWORD_KEY);
  Future<String?> retrieveCloudEndpoint() async => await _storage.read(key: CLOUD_ENDPOINT_TOKEN_KEY);
  Future<String?> retrieveKeycloakEndpoint() async => await _storage.read(key: KEYCLOAK_ENDPOINT_TOKEN_KEY);
  Future<String?> retrieveKeycloakRealm() async => await _storage.read(key: KEYCLOAK_REALM_TOKEN_KEY);
  Future<String?> retrieveKeycloakClient() async => await _storage.read(key: KEYCLOAK_CLIENT_TOKEN_KEY);
  Future<String?> retrieveKeycloakClientSecret() async => await _storage.read(key: KEYCLOAK_CLIENT_SECRET_KEY);
  Future<bool?> retrieveUseStunServer() async => parseBool(await _storage.read(key: USE_STUN_SERVER_KEY));
  Future<bool?> retrieveUseKeycloak() async => parseBool(await _storage.read(key: USE_KEYCLOAK_KEY));

  Future<String?> retrieveAccessToken() async {
    try {
      var tokenJson = await _storage.read(key: ACCESS_TOKEN_KEY);
      return TokenModel.fromJson(jsonDecode(tokenJson!)).accessToken;
    } catch (_) {
      return null;
    }
  }

  Future<int?> retrieveAccessTokenExpiration() async {
    try {
      var tokenJson = await _storage.read(key: ACCESS_TOKEN_KEY);
      return TokenModel.fromJson(jsonDecode(tokenJson!)).expires_in;
    } catch (_) {
      return null;
    }
  }

  Future<int?> retrieveAccessTokenCreationDate() async {
    try {
      return int.tryParse((await _storage.read(key: ACCESS_TOKEN_CREATION_DATE_KEY))!);
    } catch (_) {
      return null;
    }
  }
}
