import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/request/apply_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';

import '../../data/models/responses/all_vehicles/VehicleResponse.dart';

abstract class ApplyRepo {
  Future<Result<ApplyResponse?>> applyWithFiles(FormData request,);
  Future<Result<VehicleResponse?>> getAllVehicles();
}
