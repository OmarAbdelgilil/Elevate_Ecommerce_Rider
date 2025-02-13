import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearOngoingOrderUseCase {
  final HomeRepository _homeRepository;
  ClearOngoingOrderUseCase(this._homeRepository);
  Future<Result<bool>> clearOngoingOrder() async {
    return await _homeRepository.clearOngoingOrder();
  }
}
