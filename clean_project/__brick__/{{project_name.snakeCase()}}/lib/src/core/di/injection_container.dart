/*
 * ARQUIVO: lib/src/core/di/injection_container.dart
 * RESPONSABILIDADE: Ponto central de inicialização de todas as dependências do app.
 * COMO USAR: Composition Root. O único lugar onde as implementações reais são instanciadas.
 */

import '../../features/example/example_module.dart';
import '../../features/splash/splash_module.dart';
import '../network/di/network_dependencies.dart';
import '../platform/di/platform_dependencies.dart';
import '../routes/route_service.dart';
import '../storage/di/storage_dependencies.dart';
import 'injector.dart';
import 'injector_impl.dart';

class InjectionContainer {
  static final Injector injector = InjectorImpl();

  static Future<void> init() async {
    // 1. Registra o próprio Injector no container para uso via context se necessário
    injector.registerSingleton<Injector>(injector);

    // 2. Registra Serviços Base (Network, Storage, Plataforma, etc)
    // Ex: injector.registerLazySingleton<HttpClient>(() => DioClientImpl());
    configureNetworkDependencies(injector);
    await configureStorageDependencies(injector);
    configurePlatformDependencies(injector);

    // 3. Configura o RouteService com a lista de módulos
    final routeService = RouteService([
      SplashModule(),
      ExampleModule(),
      // Adicione novos módulos aqui
    ]);

    // 4. Inicializa os módulos (registra dependências e rotas)
    routeService.initialize(injector);

    // 5. Registra o RouteService para ser acessível globalmente via Injector
    injector.registerSingleton<RouteService>(routeService);
  }
}
