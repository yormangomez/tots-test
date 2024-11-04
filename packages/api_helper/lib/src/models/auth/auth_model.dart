class AuthModel {
  num? id;
  String? email;
  String? tokenType;
  String? accessToken;

  AuthModel({
    this.id,
    this.email,
    this.tokenType,
    this.accessToken,
  });

  AuthModel copyWith({
    int? id,
    String? email,
    String? tokenType,
    String? accessToken,
  }) =>
      AuthModel(
        id: id ?? this.id,
        email: email ?? this.email,
        tokenType: tokenType ?? this.tokenType,
        accessToken: accessToken ?? this.accessToken,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json["id"],
        email: json["email"],
        tokenType: json["token_type"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "token_type": tokenType,
        "access_token": accessToken,
      };
}
