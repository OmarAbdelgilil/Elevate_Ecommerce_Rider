import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

abstract class OnlineDataSource {
  Future<Result<OrdersEntity>> getOrders();
  Future<Result<StartOrderResponse>> startOrder(String orderId);
  Future<Result<FirebaseOrdersResponse>> getFirebaseOrders();
  Future<Result<void>> updateOrderData(String orderStatus, String orderId,
      {User? driverData});
  Future<Result<void>> updateDriverLoc(
      String orderId, double driverLat, double driverLong);
  Future<Result<void>> completeOrder(String orderId);
}
