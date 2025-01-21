import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/request/apply_request.dart';
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
      // Pass the FormData directly to the API manager
      final result = await _apiManager.applyWithFiles(request);
      return Success(result);
    } catch (e) {
      return Fail(Exception(e.toString()));
    }
  }

  @override
  Future<Result<VehicleResponse?>> getAllVehicles() {
    return executeApi(() async {
      final result = await _apiManager.getVehicles();
      return result;
    });
  }


}