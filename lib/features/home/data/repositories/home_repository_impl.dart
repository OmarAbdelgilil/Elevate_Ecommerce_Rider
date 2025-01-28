import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final OnlineDataSource _onlineDataSource;
  HomeRepositoryImpl(this._onlineDataSource);

  @override
  Future<Result<OrdersEntity>> getOrders() async {
    return await _onlineDataSource.getOrders();
  }
}
