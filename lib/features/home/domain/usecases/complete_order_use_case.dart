import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompleteOrderUseCase {
  final HomeRepository _homeRepository;
  CompleteOrderUseCase(this._homeRepository);
  Future<Result<void>> complete(String orderId) async {
    return await _homeRepository.completeOrder(orderId);
  }
}
