import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late LocalStorageService _instance;
  static late SharedPreferences _preferences;

  static const String key = 'value_key';

  static Future<LocalStorageService> getInstance() async {
    _instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);
    if (value != null) {
      return value;
    } else {
      return 0;
    }
  }

  void _saveToDisk(String key, int value) {
    _preferences.setInt(key, value);
  }

  int getValue() {
    return _getFromDisk(key);
  }

  void saveValue(int value) {
    _saveToDisk(key, value);
  }
}
