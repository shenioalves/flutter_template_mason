/// Contrato abstrato para logging no aplicativo.
///
/// Permite trocar a implementação (Logger, Crashlytics, etc.)
/// sem alterar nenhum código de negócio.
abstract class AppLogger {
  void debug(String message, [dynamic error, StackTrace? stackTrace]);
  void info(String message, [dynamic error, StackTrace? stackTrace]);
  void warning(String message, [dynamic error, StackTrace? stackTrace]);
  void error(String message, [dynamic error, StackTrace? stackTrace]);
}
