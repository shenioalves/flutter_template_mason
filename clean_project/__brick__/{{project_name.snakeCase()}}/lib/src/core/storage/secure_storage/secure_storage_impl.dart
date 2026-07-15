import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'enums/secure_storage_keys.dart';
import 'secure_storage.dart';

/// Implementação de [SecureStorage] usando FlutterSecureStorage.
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

  @override
  Future<void> savePasswordResetToken(String token) => _secureStorage.write(
        value: token,
        key: SecureStorageKey.passwordResetToken.name,
      );

  @override
  Future<String?> getPasswordResetToken() =>
      _secureStorage.read(key: SecureStorageKey.passwordResetToken.name);

  @override
  Future<void> deletePasswordResetToken() =>
      _secureStorage.delete(key: SecureStorageKey.passwordResetToken.name);
}
