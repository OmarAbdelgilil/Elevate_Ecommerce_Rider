// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce_driver/test/features/auth/forget_password/domain/usecases/forget_password_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce_driver/core/common/result.dart' as _i4;
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart'
    as _i10;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart'
    as _i6;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart'
    as _i11;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart'
    as _i9;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart'
    as _i5;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart'
    as _i8;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ForgetPasswordRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockForgetPasswordRepository extends _i1.Mock
    implements _i2.ForgetPasswordRepository {
  MockForgetPasswordRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.ForgotPasswordResponse>> forgotPassword(
          _i6.ForgotPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [request],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.ForgotPasswordResponse>>.value(
            _i7.dummyValue<_i4.Result<_i5.ForgotPasswordResponse>>(
          this,
          Invocation.method(
            #forgotPassword,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.ForgotPasswordResponse>>);

  @override
  _i3.Future<_i4.Result<_i8.VerifyPasswordResponse>> verifyResetPassword(
          _i9.VerifyPasswordRequest? resetCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetPassword,
          [resetCode],
        ),
        returnValue: _i3.Future<_i4.Result<_i8.VerifyPasswordResponse>>.value(
            _i7.dummyValue<_i4.Result<_i8.VerifyPasswordResponse>>(
          this,
          Invocation.method(
            #verifyResetPassword,
            [resetCode],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i8.VerifyPasswordResponse>>);

  @override
  _i3.Future<_i4.Result<_i10.User?>> resetPassword(
          _i11.ResetPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [request],
        ),
        returnValue: _i3.Future<_i4.Result<_i10.User?>>.value(
            _i7.dummyValue<_i4.Result<_i10.User?>>(
          this,
          Invocation.method(
            #resetPassword,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i10.User?>>);
}
