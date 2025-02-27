import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce_driver/core/network/firebase/firebase_manager.dart';
import 'package:elevate_ecommerce_driver/features/home/data/DTOs/orders_dto.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource {
  final ApiManager _apiManager;
  final FirebaseManager _firebaseManager;
  OnlineDataSourceImpl(this._apiManager, this._firebaseManager);

  @override
  Future<Result<OrdersEntity>> getOrders() {
    return executeApi(() async {
      final result = await _apiManager.getOrders();
      return OrdersDto(result).toOrdersEntity();
    });
  }

  @override
  Future<Result<StartOrderResponse>> startOrder(String orderId) {
    return executeApi(() async {
      return await _apiManager.startOrder(orderId);
    });
  }

  @override
  Future<Result<FirebaseOrdersResponse>> getFirebaseOrders() {
    return executeApi(
      () async {
        final result = await _firebaseManager.getOngoingOrders();
        return FirebaseOrdersResponse.fromQuerySnapShot(result);
      },
    );
  }

  @override
  Future<Result<void>> updateOrderData(String orderStatus, String orderId,
      {User? driverData, String? driverDeviceToken}) {
    return executeApi(() async {
      Map<String, dynamic> data = {};
      if (driverData != null) {
        data['driver'] = driverData.toJson();
      }
      if (driverDeviceToken != null) {
        data['driverDeviceToken'] = driverDeviceToken;
      }
      data['status'] = orderStatus;
      data['timestamp'] = FieldValue.serverTimestamp();
      return await _firebaseManager.updateOrderDetails(orderId, data);
    });
  }

  @override
  Future<Result<void>> updateDriverLoc(
      String orderId, double driverLat, double driverLong) {
    return executeApi(() async {
      Map<String, dynamic> data = {};
      data['driverLat'] = driverLat;
      data['driverLong'] = driverLong;
      data['timestamp'] = FieldValue.serverTimestamp();
      return await _firebaseManager.updateOrderDetails(orderId, data);
    });
  }

  @override
  Future<Result<void>> completeOrder(String orderId) async {
    return executeApi(() async {
      await _apiManager.completeOrder(orderId, {"state": "completed"});
    });
  }
}
