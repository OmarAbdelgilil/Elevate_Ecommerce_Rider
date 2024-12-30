import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/usecases/get_profile_data_usecase.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/view_model/get_profile_data_view_model_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUsecase _getProfileDataUsecase;

  ProfileCubit(this._getProfileDataUsecase) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());

    final result = await _getProfileDataUsecase.getProfile();

    switch (result) {
      case Success<ProfileDataResponse?>():
        if (result.data?.driver != null) {
          emit(ProfileLoaded(result.data!.driver!));
        } else {
          emit(ProfileError("Profile data not found"));
        }
      case Fail<ProfileDataResponse?>():
        emit(ProfileError(
            result.exception?.toString() ?? "Failed to load profile"));
    }
  }
}
