/// Contrato para armazenamento seguro de credenciais de curta e longa duração.
///
/// Um token de sessão identifica um utilizador autenticado. Já um token de
/// redefinição autoriza exclusivamente a alteração de senha e não pode ser
/// usado para restaurar uma sessão.
abstract class SecureStorage {
  Future<void> saveSessionToken(String token);
  Future<String?> getSessionToken();
  Future<void> deleteSessionToken();

  Future<void> savePasswordResetToken(String token);
  Future<String?> getPasswordResetToken();
  Future<void> deletePasswordResetToken();
}
