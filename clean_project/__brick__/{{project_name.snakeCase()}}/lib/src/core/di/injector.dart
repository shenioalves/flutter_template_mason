/// Contrato abstrato para o Service Locator do app.
///
/// Desacopla o código de negócios da implementação concreta (GetIt),
/// permitindo substituição em testes ou mudança de biblioteca sem impacto.
abstract class Injector {
  T get<T extends Object>();
  void registerSingleton<T extends Object>(T instance);
  void registerLazySingleton<T extends Object>(T Function() instanceFunc);
  void registerFactory<T extends Object>(T Function() instanceFunc);
}
