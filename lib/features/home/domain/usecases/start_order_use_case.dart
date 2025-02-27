import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartOrderUseCase {
  final HomeRepository _homeRepository;
  StartOrderUseCase(this._homeRepository);
  Future<Result<StartOrderResponse>> startOrder(String orderId) async {
    return await _homeRepository.startOrder(orderId);
  }
}
