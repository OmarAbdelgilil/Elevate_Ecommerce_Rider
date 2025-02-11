import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckFirebaseOrdersUseCase {
  final HomeRepository _homeRepository;
  CheckFirebaseOrdersUseCase(this._homeRepository);
  Future<Result<FirebaseOrdersResponse>> getFirebaseOrders() async {
    return await _homeRepository.getFirebaseOrders();
  }
}
