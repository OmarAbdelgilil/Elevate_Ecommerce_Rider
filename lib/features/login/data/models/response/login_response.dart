class LoginResponse {
  String? message;
  String? token;

  LoginResponse({this.message, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
      };
}
