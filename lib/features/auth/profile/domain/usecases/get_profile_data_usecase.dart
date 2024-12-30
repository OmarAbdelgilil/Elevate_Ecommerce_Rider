import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/repos/get_profile_data_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileDataUsecase {
  final GetProfileDataRepo _getProfileDataRepo;

  GetProfileDataUsecase(this._getProfileDataRepo);

  Future<Result<ProfileDataResponse?>> getProfile() =>
      _getProfileDataRepo.getProfile();
}
