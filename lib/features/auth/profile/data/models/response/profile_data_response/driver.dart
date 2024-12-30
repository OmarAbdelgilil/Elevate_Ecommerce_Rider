class Driver {
	String? id;
	String? country;
	String? firstName;
	String? lastName;
	String? vehicleType;
	String? vehicleNumber;
	String? vehicleLicense;
	String? nid;
	String? nidImg;
	String? email;
	String? gender;
	String? phone;
	String? photo;
	DateTime? createdAt;
	DateTime? passwordChangedAt;

	Driver({
		this.id, 
		this.country, 
		this.firstName, 
		this.lastName, 
		this.vehicleType, 
		this.vehicleNumber, 
		this.vehicleLicense, 
		this.nid, 
		this.nidImg, 
		this.email, 
		this.gender, 
		this.phone, 
		this.photo, 
		this.createdAt, 
		this.passwordChangedAt, 
	});

	factory Driver.fromJson(Map<String, dynamic> json) => Driver(
				id: json['_id'] as String?,
				country: json['country'] as String?,
				firstName: json['firstName'] as String?,
				lastName: json['lastName'] as String?,
				vehicleType: json['vehicleType'] as String?,
				vehicleNumber: json['vehicleNumber'] as String?,
				vehicleLicense: json['vehicleLicense'] as String?,
				nid: json['NID'] as String?,
				nidImg: json['NIDImg'] as String?,
				email: json['email'] as String?,
				gender: json['gender'] as String?,
				phone: json['phone'] as String?,
				photo: json['photo'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				passwordChangedAt: json['passwordChangedAt'] == null
						? null
						: DateTime.parse(json['passwordChangedAt'] as String),
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'country': country,
				'firstName': firstName,
				'lastName': lastName,
				'vehicleType': vehicleType,
				'vehicleNumber': vehicleNumber,
				'vehicleLicense': vehicleLicense,
				'NID': nid,
				'NIDImg': nidImg,
				'email': email,
				'gender': gender,
				'phone': phone,
				'photo': photo,
				'createdAt': createdAt?.toIso8601String(),
				'passwordChangedAt': passwordChangedAt?.toIso8601String(),
			};
}
