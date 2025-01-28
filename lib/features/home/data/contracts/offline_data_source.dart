import 'package:elevate_ecommerce_driver/core/common/result.dart';

abstract class OfflineDataSource {
  Future<Result<bool>> setOngoingOrder();
  Future<Result<bool>> clearOngoingOrder();
  Future<Result<bool>> checkOngoingOrder();
}
