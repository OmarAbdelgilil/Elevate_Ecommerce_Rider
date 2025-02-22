import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckOrderUseCase {
  final HomeRepository _homeRepository;
  CheckOrderUseCase(this._homeRepository);
  Future<Result<bool>> checkOngoingOrder() async {
    return await _homeRepository.checkOngoingOrder();
  }
}
