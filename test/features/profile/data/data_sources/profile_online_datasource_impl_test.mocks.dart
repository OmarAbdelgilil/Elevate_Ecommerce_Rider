// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce_driver/test/features/profile/data/data_sources/profile_online_datasource_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:elevate_ecommerce_driver/core/network/api_manager.dart' as _i8;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart'
    as _i10;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart'
    as _i13;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart'
    as _i11;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart'
    as _i2;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/reset_password_response.dart'
    as _i12;
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart'
    as _i3;
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart'
    as _i15;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart'
    as _i17;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart'
    as _i7;
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart'
    as _i14;
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_response.dart'
    as _i4;
import 'package:elevate_ecommerce_driver/features/login/data/models/request/login_request.dart'
    as _i16;
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart'
    as _i5;
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/user_data_response.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeForgotPasswordResponse_0 extends _i1.SmartFake
    implements _i2.ForgotPasswordResponse {
  _FakeForgotPasswordResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerifyPasswordResponse_1 extends _i1.SmartFake
    implements _i3.VerifyPasswordResponse {
  _FakeVerifyPasswordResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpdatePasswordResponse_2 extends _i1.SmartFake
    implements _i4.UpdatePasswordResponse {
  _FakeUpdatePasswordResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginResponse_3 extends _i1.SmartFake implements _i5.LoginResponse {
  _FakeLoginResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserDataResponse_4 extends _i1.SmartFake
    implements _i6.UserDataResponse {
  _FakeUserDataResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEditProfileResponse_5 extends _i1.SmartFake
    implements _i7.EditProfileResponse {
  _FakeEditProfileResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiManager extends _i1.Mock implements _i8.ApiManager {
  MockApiManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.ForgotPasswordResponse> forgotPassword(
          _i10.ForgotPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [request],
        ),
        returnValue: _i9.Future<_i2.ForgotPasswordResponse>.value(
            _FakeForgotPasswordResponse_0(
          this,
          Invocation.method(
            #forgotPassword,
            [request],
          ),
        )),
      ) as _i9.Future<_i2.ForgotPasswordResponse>);

  @override
  _i9.Future<_i3.VerifyPasswordResponse> verifyResetPassword(
          _i11.VerifyPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetPassword,
          [request],
        ),
        returnValue: _i9.Future<_i3.VerifyPasswordResponse>.value(
            _FakeVerifyPasswordResponse_1(
          this,
          Invocation.method(
            #verifyResetPassword,
            [request],
          ),
        )),
      ) as _i9.Future<_i3.VerifyPasswordResponse>);

  @override
  _i9.Future<_i12.ResetPasswordResponse?> resetPassword(
          _i13.ResetPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [request],
        ),
        returnValue: _i9.Future<_i12.ResetPasswordResponse?>.value(),
      ) as _i9.Future<_i12.ResetPasswordResponse?>);

  @override
  _i9.Future<_i4.UpdatePasswordResponse> updatePassword(
    _i14.UpdatePasswordRequest? request,
    String? authorization,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [
            request,
            authorization,
          ],
        ),
        returnValue: _i9.Future<_i4.UpdatePasswordResponse>.value(
            _FakeUpdatePasswordResponse_2(
          this,
          Invocation.method(
            #updatePassword,
            [
              request,
              authorization,
            ],
          ),
        )),
      ) as _i9.Future<_i4.UpdatePasswordResponse>);

  @override
  _i9.Future<_i15.Logout?> logout(String? authorization) => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [authorization],
        ),
        returnValue: _i9.Future<_i15.Logout?>.value(),
      ) as _i9.Future<_i15.Logout?>);

  @override
  _i9.Future<_i5.LoginResponse> login(_i16.LoginRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [request],
        ),
        returnValue: _i9.Future<_i5.LoginResponse>.value(_FakeLoginResponse_3(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
      ) as _i9.Future<_i5.LoginResponse>);

  @override
  _i9.Future<_i6.UserDataResponse> getUserData() => (super.noSuchMethod(
        Invocation.method(
          #getUserData,
          [],
        ),
        returnValue:
            _i9.Future<_i6.UserDataResponse>.value(_FakeUserDataResponse_4(
          this,
          Invocation.method(
            #getUserData,
            [],
          ),
        )),
      ) as _i9.Future<_i6.UserDataResponse>);

  @override
  _i9.Future<_i7.EditProfileResponse> editProfile(
          _i17.EditProfileRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #editProfile,
          [request],
        ),
        returnValue: _i9.Future<_i7.EditProfileResponse>.value(
            _FakeEditProfileResponse_5(
          this,
          Invocation.method(
            #editProfile,
            [request],
          ),
        )),
      ) as _i9.Future<_i7.EditProfileResponse>);
}
