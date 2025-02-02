import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

import '../models/request/apply_request.dart';
import '../models/responses/ApplyResponse.dart';
import '../models/responses/all_vehicles/VehicleResponse.dart';


abstract class ApplyDataSource {
  Future<Result<ApplyResponse?>> applyWithFiles(FormData request);
  Future<Result<VehicleResponse?>> getAllVehicles();
}