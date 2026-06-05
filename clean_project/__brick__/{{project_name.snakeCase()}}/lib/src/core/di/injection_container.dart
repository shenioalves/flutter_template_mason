/*
 * ARQUIVO: lib/src/core/di/injection_container.dart
 * RESPONSABILIDADE: Ponto central de inicialização de todas as dependências do app.
 * PADRÃO: Composition Root. O único lugar onde as implementações reais são instanciadas.
 */

import 'get_it_adapter.dart';
import 'injector.dart';
import '../routes/route_service.dart';
import '../../features/example/example_module.dart';

class InjectionContainer {
  static final Injector injector = GetItInjectorImpl();

  static Future<void> init() async {
    // 1. Registra o próprio Injector no container para uso via context se necessário
    injector.registerSingleton<Injector>(injector);

    // 2. Registra Serviços Base (Network, Storage, etc)
    // Ex: injector.registerLazySingleton<HttpClient>(() => DioClientImpl());

    // 3. Configura o RouteService com a lista de módulos
    final routeService = RouteService([
      ExampleModule(),
      // Adicione novos módulos aqui
    ]);

    // 4. Inicializa os módulos (registra dependências e rotas)
    routeService.initialize(injector);

    // 5. Registra o RouteService para ser acessível globalmente via Injector
    injector.registerSingleton<RouteService>(routeService);
  }
}
