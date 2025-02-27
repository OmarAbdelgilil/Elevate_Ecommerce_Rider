import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/contracts/apply_data_source.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/repos/apply_repo_impl.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart';

import 'apply_repo_impl_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<ApplyDataSource>(
      as: #MockApplyDataSourceUnique,
      onMissingStub: OnMissingStub.returnDefault,
    ),
  ],
)
void main() {
  late MockApplyDataSourceUnique mockApplyDataSource;
  late ApplyRepoImpl repository;

  setUp(() {
    mockApplyDataSource = MockApplyDataSourceUnique();
    repository = ApplyRepoImpl(mockApplyDataSource);

    provideDummy<Result<ApplyResponse?>>(Success(null));
    provideDummy<Result<VehicleResponse?>>(Success(null));
  });

  test('should return success when applyWithFiles succeeds', () async {
    final applyResponse = ApplyResponse(message: "Success");
    when(mockApplyDataSource.applyWithFiles(any))
        .thenAnswer((_) async => Success(applyResponse));

    final result = await repository.applyWithFiles(FormData());

    expect(result, isA<Success<ApplyResponse?>>());
    verify(mockApplyDataSource.applyWithFiles(any)).called(1);
  });

  test('should return success when getAllVehicles succeeds', () async {
    final vehicleResponse = VehicleResponse();
    when(mockApplyDataSource.getAllVehicles())
        .thenAnswer((_) async => Success(vehicleResponse));

    final result = await repository.getAllVehicles();

    expect(result, isA<Success<VehicleResponse?>>());
    verify(mockApplyDataSource.getAllVehicles()).called(1);
  });
}