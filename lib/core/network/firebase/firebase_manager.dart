import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate_ecommerce_driver/core/network/firebase/firebase_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class FirebaseManager {
  Future<QuerySnapshot<Map<String, dynamic>>> getOngoingOrders() async {
    return await FirebaseFirestore.instance
        .collection(FirebaseConstants.ordersCollection)
        .get();
  }

  Future<void> updateOrderDetails(
      String orderId, Map<String, dynamic> data) async {
    FirebaseFirestore.instance
        .collection(FirebaseConstants.ordersCollection)
        .doc(orderId)
        .update(data);
  }
}
