import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/api_execution.dart';
import '../contracts/apply_data_source.dart';

@Injectable(as: ApplyDataSource)
class ApplyDataSourceImpl implements ApplyDataSource {
  final ApiManager _apiManager;

  ApplyDataSourceImpl(this._apiManager);
  @override
  Future<Result<ApplyResponse?>> applyWithFiles(FormData request) async {
    try {
      final result = await _apiManager.applyWithFiles(request);
      return Success(result);
    } catch (e) {
      if (e is DioException) {
        String errorMessage = _handleDioError(e);
        return Fail(Exception(errorMessage),
            data: ApplyResponse(error: errorMessage));
      }
      return Fail(Exception(e.toString()));
    }
  }

  String _handleDioError(DioException e) {
    if (e.response != null && e.response?.data != null) {
      try {
        final errorData = e.response?.data;
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey("error")) {
          return errorData["error"];
        }
      } catch (error) {
        return "Error processing response.";
      }
    }
    return e.message ?? "An unknown error occurred.";
  }

  @override
  Future<Result<VehicleResponse?>> getAllVehicles() {
    return executeApi(() async {
      final result = await _apiManager.getVehicles();
      return result;
    });
  }
}
