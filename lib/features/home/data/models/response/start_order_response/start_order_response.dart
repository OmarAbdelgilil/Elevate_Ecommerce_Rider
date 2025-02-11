import 'orders.dart';

class StartOrderResponse {
  String? message;
  Orders? orders;

  StartOrderResponse({this.message, this.orders});

  factory StartOrderResponse.fromJson(Map<String, dynamic> json) {
    return StartOrderResponse(
      message: json['message'] as String?,
      orders: json['orders'] == null
          ? null
          : Orders.fromJson(json['orders'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'orders': orders?.toJson(),
      };
}
