import 'driver.dart';

class ProfileDataResponse {
	String? message;
	Driver? driver;

	ProfileDataResponse({this.message, this.driver});

	factory ProfileDataResponse.fromJson(Map<String, dynamic> json) {
		return ProfileDataResponse(
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
