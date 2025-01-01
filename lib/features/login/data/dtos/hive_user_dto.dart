import 'package:elevate_ecommerce_driver/features/login/data/models/cache_user_model.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/driver.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

class HiveUserDto {
  static User toEntity(CacheUserModel cacheUser) {
    return User(
        id: cacheUser.id,
        country: cacheUser.country,
        firstName: cacheUser.firstName,
        lastName: cacheUser.lastName,
        vehicleType: cacheUser.vehicleType,
        vehicleNumber: cacheUser.vehicleNumber,
        nID: cacheUser.nid,
        email: cacheUser.email,
        gender: cacheUser.gender,
        phone: cacheUser.phone,
        photo: cacheUser.photo,
        nidImg: cacheUser.nidImg,
        vehicleLicense: cacheUser.vehicleLicense);
  }

  static CacheUserModel toHiveModel(User entity) {
    return CacheUserModel(
      id: entity.id!,
      country: entity.country!,
      firstName: entity.firstName!,
      lastName: entity.lastName!,
      vehicleType: entity.vehicleType!,
      vehicleNumber: entity.vehicleNumber!,
      vehicleLicense: entity.vehicleLicense!,
      nid: entity.nID!,
      nidImg: entity.nidImg!,
      email: entity.email!,
      gender: entity.gender!,
      phone: entity.phone!,
      photo: entity.photo!,
    );
  }

  static CacheUserModel driverDataResponseToHive(Driver data) {
    return CacheUserModel(
        id: data.id!,
        country: data.country!,
        firstName: data.firstName!,
        lastName: data.lastName!,
        vehicleType: data.vehicleType!,
        vehicleNumber: data.vehicleNumber!,
        vehicleLicense: data.vehicleLicense!,
        nid: data.nid!,
        nidImg: data.nidImg!,
        email: data.email!,
        gender: data.gender!,
        phone: data.phone!,
        photo: data.photo!);
  }
}
