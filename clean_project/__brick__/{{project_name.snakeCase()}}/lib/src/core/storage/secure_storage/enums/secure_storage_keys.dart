/// Chaves tipadas para o armazenamento seguro.
///
/// Tokens de sessão e tokens de redefinição têm finalidades e ciclos de vida
/// distintos. Eles nunca devem compartilhar a mesma chave.
enum SecureStorageKey { sessionToken, passwordResetToken }
