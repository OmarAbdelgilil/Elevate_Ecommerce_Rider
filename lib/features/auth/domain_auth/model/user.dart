
class User {
  String?id ;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String?vehicleNumber;
  String? NID;
  String? email;
  String? gender;
  String? password;
  String? rePassword;
  String? phone;
  bool? isVerified;
  String? token;
  User(
      {
        this.id,
        this.country,
        this.firstName,
        this.lastName,
        this.vehicleType,
        this.vehicleNumber,
        this.NID,
        this.email,
        this.gender,
        this.password,
        this.rePassword,
        this.phone,
        this.isVerified,
        this.token
      });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['_id'] as String?,
    country: json['country'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    gender: json['gender'] as String?,
    vehicleType: json['vehicleType'] as String?,
    vehicleNumber: json['vehicleNumber'] as String?,
    NID: json['NID'] as String?,
    password: json['password'] as String?,
    rePassword: json['rePassword'] as String?,
    phone: json['phone'] as String?,
    isVerified: json['isverified'] as bool?,
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'country': country,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'gender': gender,
    'vehicleType': vehicleType,
    'vehicleNumber': vehicleNumber,
    'NID': NID,
    'password': password,
    'rePassword': rePassword,
    'phone': phone,
    'isverified': isVerified,
    'token': token,
  };


}
