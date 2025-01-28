import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_execution.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_manager.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/offline_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource {
  final HiveManager _hiveManager;
  OfflineDataSourceImpl(this._hiveManager);
  @override
  Future<Result<bool>> checkOngoingOrder() {
    return executeHive(() async {
      final result = await _hiveManager.checkOngoingOrder();
      return result;
    });
  }

  @override
  Future<Result<bool>> clearOngoingOrder() {
    return executeHive(() async {
      final result = await _hiveManager.clearOngoingOrder();
      return result;
    });
  }

  @override
  Future<Result<bool>> setOngoingOrder() {
    return executeHive(() async {
      final result = await _hiveManager.setOngoingOrder();
      return result;
    });
  }
}
