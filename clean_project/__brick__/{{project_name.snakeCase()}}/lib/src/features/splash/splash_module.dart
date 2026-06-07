/*
 * ARQUIVO: lib/src/features/splash/splash_module.dart
 * RESPONSABILIDADE: Configuração modular da funcionalidade
 * COMO USAR: Registrar dependências e definir rotas da feature.
 */
import 'package:go_router/go_router.dart';
import '../../core/di/injector.dart';
import '../../core/modules/feature_module.dart';
import '../../core/routes/route_service.dart';
import 'presentation/splash_view.dart';

class SplashModule implements FeatureModule {
  @override
  void registerDependencies(Injector injector) {
    // Nenhuma dependência específica para a Splash por enquanto
  }

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        path: '/splash',
        pageBuilder: (context, state) => RouteService.buildPageTransitionDefault(
          context: context,
          state: state,
          child: const SplashView(),
        ),
      ),
    ];
  }
}

