import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elevate_ecommerce_driver/core/network/api/api_constants.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/orders_response/orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/user_data_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio, UserProvider provider) {
    dio.options = BaseOptions(
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = provider.token;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ));
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return _ApiManager(dio);
  }

  @POST(ApiConstants.loginPath)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(ApiConstants.applyPath)
  @MultiPart()
  Future<ApplyResponse> applyWithFiles(@Body() FormData formData);
  @GET(ApiConstants.logedUserDataPath)
  Future<UserDataResponse> getUserData();

  @GET(ApiConstants.getVehiclesPath)
  Future<VehicleResponse> getVehicles();
  @PUT(ApiConstants.editProfile)
  Future<EditProfileResponse> editProfile(@Body() EditProfileRequest request);

  @GET(ApiConstants.ordersPath)
  Future<OrdersResponse> getOrders();

  @PUT("${ApiConstants.startOrderPath}{orderId}")
  Future<StartOrderResponse> startOrder(@Path('orderId') String orderID);

  @PUT("${ApiConstants.updateOrderStatePath}{orderId}")
  Future<StartOrderResponse> completeOrder(
      @Path('orderId') String orderID, Map<String, dynamic> body);
}
