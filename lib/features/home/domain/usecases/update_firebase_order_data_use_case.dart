import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateFirebaseOrderDataUseCase {
  final HomeRepository _homeRepository;
  UpdateFirebaseOrderDataUseCase(this._homeRepository);
  Future<Result<void>> updateOrderData(String orderStatus, String orderId,
      {String? driverDeviceToken}) async {
    return await _homeRepository.updateOrderData(orderStatus, orderId,
        driverDeviceToken: driverDeviceToken);
  }
}
