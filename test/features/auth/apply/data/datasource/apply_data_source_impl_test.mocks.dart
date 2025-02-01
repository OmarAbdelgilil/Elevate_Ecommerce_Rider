// Mocks generated by Mockito 5.4.5 from annotations
// in elevate_ecommerce_driver/test/features/auth/apply/data/datasource/apply_data_source_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dio/dio.dart' as _i9;
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart' as _i6;
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart'
    as _i5;
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart'
    as _i3;
import 'package:elevate_ecommerce_driver/features/login/data/models/request/login_request.dart'
    as _i8;
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart'
    as _i2;
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/user_data_response.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeLoginResponse_0 extends _i1.SmartFake implements _i2.LoginResponse {
  _FakeLoginResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeApplyResponse_1 extends _i1.SmartFake implements _i3.ApplyResponse {
  _FakeApplyResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserDataResponse_2 extends _i1.SmartFake
    implements _i4.UserDataResponse {
  _FakeUserDataResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVehicleResponse_3 extends _i1.SmartFake
    implements _i5.VehicleResponse {
  _FakeVehicleResponse_3(
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
class MockApiManager extends _i1.Mock implements _i6.ApiManager {
  MockApiManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.LoginResponse> login(_i8.LoginRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [request],
        ),
        returnValue: _i7.Future<_i2.LoginResponse>.value(_FakeLoginResponse_0(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
      ) as _i7.Future<_i2.LoginResponse>);

  @override
  _i7.Future<_i3.ApplyResponse> applyWithFiles(_i9.FormData? formData) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyWithFiles,
          [formData],
        ),
        returnValue: _i7.Future<_i3.ApplyResponse>.value(_FakeApplyResponse_1(
          this,
          Invocation.method(
            #applyWithFiles,
            [formData],
          ),
        )),
      ) as _i7.Future<_i3.ApplyResponse>);

  @override
  _i7.Future<_i4.UserDataResponse> getUserData() => (super.noSuchMethod(
        Invocation.method(
          #getUserData,
          [],
        ),
        returnValue:
            _i7.Future<_i4.UserDataResponse>.value(_FakeUserDataResponse_2(
          this,
          Invocation.method(
            #getUserData,
            [],
          ),
        )),
      ) as _i7.Future<_i4.UserDataResponse>);

  @override
  _i7.Future<_i5.VehicleResponse> getVehicles() => (super.noSuchMethod(
        Invocation.method(
          #getVehicles,
          [],
        ),
        returnValue:
            _i7.Future<_i5.VehicleResponse>.value(_FakeVehicleResponse_3(
          this,
          Invocation.method(
            #getVehicles,
            [],
          ),
        )),
      ) as _i7.Future<_i5.VehicleResponse>);
}
