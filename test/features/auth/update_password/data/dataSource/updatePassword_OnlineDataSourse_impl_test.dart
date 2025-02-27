import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/dataSource/updatePassword_OnlineDataSourse_impl.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../login/data/repos/login_repo_impl_test.mocks.dart';
import '../../../../profile/data/data_sources/profile_online_datasource_impl_test.mocks.dart';


@GenerateMocks([ApiManager,UserProvider])
void main() {
  group(
      "when call UpdatePasswordDataSourceImpl.updatePassword it should call updatePassword function from ApiManager ", () {

    test('updatePassword success on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var mockUserProvider = MockUserProvider();


      when(mockUserProvider.token).thenReturn("gwdytdvwqjhkws");


      var updatePasswordOnlineDatasourceImpl = UpdatePasswordOnlineDatasourceImpl(
        mockApiManager,
        mockUserProvider,
      );

      final request = UpdatePasswordRequest();
      final response = UpdatePasswordResponse();
      when(mockApiManager.updatePassword(any, any)).thenAnswer((_) async => response);

      final actual = await updatePasswordOnlineDatasourceImpl.updatePassword(request);

      expect(actual, isA<Success<User?>>());
      verify(mockApiManager.updatePassword(request, 'Bearer gwdytdvwqjhkws')).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('updatePassword failed on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var mockUserProvider = MockUserProvider();

      when(mockUserProvider.token).thenReturn("gwdytdvwqjhkws");

      var updatePasswordOnlineDatasourceImpl = UpdatePasswordOnlineDatasourceImpl(
        mockApiManager,
        mockUserProvider,
      );

      final request = UpdatePasswordRequest();
      when(mockApiManager.updatePassword(any, any)).thenThrow(Exception());

      final actual = await updatePasswordOnlineDatasourceImpl.updatePassword(request);

      expect(actual, isA<Fail<User?>>());
      verify(mockApiManager.updatePassword(request, 'Bearer gwdytdvwqjhkws')).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}