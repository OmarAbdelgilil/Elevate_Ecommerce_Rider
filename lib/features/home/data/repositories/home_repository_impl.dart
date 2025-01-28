import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/offline_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/online_data_source.dart';
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
  Future<Result<bool>> setOngoingOrder() async {
    return await _offlineDataSource.setOngoingOrder();
  }
}
