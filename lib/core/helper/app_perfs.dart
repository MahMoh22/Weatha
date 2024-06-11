import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLong = "PREFS_KEY_LONG";
const String prefsKeyLat = "PREFS_KEY_LAT";
const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyName = "PREFS_KEY_NAME";
const String prefsKeySearchText = "PREFS_KEY_SEARCH_TEXT";

class AppPreferences {
  final SharedPreferences _preferences;
  AppPreferences(this._preferences);

  Future<void> setLong(String? long) async {
    _preferences.setString(prefsKeyLong, long ?? "");
  }

  String getLong() {
    return _preferences.getString(prefsKeyLong) ?? "";
  }

  Future<void> setLat(String? lat) async {
    _preferences.setString(prefsKeyLat, lat ?? "");
  }

  String getLat() {
    return _preferences.getString(prefsKeyLat) ?? "";
  }

  Future<void> setLang(String? lang) async {
    _preferences.setString(prefsKeyLang, lang ?? "");
  }

  String getLang() {
    return _preferences.getString(prefsKeyLang) ?? "";
  }

  Future<void> setName(String? name) async {
    _preferences.setString(prefsKeyName, name ?? "");
  }

  String getName() {
    return _preferences.getString(prefsKeyName) ?? "";
  }
  Future<void> setSearchText(String? text) async {
    _preferences.setString(prefsKeySearchText, text ?? "");
  }

  String getSearchText() {
    return _preferences.getString(prefsKeySearchText) ?? "";
  }
}
