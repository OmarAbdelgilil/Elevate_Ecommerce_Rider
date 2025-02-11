import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_order.dart';

class FirebaseOrdersResponse {
  List<FirebaseOrder>? orders;
  FirebaseOrdersResponse({this.orders});
  factory FirebaseOrdersResponse.fromQuerySnapShot(QuerySnapshot data) {
    return FirebaseOrdersResponse(
        orders: data.docs
            .map(
              (e) => FirebaseOrder.fromQuerySnapshot(e),
            )
            .toList());
  }
}
