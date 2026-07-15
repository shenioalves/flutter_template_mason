/// Contrato para armazenamento local não-seguro (SharedPreferences).
abstract class LocalStorage {
  String? getString(String key);
  Future<void> setString(String key, String value);
  Future<bool> remove(String key);
}
