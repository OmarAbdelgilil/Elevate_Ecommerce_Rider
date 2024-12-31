import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/user_data_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

class UserDto {
  static User toEntity(UserDataResponse response) {
    return User(
        id: response.driver!.id,
        country: response.driver!.country,
        firstName: response.driver!.firstName,
        lastName: response.driver!.lastName,
        vehicleType: response.driver!.vehicleType,
        vehicleNumber: response.driver!.vehicleNumber,
        nID: response.driver!.nid,
        email: response.driver!.email,
        gender: response.driver!.gender,
        phone: response.driver!.phone,
        photo: response.driver!.photo,
        nidImg: response.driver!.nidImg,
        vehicleLicense: response.driver!.vehicleLicense);
  }
}
