/*
 * ARQUIVO: lib/src/core/storage/secure_storage/secure_storage.dart
 * RESPONSABILIDADE: Persistência de dados local
 * COMO USAR: Interface para persistência de dados.
 */
abstract class SecureStorage {
  Future<void> saveSessionToken(String token);
  Future<String?> getSessionToken();
  Future<void> deleteSessionToken();
}

