import 'package:get_it/get_it.dart';

import 'injector.dart';

/// Implementação concreta do [Injector] usando GetIt.
///
/// Este é o único ficheiro do projeto que conhece o GetIt diretamente.
/// Toda a restante base de código depende apenas da interface [Injector].
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
