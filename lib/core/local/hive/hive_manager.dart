import 'package:elevate_ecommerce_driver/features/login/data/models/cache_user_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class HiveManager {
  Future<String?> getToken() async {
    final box = await Hive.openBox('user');
    return await box.get('token');
  }

  Future<bool> setToken(String token) async {
    final box = await Hive.openBox('user');
    await box.put('token', token);
    return true;
  }

  Future<bool> clearUser() async {
    final box = await Hive.openBox('user');
    await box.clear();
    return true;
  }

  Future<bool> setUser(CacheUserModel user, String token) async {
    final box = await Hive.openBox('user');
    await box.put('token', token);
    await box.put('user', user);
    return true;
  }

  Future<CacheUserModel> getUser() async {
    final box = await Hive.openBox('user');
    final user = await box.get('user');
    return user;
  }

  Future<bool> setOngoingOrder(Map<String, dynamic> order) async {
    final box = await Hive.openBox('delivery');
    await box.put('onGoing', true);
    await box.put('orderData', order);
    return true;
  }

  Future<bool> clearOngoingOrder() async {
    final box = await Hive.openBox('delivery');
    await box.put('onGoing', false);
    return true;
  }

  Future<bool> checkOngoingOrder() async {
    final box = await Hive.openBox('delivery');
    final result = await box.get('onGoing');
    if (result == null) return false;
    return result;
  }

  Future<Map<String, dynamic>> getOrder() async {
    final box = await Hive.openBox('delivery');
    return await box.get('orderData');
  }
}
