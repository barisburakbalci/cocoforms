import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final SharedPreferences _preferences;
  PreferenceService({required SharedPreferences preferences})
      : _preferences = preferences;

  Future<bool> setString(String key, String value) async {
    return _preferences.setString(key, value);
  }

  String getString(String key) {
    return _preferences.getString(key) ?? '';
  }
}
