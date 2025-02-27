import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/reset_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../profile/data/data_sources/profile_online_datasource_impl_test.mocks.dart';


@GenerateMocks([ApiManager])
void main() {
  late ForgetPasswordOnlineDatasourceImpl forgetPasswordOnlineDatasource;
  late MockApiManager mockApiManager;

  setUp(
        () {
      mockApiManager = MockApiManager();
      forgetPasswordOnlineDatasource =
          ForgetPasswordOnlineDatasourceImpl(mockApiManager);
    },
  );

  group('ForgetPasswordOnlinedatasourceImpl Tests', () {
    test('forgotPassword success on ApiManager', () async {
      provideDummy<Result<ForgotPasswordResponse>>(
          Success(ForgotPasswordResponse()));
      final request = ForgotPasswordRequest();
      final response = ForgotPasswordResponse();
      when(mockApiManager.forgotPassword(any))
          .thenAnswer((_) async => response);

      final result =
      await forgetPasswordOnlineDatasource.forgotPassword(request);

      expect(result, isA<Success<ForgotPasswordResponse>>());
      verify(mockApiManager.forgotPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('forgotPassword failure on ApiManager', () async {
      provideDummy<Result<ForgotPasswordResponse>>(Fail(Exception()));
      final request = ForgotPasswordRequest();

      when(mockApiManager.forgotPassword(any)).thenThrow(Exception());

      final result =
      await forgetPasswordOnlineDatasource.forgotPassword(request);

      expect(result, isA<Fail<ForgotPasswordResponse>>());
      verify(mockApiManager.forgotPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('verifyResetPassword success on ApiManager', () async {
      provideDummy<Result<VerifyPasswordResponse>>(
          Success(VerifyPasswordResponse()));
      final request = VerifyPasswordRequest();
      final response = VerifyPasswordResponse();
      when(mockApiManager.verifyResetPassword(any))
          .thenAnswer((_) async => response);

      final result =
      await forgetPasswordOnlineDatasource.verifyResetPassword(request);

      expect(result, isA<Success<VerifyPasswordResponse>>());
      verify(mockApiManager.verifyResetPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('verifyResetPassword failure on ApiManager', () async {
      final request = VerifyPasswordRequest();
      provideDummy<Result<VerifyPasswordResponse>>(Fail(Exception()));

      when(mockApiManager.verifyResetPassword(any)).thenThrow(Exception());

      final result =
      await forgetPasswordOnlineDatasource.verifyResetPassword(request);

      expect(result, isA<Fail<VerifyPasswordResponse>>());
      verify(mockApiManager.verifyResetPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('resetPassword success on ApiManager', () async {
      provideDummy<Result<User?>>(Success(User()));
      final request = ResetPasswordRequest();
      final response = ResetPasswordResponse();

      when(mockApiManager.resetPassword(any)).thenAnswer((_) async => response);

      final result =
      await forgetPasswordOnlineDatasource.resetPassword(request);

      expect(result, isA<Success<User?>>());
      verify(mockApiManager.resetPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('resetPassword failure on ApiManager', () async {
      final request = ResetPasswordRequest();
      provideDummy<Result<User?>>(Fail(Exception()));
      when(mockApiManager.resetPassword(any)).thenThrow(Exception());

      final result =
      await forgetPasswordOnlineDatasource.resetPassword(request);

      expect(result, isA<Fail<User?>>());
      verify(mockApiManager.resetPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}