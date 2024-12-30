import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class HiveManager {
  Future<String> getToken() async {
    final box = await Hive.openBox('user');
    return await box.get('token');
  }

  Future<bool> setToken(String token) async {
    final box = await Hive.openBox('user');
    await box.put('token', token);
    return true;
  }

  Future<bool> clearUser(String token) async {
    final box = await Hive.openBox('user');
    await box.clear();
    return true;
  }
}
