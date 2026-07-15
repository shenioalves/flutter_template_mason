import 'package:logger/logger.dart';

import 'app_logger.dart';

/// Implementação de [AppLogger] usando o package `logger`.
class AppLoggerImpl implements AppLogger {
  final Logger _logger;

  AppLoggerImpl()
    : _logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          noBoxingByDefault: true,
          levelColors: {
            Level.debug: const AnsiColor.fg(2),
            Level.info: const AnsiColor.fg(25),
            Level.warning: const AnsiColor.fg(208),
            Level.error: const AnsiColor.fg(196),
          },
        ),
      );

  @override
  void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
