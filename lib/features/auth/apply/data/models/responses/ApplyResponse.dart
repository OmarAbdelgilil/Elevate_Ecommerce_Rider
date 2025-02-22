import '../../../../../login/data/models/response/user_data_response/driver.dart';

class ApplyResponse {
  ApplyResponse({
    this.message,
    this.driver,
    this.token,
    this.error,
  });

  ApplyResponse.fromJson(dynamic json) {
    message = json['message'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    token = json['token'];
    error = json['error'];
  }

  String? message;
  Driver? driver;
  String? token;
  String? error;

  ApplyResponse copyWith({
    String? message,
    Driver? driver,
    String? token,
    String? error,
  }) =>
      ApplyResponse(
        message: message ?? this.message,
        driver: driver ?? this.driver,
        token: token ?? this.token,
        error: error ?? this.error,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    map['token'] = token;
    map['error'] = error;
    return map;
  }
}