import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';

/// Implementação de [LocalStorage] usando SharedPreferences.
class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  String? getString(String key) => _preferences.getString(key);

  @override
  Future<void> setString(String key, String value) =>
      _preferences.setString(key, value);

  @override
  Future<bool> remove(String key) async => _preferences.remove(key);
}
