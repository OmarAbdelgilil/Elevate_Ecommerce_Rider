import 'order_entity.dart';

class OrdersEntity {
  List<OrderEntity>? orders;

  OrdersEntity({this.orders});

  factory OrdersEntity.fromJson(Map<String, dynamic> json) => OrdersEntity(
        orders: (json['orders'] as List<dynamic>?)
            ?.map((e) => OrderEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'orders': orders?.map((e) => e.toJson()).toList(),
      };
}
