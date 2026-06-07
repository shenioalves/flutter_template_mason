/*
 * ARQUIVO: lib/src/core/di/injector_impl.dart
 * RESPONSABILIDADE: Gerenciamento de Injeção de Dependências
 * COMO USAR: Implementação concreta do Injector usando GetIt.
 */
import 'package:{{project_name.snakeCase()}}/src/core/di/injector.dart';
import 'package:get_it/get_it.dart';

class InjectorImpl implements Injector {
  final _getIt = GetIt.instance;

  @override
  T get<T extends Object>() => _getIt.get<T>();

  @override
  void registerSingleton<T extends Object>(T instance) =>
      _getIt.registerSingleton<T>(instance);

  @override
  void registerLazySingleton<T extends Object>(T Function() instanceFunc) =>
      _getIt.registerLazySingleton<T>(instanceFunc);

  @override
  void registerFactory<T extends Object>(T Function() instanceFunc) =>
      _getIt.registerFactory<T>(instanceFunc);
}

