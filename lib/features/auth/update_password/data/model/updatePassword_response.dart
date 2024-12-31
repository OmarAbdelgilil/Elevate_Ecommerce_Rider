import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';

class UpdatePasswordResponse {
  String? message;
  String? token;
  User? user;
  String? error;

  UpdatePasswordResponse({this.message, this.token, this.user, this.error});

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return UpdatePasswordResponse(
        error: json['error'] as String?,
      );
    }
    return UpdatePasswordResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
        'error': error,
      };
}
