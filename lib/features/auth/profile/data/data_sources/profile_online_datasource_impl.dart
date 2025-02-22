import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/upload_image_api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/profile_onlind_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/upload_image_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/update_profile_image_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileOnlindDatasource)
class ProfileOnlineDatasourceImpl implements ProfileOnlindDatasource {
  final ApiManager _apiManager;
  final UploadImageApiManager _uploadImageApiManager;
  ProfileOnlineDatasourceImpl(this._apiManager, this._uploadImageApiManager);

  @override
  Future<Result<EditProfileResponse?>> editProfile(EditProfileRequest request) {
    return executeApi(() async {
      final result = await _apiManager.editProfile(request);
      return result;
    });
  }

  @override
  Future<Result<UpdateProfileImageResponse?>> uploadImage(
      UploadImageRequest request) {
    return executeApi(() async {
      final response =
          await _uploadImageApiManager.uploadImage(request.imageFile!);

      return response;
    });
  }
}
