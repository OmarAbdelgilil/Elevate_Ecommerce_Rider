// Mocks generated by Mockito 5.4.5 from annotations
// in elevate_ecommerce_driver/test/features/profile/data/repos/profile_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce_driver/core/common/result.dart' as _i4;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/profile_onlind_datasource.dart'
    as _i2;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart'
    as _i6;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/upload_image_request.dart'
    as _i9;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart'
    as _i5;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/update_profile_image_response.dart'
    as _i8;
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

/// A class which mocks [ProfileOnlindDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileOnlindDatasource extends _i1.Mock
    implements _i2.ProfileOnlindDatasource {
  MockProfileOnlindDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.EditProfileResponse?>> editProfile(
          _i6.EditProfileRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #editProfile,
          [request],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.EditProfileResponse?>>.value(
            _i7.dummyValue<_i4.Result<_i5.EditProfileResponse?>>(
          this,
          Invocation.method(
            #editProfile,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.EditProfileResponse?>>);

  @override
  _i3.Future<_i4.Result<_i8.UpdateProfileImageResponse?>> uploadImage(
          _i9.UploadImageRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadImage,
          [request],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i8.UpdateProfileImageResponse?>>.value(
                _i7.dummyValue<_i4.Result<_i8.UpdateProfileImageResponse?>>(
          this,
          Invocation.method(
            #uploadImage,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i8.UpdateProfileImageResponse?>>);
}
