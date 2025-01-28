import 'package:elevate_ecommerce_driver/features/home/data/models/response/orders_response/orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';

class OrdersDto {
  OrdersResponse orders;
  OrdersDto(this.orders);
  OrdersEntity toOrdersEntity() {
    return OrdersEntity.fromJson(orders.toJson());
  }
}
