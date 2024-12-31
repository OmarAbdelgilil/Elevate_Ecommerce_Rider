import 'driver.dart';

class UserDataResponse {
  String? message;
  Driver? driver;

  UserDataResponse({this.message, this.driver});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    return UserDataResponse(
      message: json['message'] as String?,
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'driver': driver?.toJson(),
      };
}
