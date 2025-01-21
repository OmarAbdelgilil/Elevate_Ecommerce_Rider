// ignore_for_file: unused_label


import 'package:elevate_ecommerce_driver/features/auth/apply/domain_auth/model/user.dart';

class UserDto {
  UserDto({
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
  });

  UserDto.fromJson(dynamic json) {
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    return map;
  }


}
