import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {

  static SharedPreferences? _prefs;

  /// Initialize (call once in main())
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// ---------------------------
  /// UNIVERSAL SET METHODS
  /// ---------------------------
  static Future<bool> setInt(String key, int value) async =>
      _prefs!.setInt(key, value);

  static Future<bool> setBool(String key, bool value) async =>
      _prefs!.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      _prefs!.setDouble(key, value);

  static Future<bool> setString(String key, String value) async =>
      _prefs!.setString(key, value);

  /// ---------------------------
  /// UNIVERSAL GET METHODS
  /// ---------------------------
  static int? getInt(String key) => _prefs!.getInt(key);

  static bool? getBool(String key) => _prefs!.getBool(key);

  static double? getDouble(String key) => _prefs!.getDouble(key);

  static String? getString(String key) => _prefs!.getString(key);

  /// ---------------------------
  /// REMOVE KEY
  /// ---------------------------
  static Future<bool> remove(String key) async => _prefs!.remove(key);

  /// ---------------------------
  /// CLEAR ALL PREFS
  /// ---------------------------
  static Future<bool> clear() async => _prefs!.clear();


}