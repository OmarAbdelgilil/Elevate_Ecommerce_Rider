
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';

class ResetPasswordResponse {
  String? message;
  String? token;
  User? user;

  ResetPasswordResponse({this.message, this.token, this.user});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(
        message: json['message'] as String?,
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
      };
}
