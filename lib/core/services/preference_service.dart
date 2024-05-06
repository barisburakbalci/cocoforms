import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final SharedPreferences preferences;
  PreferenceService(this.preferences);

  Future<bool> setString(String key, String value) async {
    return preferences.setString(key, value);
  }

  String getString(String key) {
    return preferences.getString(key) ?? '';
  }
}
