/*
 * ARQUIVO: lib/src/core/routes/route_service.dart
 * RESPONSABILIDADE: Orquestrar a navegação do aplicativo, centralizando rotas de múltiplos módulos.
 * COMO USAR: Service / Orchestrator. Isola a complexidade do GoRouter.
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../di/injector.dart';
import '../modules/feature_module.dart';
import '../ui/ui.dart';

class RouteService {
  late final GoRouter _router;
  final List<FeatureModule> _modules;

  RouteService(this._modules);

  GoRouter get router => _router;

  /// Inicializa o sistema de rotas e registra dependências de todos os módulos.
  void initialize(Injector injector) {
    final List<RouteBase> allRoutes = [];

    for (final module in _modules) {
      // 1. Cada módulo registra o que precisa no Injector recebido
      module.registerDependencies(injector);

      // 2. Coleta as rotas do módulo
      allRoutes.addAll(module.routes());
    }

    _router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      routes: allRoutes,
      errorBuilder: (context, state) => Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.red500,
                size: 80,
              ),
              const SizedBox(height: 16),
              Text(
                'Ops! Algo deu errado',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.gray900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Rota não encontrada: ${state.uri}',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.gray600,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/splash'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue500,
                  foregroundColor: AppColors.white,
                ),
                child: const Text('Voltar para o Início'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static CustomTransitionPage buildPageTransitionDefault<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}
