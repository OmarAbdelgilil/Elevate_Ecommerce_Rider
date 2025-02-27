import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';

class UserDto {
  UserDto({
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

  UserDto.fromJson(dynamic json) {
    id: json['_id'] ;
    country: json['country'] ;
    firstName: json['firstName'] ;
    lastName: json['lastName'] ;
    email: json['email'] ;
    gender: json['gender'] ;
    vehicleType: json['vehicleType'];
    vehicleNumber: json['vehicleNumber'] ;
    NID: json['NID'] ;
    password: json['password'] ;
    rePassword: json['rePassword'];
    phone: json['phone'] ;
    isVerified: json['isverified'];
    token: json['token'] ;
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['country'] = country;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['vehicleType'] = vehicleType;
    map['vehicleNumber'] = vehicleNumber;
    map['NID'] = NID;
    map['email'] = email;
    map['gender'] = gender;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    map['isVerified'] = isVerified;
    map['token'] = token;
    return map;
  }

  User toUser() {
    return User(
        id: id,
        country: country,
        firstName: firstName,
        lastName: lastName,
        vehicleType: vehicleType,
        vehicleNumber: vehicleNumber,
        NID: NID,
        email: email,
        gender: gender,
        password: password,
        rePassword: rePassword,
        phone: phone,
        isVerified: isVerified,
        token: token
    );
  }
}