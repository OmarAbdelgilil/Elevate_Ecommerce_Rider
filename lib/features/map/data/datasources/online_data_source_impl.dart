import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/other_apis/polyline_api.dart';
import 'package:elevate_ecommerce_driver/features/map/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/map/data/models/response/polyline_response/polyline_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource {
  @override
  Future<Result<String>> getPolyline(double originLat, double originLong,
      double destinationLat, double destinationLong) {
    return executeApi(() async {
      final originString = '$originLat,$originLong';
      final destinationString = '$destinationLong,$destinationLat';
      final result = PolylineResponse.fromJson(
          await fetchRoute(originString, destinationString));
      return result.routes!.isEmpty
          ? ""
          : result.routes![0].sections![0].polyline!;
    });
  }
}
