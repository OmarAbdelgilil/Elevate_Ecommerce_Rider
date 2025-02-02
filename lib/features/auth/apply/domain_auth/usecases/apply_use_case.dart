import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';
import 'package:injectable/injectable.dart';

import '../repos/apply_repo.dart';

@Injectable()
class ApplyUseCase {
  final ApplyRepo _applyRepo;

  ApplyUseCase(this._applyRepo);

  Future<Result<ApplyResponse?>> applyWithFiles(FormData formData) async {

      final result = await _applyRepo.applyWithFiles(formData);
      return result;

  }
}