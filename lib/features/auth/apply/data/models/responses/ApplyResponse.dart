import 'Driver.dart';

/// message : "success"
/// driver : {"country":"Egypt","firstName":"Ahmed","lastName":"Ali","vehicleType":"676b31a45d05310ca82657ac","vehicleNumber":"12224","vehicleLicense":"d8d33612-7019-4a0a-8d54-e50e312b05bb-كأس افضل حد يكتب css.jpg","NID":"12345678912343","NIDImg":"7c9c0f9f-76ab-4c7c-a922-b8cb6bbc9d89-كأس افضل حد يكتب css.jpg","email":"daly13abdall@gmail.com","gender":"male","phone":"+201010700880","photo":"default-profile.png","_id":"677549ca9f3884b3405c48b6","createdAt":"2025-01-01T13:57:30.058Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2Nzc1NDljYTlmMzg4NGIzNDA1YzQ4YjYiLCJpYXQiOjE3MzU3Mzk4NTB9.NQOLvHQ3Kt4QRtXHdfjM8y_hn1laWAIRkP5Itdm1k4c"

class ApplyResponse {
  ApplyResponse({
      this.message, 
      this.driver, 
      this.token,});

  ApplyResponse.fromJson(dynamic json) {
    message = json['message'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    token = json['token'];
  }
  String? message;
  Driver? driver;
  String? token;
ApplyResponse copyWith({  String? message,
  Driver? driver,
  String? token,
}) => ApplyResponse(  message: message ?? this.message,
  driver: driver ?? this.driver,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    map['token'] = token;
    return map;
  }


}