import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/get_profile_data_data_onlinedatasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/repos/get_profile_data_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProfileDataRepo)
class GetProfileDataImpl implements GetProfileDataRepo {
  final GetProfileDataOnlinedatasource getProfileDataOnlinedatasourace;

  GetProfileDataImpl(this.getProfileDataOnlinedatasourace);
  @override
  Future<Result<ProfileDataResponse?>> getProfile() {
    return getProfileDataOnlinedatasourace.getProfile();
  }
}
