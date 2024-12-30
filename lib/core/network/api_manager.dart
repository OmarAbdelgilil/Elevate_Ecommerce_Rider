import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elevate_ecommerce_driver/core/network/api_constants.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  static const String _staticToken =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2NzcwNDlhNjlmMzg4NGIzNDA1YzQwNzYiLCJpYXQiOjE3MzU0MTIyNDl9.I-kQQbWn-N_yVHwjbvbcuP9BisylebyamXoyoh6ULfs";

  @factoryMethod
  factory ApiManager(Dio dio) {
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return _ApiManager(dio);
  }

  @GET(ApiConstants.getProfile)
  @retrofit.Headers({"Authorization": _staticToken})
  Future<ProfileDataResponse?> getProfile();
}
