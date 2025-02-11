import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateDriverLocationUseCase {
  final HomeRepository _homeRepository;
  UpdateDriverLocationUseCase(this._homeRepository);
  Future<Result<void>> updateDriverLoc(
      String orderId, double driverLat, double driverLong) async {
    return await _homeRepository.updateDriverLoc(
        orderId, driverLat, driverLong);
  }
}
