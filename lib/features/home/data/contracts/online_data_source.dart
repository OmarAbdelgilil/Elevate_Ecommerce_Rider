import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';

abstract class OnlineDataSource {
  Future<Result<OrdersEntity>> getOrders();
}
