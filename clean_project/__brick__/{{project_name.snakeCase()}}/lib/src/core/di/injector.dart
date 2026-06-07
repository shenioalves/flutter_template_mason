/*
 * ARQUIVO: lib/src/core/di/injector.dart
 * RESPONSABILIDADE: Gerenciamento de Injeção de Dependências
 * COMO USAR: Interface para o container de injeção de dependências.
 */
abstract class Injector {
  T get<T extends Object>();
  void registerSingleton<T extends Object>(T instance);
  void registerLazySingleton<T extends Object>(T Function() instanceFunc);
  void registerFactory<T extends Object>(T Function() instanceFunc);
}
