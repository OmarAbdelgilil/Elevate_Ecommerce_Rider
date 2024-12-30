import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/get_profile_data_data_onlinedatasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProfileDataOnlinedatasource)
class GetProfileDataOnlinedatasouraceImpl
    implements GetProfileDataOnlinedatasource {
  final ApiManager apiManager;

  GetProfileDataOnlinedatasouraceImpl(this.apiManager);
  @override
  Future<Result<ProfileDataResponse?>> getProfile() async {
    return executeApi(() async {
      return await apiManager.getProfile();
    });
  }
}
