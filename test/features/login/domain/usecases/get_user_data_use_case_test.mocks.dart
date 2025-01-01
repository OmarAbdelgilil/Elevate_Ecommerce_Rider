// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce_driver/test/features/login/domain/usecases/get_user_data_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce_driver/core/common/result.dart' as _i4;
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart'
    as _i5;
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart'
    as _i7;
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

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

/// A class which mocks [LoginRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRepo extends _i1.Mock implements _i2.LoginRepo {
  MockLoginRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.LoginResponse>> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.LoginResponse>>.value(
            _i6.dummyValue<_i4.Result<_i5.LoginResponse>>(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.LoginResponse>>);

  @override
  _i3.Future<_i4.Result<_i7.User>> getUserData() => (super.noSuchMethod(
        Invocation.method(
          #getUserData,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i7.User>>.value(
            _i6.dummyValue<_i4.Result<_i7.User>>(
          this,
          Invocation.method(
            #getUserData,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i7.User>>);

  @override
  _i3.Future<_i4.Result<String?>> checkCachedUser() => (super.noSuchMethod(
        Invocation.method(
          #checkCachedUser,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<String?>>.value(
            _i6.dummyValue<_i4.Result<String?>>(
          this,
          Invocation.method(
            #checkCachedUser,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<String?>>);

  @override
  _i3.Future<_i4.Result<_i7.User>> getCachedUser() => (super.noSuchMethod(
        Invocation.method(
          #getCachedUser,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i7.User>>.value(
            _i6.dummyValue<_i4.Result<_i7.User>>(
          this,
          Invocation.method(
            #getCachedUser,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i7.User>>);

  @override
  _i3.Future<_i4.Result<bool>> setCachedUser(
    _i7.User? user,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCachedUser,
          [
            user,
            token,
          ],
        ),
        returnValue:
            _i3.Future<_i4.Result<bool>>.value(_i6.dummyValue<_i4.Result<bool>>(
          this,
          Invocation.method(
            #setCachedUser,
            [
              user,
              token,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool>>);
}
