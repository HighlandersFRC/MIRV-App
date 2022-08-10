// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:mirv/models/auth/token_model.dart';

class SessionStorageService {
  static SharedPreferences? _prefs;
  static const String ACCESS_TOKEN_KEY = "ACCESS_TOKEN";

  static const String ENDPOINT_TOKEN_KEY = "ENDPOINT_TOKEN";
  static const String KEY_CLOAK_ENDPOINT_TOKEN_KEY = "KEY_CLOAK_ENDPOINT_TOKEN";
  static const String KEY_CLOAK_REALM_TOKEN_KEY = "KEY_CLOAK_REALM_TOKEN";
  static const String KEY_CLOAK_CLIENT_TOKEN_KEY = "KEY_CLOAK_CLIENT_TOKEN";

//call init everytime with class
  init() async {
    _prefs = await SharedPreferences.getInstance();
    if (retrieveMirvEndpoint() == null) {
      saveMirvEndpoint('http://20.237.58.76:8080');
    }
    if (retrieveKeycloakEndpoint() == null) {
      saveKeycloakEndpoint('http://20.232.252.236:8080');
    }
    if (retrieveKeycloakRealm() == null) {
      saveKeycloakRealm('vtti');
    }
    if (retrieveKeycloakClient() == null) {
      saveKeycloakClient('users');
    }
  }

  void saveAccessToken(String accessToken) {
    _prefs!.setString(ACCESS_TOKEN_KEY, accessToken);
  }

  String? retriveAccessToken() {
    var tokenJson = _prefs?.getString(ACCESS_TOKEN_KEY);
    if (tokenJson == null) {
      return null;
    }
    return TokenModel.fromJson(jsonDecode(tokenJson)).accessToken;
  }

//endpoint
  void saveMirvEndpoint(String endpoint) {
    _prefs!.setString(ENDPOINT_TOKEN_KEY, endpoint);
  }

  String? retrieveMirvEndpoint() {
    return _prefs?.getString(ENDPOINT_TOKEN_KEY);
  }

//KeyCloakEndpoint
  void saveKeycloakEndpoint(String keyCloakEndpoint) {
    _prefs!.setString(KEY_CLOAK_ENDPOINT_TOKEN_KEY, keyCloakEndpoint);
  }

  String? retrieveKeycloakEndpoint() {
    return _prefs?.getString(KEY_CLOAK_ENDPOINT_TOKEN_KEY);
  }

//KeyCloakRealm
  void saveKeycloakRealm(String keyCloakRealm) {
    _prefs!.setString(KEY_CLOAK_REALM_TOKEN_KEY, keyCloakRealm);
  }

  String? retrieveKeycloakRealm() {
    return _prefs?.getString(KEY_CLOAK_REALM_TOKEN_KEY);
  }

//KeyCloakClient
  void saveKeycloakClient(String keyCloakClient) {
    _prefs!.setString(KEY_CLOAK_CLIENT_TOKEN_KEY, keyCloakClient);
  }

//SPELLING
  String? retrieveKeycloakClient() {
    return _prefs?.getString(KEY_CLOAK_CLIENT_TOKEN_KEY);
  }
}
