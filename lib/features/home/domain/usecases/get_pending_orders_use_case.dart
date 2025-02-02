import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPendingOrdersUseCase {
  final HomeRepository _homeRepository;
  GetPendingOrdersUseCase(this._homeRepository);

  Future<Result<OrdersEntity>> getPendingOrders() async {
    return await _homeRepository.getOrders();
  }
}
