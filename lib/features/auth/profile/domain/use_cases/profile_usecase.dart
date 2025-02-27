import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/upload_image_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/update_profile_image_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileUsecase {
  final ProfileRepo profileRepo;
  ProfileUsecase(this.profileRepo);
  Future<Result<EditProfileResponse?>> editProfile(EditProfileRequest request) {
    return profileRepo.editProfile(request);
  }

  Future<Result<UpdateProfileImageResponse?>> uploadImage(
      UploadImageRequest request) {
    return profileRepo.uploadImage(request);
  }
}
