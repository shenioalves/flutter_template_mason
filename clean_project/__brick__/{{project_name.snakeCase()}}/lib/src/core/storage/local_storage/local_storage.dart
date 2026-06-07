/*
 * ARQUIVO: lib/src/core/storage/local_storage/local_storage.dart
 * RESPONSABILIDADE: Persistência de dados local
 * COMO USAR: Interface para persistência de dados.
 */
abstract class LocalStorage {
  String? getString(String key);
  Future<void> setString(String key, String value);
  Future<bool> remove(String key);
}
