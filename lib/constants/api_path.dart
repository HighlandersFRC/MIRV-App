class ApiPath {
  static const baseKeycloakUrl = "http://20.221.15.60:8080";

  static final Uri KEYCLOAK_AUTH = Uri.parse('$baseKeycloakUrl/auth/realms/vtti/protocol/openid-connect/token');
}
