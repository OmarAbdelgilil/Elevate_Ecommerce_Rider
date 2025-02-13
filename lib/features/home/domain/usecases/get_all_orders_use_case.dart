import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllOrdersUseCase {
  final HomeRepository _homeRepository;
  GetAllOrdersUseCase(this._homeRepository);

  Future<Result<OrderResponse2?>> getAllOrders() async {
    return await _homeRepository.getAllOrder();
  }
}
