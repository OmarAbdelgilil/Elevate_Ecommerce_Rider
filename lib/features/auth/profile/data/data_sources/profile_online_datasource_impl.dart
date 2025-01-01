import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/profile_onlind_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileOnlindDatasource)
class ProfileOnlineDatasourceImpl implements ProfileOnlindDatasource {
  final ApiManager _apiManager;

  ProfileOnlineDatasourceImpl(this._apiManager);
  @override
  Future<Result<EditProfileResponse?>> editProfile(EditProfileRequest request) {
    return executeApi(() async {
      final result = await _apiManager.editProfile(request);
      return result;
    });
  }
}
