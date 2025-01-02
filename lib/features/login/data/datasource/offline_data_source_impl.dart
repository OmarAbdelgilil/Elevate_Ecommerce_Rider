import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_execution.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_manager.dart';
import 'package:elevate_ecommerce_driver/features/login/data/contracts/offline_data_source.dart';
import 'package:elevate_ecommerce_driver/features/login/data/dtos/hive_user_dto.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource {
  final HiveManager _hiveManager;
  OfflineDataSourceImpl(this._hiveManager);
  @override
  Future<Result<String?>> checkUser() {
    return executeHive(() async {
      return await _hiveManager.getToken();
    });
  }

  @override
  Future<Result<User>> getUser() {
    return executeHive(() async {
      final result = await _hiveManager.getUser();
      return HiveUserDto.toEntity(result);
    });
  }

  @override
  Future<Result<bool>> setUser(User user, String token) {
    return executeHive(() async {
      final result =
          await _hiveManager.setUser(HiveUserDto.toHiveModel(user), token);
      return result;
    });


  }

  @override
  Future<Result<bool>> clearUserData() {
    return executeHive(() async {
      final success = await _hiveManager.clearUser();
      if (success) {
        return true;
      } else {
        throw Exception('Failed to clear user data');
      }
  });
}}
