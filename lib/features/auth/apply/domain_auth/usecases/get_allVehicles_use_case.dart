import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/all_vehicles/VehicleResponse.dart';
import '../repos/apply_repo.dart';

@Injectable()
class GetAllVehicleUseCase {
  final ApplyRepo _applyRepo;

  GetAllVehicleUseCase(this._applyRepo);

  Future<Result<VehicleResponse?>> getAllVehicles() async {
    return await _applyRepo.getAllVehicles();
  }
}
