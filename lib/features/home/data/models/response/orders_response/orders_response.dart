import 'metadata.dart';
import 'order.dart';

class OrdersResponse {
  String? message;
  Metadata? metadata;
  List<Order>? orders;

  OrdersResponse({this.message, this.metadata, this.orders});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'orders': orders?.map((e) => e.toJson()).toList(),
      };
}
