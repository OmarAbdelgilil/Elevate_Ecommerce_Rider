import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/upload_image_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/update_profile_image_response.dart';

abstract class ProfileRepo {
  Future<Result<EditProfileResponse?>> editProfile(EditProfileRequest request);
  Future<Result<UpdateProfileImageResponse?>> uploadImage(
      UploadImageRequest request);
}
