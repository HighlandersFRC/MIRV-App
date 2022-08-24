class TokenModel {
  final String accessToken;
  final String tokenType;
  final int expires_in;
  final String scope;
  final String sessionState;
  final int notBeforePolicy;

  TokenModel({
    required this.accessToken,
    required this.tokenType,
    required this.expires_in,
    required this.scope,
    required this.sessionState,
    required this.notBeforePolicy,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expires_in: json['expires_in'],
      scope: json['scope'],
      sessionState: json['session_state'],
      notBeforePolicy: json['not-before-policy'],
    );
  }
}
