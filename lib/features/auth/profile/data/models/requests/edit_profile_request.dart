class EditProfileRequest {
	String? lastName;
	String? firstName;
	String? email;
	String? phone;

	EditProfileRequest({
		this.lastName, 
		this.firstName, 
		this.email, 
		this.phone, 
	});

	factory EditProfileRequest.fromJson(Map<String, dynamic> json) {
		return EditProfileRequest(
			lastName: json['lastName'] as String?,
			firstName: json['firstName'] as String?,
			email: json['email'] as String?,
			phone: json['phone'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'lastName': lastName,
				'firstName': firstName,
				'email': email,
				'phone': phone,
			};
}
