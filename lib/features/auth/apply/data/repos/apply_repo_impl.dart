import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/contracts/apply_data_source.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/request/apply_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart';
import 'package:injectable/injectable.dart';
import '../../domain_auth/repos/apply_repo.dart';

@Injectable(as: ApplyRepo)
class ApplyRepoImpl implements ApplyRepo {
  final ApplyDataSource _applyDataSource;

  ApplyRepoImpl(this._applyDataSource);

  @override
  Future<Result<ApplyResponse?>> applyWithFiles(FormData request) async {
    return await _applyDataSource.applyWithFiles(request);
  }
  @override
  Future<Result<VehicleResponse?>> getAllVehicles()async {
    return  await _applyDataSource.getAllVehicles();
  }
}
