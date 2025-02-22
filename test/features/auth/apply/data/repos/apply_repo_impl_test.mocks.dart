// Mocks generated by Mockito 5.4.5 from annotations
// in elevate_ecommerce_driver/test/features/auth/apply/data/repos/apply_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:dio/dio.dart' as _i6;
import 'package:elevate_ecommerce_driver/core/common/result.dart' as _i4;
import 'package:elevate_ecommerce_driver/features/auth/apply/data/contracts/apply_data_source.dart'
    as _i2;
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart'
    as _i8;
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart'
    as _i5;
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
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApplyDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockApplyDataSourceUnique extends _i1.Mock
    implements _i2.ApplyDataSource {
  @override
  _i3.Future<_i4.Result<_i5.ApplyResponse?>> applyWithFiles(
          _i6.FormData? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyWithFiles,
          [request],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.ApplyResponse?>>.value(
            _i7.dummyValue<_i4.Result<_i5.ApplyResponse?>>(
          this,
          Invocation.method(
            #applyWithFiles,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i4.Result<_i5.ApplyResponse?>>.value(
                _i7.dummyValue<_i4.Result<_i5.ApplyResponse?>>(
          this,
          Invocation.method(
            #applyWithFiles,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.ApplyResponse?>>);

  @override
  _i3.Future<_i4.Result<_i8.VehicleResponse?>> getAllVehicles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllVehicles,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i8.VehicleResponse?>>.value(
            _i7.dummyValue<_i4.Result<_i8.VehicleResponse?>>(
          this,
          Invocation.method(
            #getAllVehicles,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i4.Result<_i8.VehicleResponse?>>.value(
                _i7.dummyValue<_i4.Result<_i8.VehicleResponse?>>(
          this,
          Invocation.method(
            #getAllVehicles,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i8.VehicleResponse?>>);
}
