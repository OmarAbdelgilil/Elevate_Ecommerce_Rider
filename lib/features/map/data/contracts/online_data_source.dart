import 'package:elevate_ecommerce_driver/core/common/result.dart';

abstract class OnlineDataSource {
  Future<Result<String>> getPolyline(double originLat, double originLong,
      double destinationLat, double destinationLong);
}
