import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';

abstract class GetProfileDataOnlinedatasource {
  Future<Result<ProfileDataResponse?>> getProfile();
}
