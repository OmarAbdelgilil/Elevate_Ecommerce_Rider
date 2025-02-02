import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetOrderUseCase {
  final HomeRepository _homeRepository;
  SetOrderUseCase(this._homeRepository);
  Future<Result<bool>> setOngoingOrder(OrderEntity order) async {
    return await _homeRepository.setOngoingOrder(order);
  }
}
