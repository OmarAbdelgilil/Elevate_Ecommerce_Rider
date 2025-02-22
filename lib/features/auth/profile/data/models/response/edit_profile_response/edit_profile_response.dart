import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/driver.dart';

class EditProfileResponse {
  String? message;
  Driver? driver;

  EditProfileResponse({this.message, this.driver});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return EditProfileResponse(
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
