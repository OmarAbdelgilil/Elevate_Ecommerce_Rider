import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOrder {
  String? address;
  double? lat;
  double? long;
  String? id;

  FirebaseOrder({this.address, this.lat, this.long, this.id});
  factory FirebaseOrder.fromQuerySnapshot(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FirebaseOrder(
        address: data["location"] ?? "NA",
        lat: data["latitude"] is double ? data["latitude"] : 0.0,
        long: data["longitude"] is double ? data["longitude"] : 0.0,
        id: doc.id);
  }
}
