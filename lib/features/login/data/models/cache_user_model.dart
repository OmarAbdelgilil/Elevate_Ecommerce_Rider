import 'package:hive/hive.dart';

part 'cache_user_model.g.dart';

@HiveType(typeId: 0)
class CacheUserModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String country;

  @HiveField(2)
  String firstName;

  @HiveField(3)
  String lastName;

  @HiveField(4)
  String vehicleType;

  @HiveField(5)
  String vehicleNumber;

  @HiveField(6)
  String vehicleLicense;

  @HiveField(7)
  String nid;

  @HiveField(8)
  String nidImg;

  @HiveField(9)
  String email;

  @HiveField(10)
  String gender;

  @HiveField(11)
  String phone;

  @HiveField(12)
  String photo;

  CacheUserModel({
    required this.id,
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.nid,
    required this.nidImg,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
  });
}
