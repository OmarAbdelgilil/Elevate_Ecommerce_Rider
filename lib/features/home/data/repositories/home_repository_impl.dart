import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/offline_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final OnlineDataSource _onlineDataSource;
  final OfflineDataSource _offlineDataSource;
  HomeRepositoryImpl(this._onlineDataSource, this._offlineDataSource);

  @override
  Future<Result<OrdersEntity>> getOrders() async {
    return await _onlineDataSource.getOrders();
  }

  @override
  Future<Result<bool>> checkOngoingOrder() async {
    return await _offlineDataSource.checkOngoingOrder();
  }

  @override
  Future<Result<bool>> clearOngoingOrder() async {
    return await _offlineDataSource.clearOngoingOrder();
  }

  @override
  Future<Result<bool>> setOngoingOrder(OrderEntity order) async {
    return await _offlineDataSource.setOngoingOrder(order);
  }

  @override
  Future<Result<OrderEntity>> getOrder() async {
    return await _offlineDataSource.getOngoingOrder();
  }

  @override
  Future<Result<StartOrderResponse>> startOrder(String orderId) async {
    return await _onlineDataSource.startOrder(orderId);
  }

  @override
  Future<Result<FirebaseOrdersResponse>> getFirebaseOrders() async {
    return await _onlineDataSource.getFirebaseOrders();
  }

  @override
  Future<Result<void>> updateOrderData(String orderStatus, String orderId,
      {String? driverDeviceToken}) async {
    return await _onlineDataSource.updateOrderData(orderStatus, orderId,
        driverData: UserProvider().user, driverDeviceToken: driverDeviceToken);
  }

  @override
  Future<Result<void>> updateDriverLoc(
      String orderId, double driverLat, double driverLong) async {
    return await _onlineDataSource.updateDriverLoc(
        orderId, driverLat, driverLong);
  }

  @override
  Future<Result<void>> completeOrder(String orderId) async {
    return await _onlineDataSource.completeOrder(orderId);
  }
}
