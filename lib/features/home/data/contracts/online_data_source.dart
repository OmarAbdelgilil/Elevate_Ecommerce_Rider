import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';

abstract class OnlineDataSource {
  Future<Result<OrdersEntity>> getOrders();
  Future<Result<OrderResponse2?>> getAllOrder();
}
