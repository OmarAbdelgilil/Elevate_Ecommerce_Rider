import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/contracts/logout_online_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/repos/logout_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_repo_impl_test.mocks.dart';
@GenerateMocks([LogoutOnlineDatasource])
void main() {
  late LogoutRpoImpl logoutRpoImpl;
  late MockLogoutOnlineDatasource mockDatasource;

  final logoutResponse = Logout(
    message: 'Success',
  );

  setUp(() {
    mockDatasource = MockLogoutOnlineDatasource();
    logoutRpoImpl = LogoutRpoImpl(mockDatasource);

    provideDummy<Result<Logout?>>(
      Fail<Logout?>(Exception('Dummy exception')),
    );
  });

  group('logout the user and remove data and token', () {
    test('logout the user and remove data and token', () async {
      when<Future<Result<Logout?>>>(
        mockDatasource.logout(),
      ).thenAnswer((_) async => Success<Logout?>(logoutResponse));

      final result = await logoutRpoImpl.logout();

      expect(result, isA<Success<Logout?>>());
      expect((result as Success<Logout?>).data?.message, 'Success');
      verify(mockDatasource.logout()).called(1);
    });
  });
}
