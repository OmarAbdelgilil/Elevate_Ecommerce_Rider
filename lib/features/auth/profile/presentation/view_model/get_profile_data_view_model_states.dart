import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/driver.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final Driver driver;

  ProfileLoaded(this.driver);
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
