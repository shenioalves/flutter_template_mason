/*
 * ARQUIVO: lib/src/core/storage/secure_storage/secure_storage_impl.dart
 * RESPONSABILIDADE: Persistência de dados local
 * COMO USAR: Implementação de persistência de dados.
 */
import 'package:{{project_name.snakeCase()}}/src/core/storage/secure_storage/enums/secure_storage_keys.dart';
import 'package:{{project_name.snakeCase()}}/src/core/storage/secure_storage/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
 
class SecureStorageImpl implements SecureStorage {
  SecureStorageImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> saveSessionToken(String token) => _secureStorage.write(
        value: token,
        key: SecureStorageKey.sessionToken.name,
      );

  @override
  Future<String?> getSessionToken() =>
      _secureStorage.read(key: SecureStorageKey.sessionToken.name);

  @override
  Future<void> deleteSessionToken() =>
      _secureStorage.delete(key: SecureStorageKey.sessionToken.name);
}

