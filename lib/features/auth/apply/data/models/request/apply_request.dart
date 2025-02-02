import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ApplyRequest {
  ApplyRequest({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.email,
    this.gender,
    this.phone,
    this.password,
    this.rePassword,
  });

  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  File? vehicleLicense;
  String? nid;
  File? nIDImg;
  String? email;
  String? gender;
  String? phone;
  String? password;
  String? rePassword;

  bool _isImage(File? file) {
    if (file == null) return false;
    final validExtensions = ['png', 'jpg', 'jpeg'];
    final extension = file.path.split('.').last.toLowerCase();
    return validExtensions.contains(extension);
  }

  Future<FormData> toFormData() async {
    if (!_isImage(nIDImg) || !_isImage(vehicleLicense)) {
      throw Exception("Only PNG or JPG images are allowed.");
    }

    MultipartFile? nidImageFile;
    if (nIDImg != null) {
      nidImageFile = await MultipartFile.fromFile(
        nIDImg!.path,
        filename: 'NIDImg_${DateTime.now().millisecondsSinceEpoch}.jpg',
        contentType: MediaType('image', 'jpeg'),
      );
    }

    MultipartFile? vehicleLicenseFile;
    if (vehicleLicense != null) {
      vehicleLicenseFile = await MultipartFile.fromFile(
        vehicleLicense!.path,
        filename: 'vehicleLicense_${DateTime.now().millisecondsSinceEpoch}.jpg',
        contentType: MediaType('image', 'jpeg'),
      );
    }



    return FormData.fromMap({
      'country': country,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'vehicleType': vehicleType,
      'vehicleNumber': vehicleNumber,
      'NID': nid,
      'NIDImg': nidImageFile,
      'vehicleLicense': vehicleLicenseFile,
      'password': password,
      'rePassword': rePassword,
    });
  }}