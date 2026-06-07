/*
 * ARQUIVO: lib/src/core/storage/local_storage/local_storage_impl.dart
 * RESPONSABILIDADE: Persistência de dados local
 * COMO USAR: Implementação de persistência de dados.
 */
 
import 'package:{{project_name.snakeCase()}}/src/core/storage/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

