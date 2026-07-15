import '../../di/injector.dart';
import '../app_logger.dart';
import '../app_logger_impl.dart';

/// Regista as dependências de logging no Injector.
void configureLoggerDependencies(Injector injector) {
  injector.registerSingleton<AppLogger>(AppLoggerImpl());
}
