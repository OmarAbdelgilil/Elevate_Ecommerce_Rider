// Mocks generated by Mockito 5.4.5 from annotations
// in elevate_ecommerce_driver/test/features/login/data/repos/login_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:ui' as _i10;

import 'package:elevate_ecommerce_driver/core/common/result.dart' as _i4;
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart'
    as _i9;
import 'package:elevate_ecommerce_driver/features/login/data/contracts/offline_data_source.dart'
    as _i8;
import 'package:elevate_ecommerce_driver/features/login/data/contracts/online_data_source.dart'
    as _i2;
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart'
    as _i5;
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart'
    as _i7;
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
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [OnlineDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockOnlineDataSource extends _i1.Mock implements _i2.OnlineDataSource {
  MockOnlineDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.LoginResponse?>> login(
    String? email,
    String? pass,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            pass,
          ],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.LoginResponse?>>.value(
            _i6.dummyValue<_i4.Result<_i5.LoginResponse?>>(
          this,
          Invocation.method(
            #login,
            [
              email,
              pass,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.LoginResponse?>>);

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
}

/// A class which mocks [OfflineDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockOfflineDataSource extends _i1.Mock implements _i8.OfflineDataSource {
  MockOfflineDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<String?>> checkUser() => (super.noSuchMethod(
        Invocation.method(
          #checkUser,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<String?>>.value(
            _i6.dummyValue<_i4.Result<String?>>(
          this,
          Invocation.method(
            #checkUser,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<String?>>);

  @override
  _i3.Future<_i4.Result<bool>> setUser(
    _i7.User? user,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setUser,
          [
            user,
            token,
          ],
        ),
        returnValue:
            _i3.Future<_i4.Result<bool>>.value(_i6.dummyValue<_i4.Result<bool>>(
          this,
          Invocation.method(
            #setUser,
            [
              user,
              token,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool>>);

  @override
  _i3.Future<_i4.Result<_i7.User>> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i7.User>>.value(
            _i6.dummyValue<_i4.Result<_i7.User>>(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i7.User>>);
}

/// A class which mocks [UserProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserProvider extends _i1.Mock implements _i9.UserProvider {
  MockUserProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLoggedIn => (super.noSuchMethod(
        Invocation.getter(#isLoggedIn),
        returnValue: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void login(String? token) => super.noSuchMethod(
        Invocation.method(
          #login,
          [token],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setUser(_i7.User? user) => super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
