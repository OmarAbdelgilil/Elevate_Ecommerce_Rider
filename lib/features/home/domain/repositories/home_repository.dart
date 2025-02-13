import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';

abstract class HomeRepository {
  Future<Result<OrdersEntity>> getOrders();
  Future<Result<bool>> setOngoingOrder(OrderEntity order);
  Future<Result<bool>> clearOngoingOrder();
  Future<Result<bool>> checkOngoingOrder();
  Future<Result<OrderEntity>> getOrder();
  Future<Result<StartOrderResponse>> startOrder(String orderId);
  Future<Result<FirebaseOrdersResponse>> getFirebaseOrders();
  Future<Result<void>> updateOrderData(String orderStatus, String orderId,
      {String? driverDeviceToken});
  Future<Result<void>> updateDriverLoc(
      String orderId, double driverLat, double driverLong);
  Future<Result<void>> completeOrder(String orderId);
}
