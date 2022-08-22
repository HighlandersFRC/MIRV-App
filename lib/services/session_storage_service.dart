// ignore_for_file: constant_identifier_names

import 'package:mirv/constants/settings_default.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:mirv/models/auth/token_model.dart';

class SessionStorageService {
  static SharedPreferences? _prefs;
  static const String ACCESS_TOKEN_KEY = "ACCESS_TOKEN";
  static const String ACCESS_TOKEN_CREATION_DATE_KEY = "ACCESS_TOKEN_CREATION_DATE";

  static const String ENDPOINT_TOKEN_KEY = "ENDPOINT_TOKEN";
  static const String KEY_CLOAK_ENDPOINT_TOKEN_KEY = "KEY_CLOAK_ENDPOINT_TOKEN";
  static const String KEY_CLOAK_REALM_TOKEN_KEY = "KEY_CLOAK_REALM_TOKEN";
  static const String KEY_CLOAK_CLIENT_TOKEN_KEY = "KEY_CLOAK_CLIENT_TOKEN";
  static const String KEY_CLOAK_CLIENT_SECRET_KEY = "KEY_CLOAK_CLIENT_SECRET";

  init() async {
    _prefs = await SharedPreferences.getInstance();
    if (retrieveMirvEndpoint() == null) {
      saveMirvEndpoint(SettingsDefaults.endpoint);
    }
    if (retrieveKeycloakEndpoint() == null) {
      saveKeycloakEndpoint(SettingsDefaults.keycloakEndpoint);
    }
    if (retrieveKeycloakRealm() == null) {
      saveKeycloakRealm(SettingsDefaults.keycloakRealm);
    }
    if (retrieveKeycloakClient() == null) {
      saveKeycloakClient(SettingsDefaults.keycloakClient);
    }
    if (retrieveKeycloakClient() == null) {
      saveKeycloakClient(SettingsDefaults.keycloakClientSecret);
    }
  }

  void saveAccessTokenCreationDate(DateTime date) {
    _prefs!.setInt(ACCESS_TOKEN_CREATION_DATE_KEY, (date.millisecondsSinceEpoch / 1000).round());
  }

  int? retrieveAccessTokenCreationDate() {
    return _prefs?.getInt(ACCESS_TOKEN_CREATION_DATE_KEY);
  }

  void saveAccessToken(String accessToken) {
    _prefs!.setString(ACCESS_TOKEN_KEY, accessToken);
    saveAccessTokenCreationDate(DateTime.now());
  }

  String? retrieveAccessToken() {
    var tokenJson = _prefs?.getString(ACCESS_TOKEN_KEY);
    if (tokenJson == null) {
      return null;
    }
    return TokenModel.fromJson(jsonDecode(tokenJson)).accessToken;
  }

  int? retrieveAccessTokenExpiration() {
    var tokenJson = _prefs?.getString(ACCESS_TOKEN_KEY);
    if (tokenJson == null) {
      return null;
    }
    return TokenModel.fromJson(jsonDecode(tokenJson)).expires_in;
  }

  //endpoint
  void saveMirvEndpoint(String endpoint) {
    _prefs!.setString(ENDPOINT_TOKEN_KEY, endpoint);
  }

  String? retrieveMirvEndpoint() {
    return _prefs?.getString(ENDPOINT_TOKEN_KEY);
  }

  void saveKeycloakEndpoint(String keyCloakEndpoint) {
    _prefs!.setString(KEY_CLOAK_ENDPOINT_TOKEN_KEY, keyCloakEndpoint);
  }

  String? retrieveKeycloakEndpoint() {
    return _prefs?.getString(KEY_CLOAK_ENDPOINT_TOKEN_KEY);
  }

  void saveKeycloakRealm(String keyCloakRealm) {
    _prefs!.setString(KEY_CLOAK_REALM_TOKEN_KEY, keyCloakRealm);
  }

  String? retrieveKeycloakRealm() {
    return _prefs?.getString(KEY_CLOAK_REALM_TOKEN_KEY);
  }

  void saveKeycloakClient(String keyCloakClient) {
    _prefs!.setString(KEY_CLOAK_CLIENT_TOKEN_KEY, keyCloakClient);
  }

  String? retrieveKeycloakClient() {
    return _prefs?.getString(KEY_CLOAK_CLIENT_TOKEN_KEY);
  }

  void saveKeycloakClientSecret(String keyCloakClientSecret) {
    _prefs!.setString(KEY_CLOAK_CLIENT_SECRET_KEY, keyCloakClientSecret);
  }

  String? retrieveKeycloakClientSecret() {
    return _prefs?.getString(KEY_CLOAK_CLIENT_SECRET_KEY);
  }
}
