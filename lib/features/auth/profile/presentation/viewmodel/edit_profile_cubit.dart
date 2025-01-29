import 'dart:io';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/use_cases/profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/upload_image_request.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfileUsecase _profileUsecase;

  EditProfileCubit(this._profileUsecase) : super(EditProfileInitial());

  Future<void> doIntent(EditProfileIntent intent) async {
    switch (intent) {
      case UpdateProfileIntent():
        await _updateProfile(intent);
      case UploadImageIntent():
        await _uploadImage(intent);
    }
  }

  Future<void> _uploadImage(UploadImageIntent intent) async {
    try {
      emit(EditProfileLoading());

      final request = UploadImageRequest(imageFile: intent.imageFile);
      final result = await _profileUsecase.uploadImage(request);

      switch (result) {
        case Success():
          emit(ImageUploadSuccess());
        case Fail():
          emit(EditProfileError(message: result.exception.toString()));
      }
    } catch (e) {
      emit(EditProfileError(message: e.toString()));
    }
  }

  Future<void> _updateProfile(UpdateProfileIntent intent) async {
    try {
      emit(EditProfileLoading());

      final request = EditProfileRequest(
        firstName: intent.firstName,
        lastName: intent.lastName,
        email: intent.email,
        phone: intent.phone,
      );

      final result = await _profileUsecase.editProfile(request);

      switch (result) {
        case Success():
          if (result.data?.driver != null) {
            final updatedUser = User(
              firstName: result.data!.driver?.firstName,
              lastName: result.data!.driver?.lastName,
              email: result.data!.driver?.email,
              phone: result.data!.driver?.phone,
              gender: result.data!.driver?.gender,
              photo: result.data!.driver?.photo,
              vehicleType: result.data!.driver?.vehicleType,
              vehicleNumber: result.data!.driver?.vehicleNumber,
            );
            emit(EditProfileSuccess(user: updatedUser));
          } else {
            emit(EditProfileError(message: 'Failed to update profile'));
          }
        case Fail():
          emit(EditProfileError(message: result.exception.toString()));
      }
    } catch (e) {
      emit(EditProfileError(message: e.toString()));
    }
  }
}

sealed class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final User user;
  EditProfileSuccess({required this.user});
}

class ImageUploadSuccess extends EditProfileState {}

class EditProfileError extends EditProfileState {
  final String message;
  EditProfileError({required this.message});
}

sealed class EditProfileIntent {}

class UpdateProfileIntent extends EditProfileIntent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  UpdateProfileIntent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
}

class UploadImageIntent extends EditProfileIntent {
  final File imageFile;

  UploadImageIntent({required this.imageFile});
}
