import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrderUseCase {
  final HomeRepository _homeRepository;
  GetOrderUseCase(this._homeRepository);
  Future<Result<OrderEntity>> getOrder() async {
    return await _homeRepository.getOrder();
  }
}
