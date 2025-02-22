import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';

abstract class HomeRepository {
  Future<Result<OrdersEntity>> getOrders();
  Future<Result<bool>> setOngoingOrder(OrderEntity order);
  Future<Result<bool>> clearOngoingOrder();
  Future<Result<bool>> checkOngoingOrder();
  Future<Result<OrderEntity>> getOrder();
}
