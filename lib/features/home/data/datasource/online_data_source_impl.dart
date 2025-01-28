import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/home/data/DTOs/orders_dto.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource {
  final ApiManager _apiManager;
  OnlineDataSourceImpl(this._apiManager);

  @override
  Future<Result<OrdersEntity>> getOrders() {
    return executeApi(() async {
      final result = await _apiManager.getOrders();
      return OrdersDto(result).toOrdersEntity();
    });
  }
}
