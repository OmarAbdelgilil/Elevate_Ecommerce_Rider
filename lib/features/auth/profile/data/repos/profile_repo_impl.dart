import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/profile_onlind_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileOnlindDatasource profileOnlindDatasource;

  ProfileRepoImpl(this.profileOnlindDatasource);
  @override
  Future<Result<EditProfileResponse?>> editProfile(EditProfileRequest request) {
    return profileOnlindDatasource.editProfile(request);
  }
}
