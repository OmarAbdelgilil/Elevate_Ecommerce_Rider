import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/datasource/apply_data_source_impl.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../../../../login/data/datasource/online_data_source_impl_test.mocks.dart';


@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late ApplyDataSourceImpl applyDataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    applyDataSource = ApplyDataSourceImpl(mockApiManager);
  });

  group('Apply', () {
    test('should return Success when API call is successful', () async {
      final formData = FormData.fromMap({});
      final applyResponse = ApplyResponse(message: "success");

      when(mockApiManager.applyWithFiles(any))
          .thenAnswer((_) async => applyResponse);

      final result = await applyDataSource.applyWithFiles(formData);

      expect(result, isA<Success<ApplyResponse?>>());
      expect((result as Success).data?.message, "success");
    });

    test('should return Fail when API call fails with error response', () async {
      final formData = FormData.fromMap({});
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {"error": "Invalid request"},
        ),
      );

      when(mockApiManager.applyWithFiles(any)).thenThrow(dioException);

      final result = await applyDataSource.applyWithFiles(formData);

      expect(result, isA<Fail<ApplyResponse?>>());
      expect((result as Fail).exception.toString(), contains("Invalid request"));
    });

    test('should return Fail when API call fails with unknown error', () async {
      final formData = FormData.fromMap({});
      final exception = Exception("Unknown error");

      when(mockApiManager.applyWithFiles(any)).thenThrow(exception);

      final result = await applyDataSource.applyWithFiles(formData);

      expect(result, isA<Fail<ApplyResponse?>>());
      expect((result as Fail).exception.toString(), contains("Unknown error"));
    });
  });

  group('getAllVehicles', () {
    test('should return Success when API call is successful', () async {
      final vehicleResponse = VehicleResponse();

      when(mockApiManager.getVehicles()).thenAnswer((_) async => vehicleResponse);

      final result = await applyDataSource.getAllVehicles();

      expect(result, isA<Success<VehicleResponse?>>());
    });
  });
}
