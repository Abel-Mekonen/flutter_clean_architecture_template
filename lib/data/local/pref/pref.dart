import 'package:homme/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = getIt<SharedPreferences>();
  }

  static Future<bool> setString(String key, String value) async {
    return await _sharedPreferences!.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences!.setBool(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _sharedPreferences!.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _sharedPreferences!.setStringList(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences!.getString(key);
  }

  static bool? getBool(String key) {
    return _sharedPreferences!.getBool(key);
  }

  static int? getInt(String key) {
    return _sharedPreferences!.getInt(key);
  }

  static double? getDouble(String key) {
    return _sharedPreferences!.getDouble(key);
  }

  static List<String>? getStringList(String key) {
    return _sharedPreferences!.getStringList(key);
  }

  static Future<bool> remove(String key) async {
    return await _sharedPreferences!.remove(key);
  }

  static Future<bool> clear() async {
    return await _sharedPreferences!.clear();
  }
}