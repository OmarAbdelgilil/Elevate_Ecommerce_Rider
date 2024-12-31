class User {
  String? id;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? nID;
  String? email;
  String? gender;
  String? password;
  String? rePassword;
  String? phone;
  bool? isVerified;
  String? token;
  String? photo;
  String? vehicleLicense;
  String? nidImg;
  User(
      {this.id,
      this.country,
      this.firstName,
      this.lastName,
      this.vehicleType,
      this.vehicleNumber,
      this.nID,
      this.email,
      this.gender,
      this.password,
      this.rePassword,
      this.phone,
      this.isVerified,
      this.token,
      this.photo,
      this.vehicleLicense,
      this.nidImg});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      country: json['country'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      nID: json['NID'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      phone: json['phone'] as String?,
      isVerified: json['isverified'] as bool?,
      token: json['token'] as String?,
      photo: json['photo'] as String?);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'country': country,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'gender': gender,
        'vehicleType': vehicleType,
        'vehicleNumber': vehicleNumber,
        'NID': nID,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
        'isverified': isVerified,
        'token': token,
        'photo': photo
      };
}
