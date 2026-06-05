/*
 * ARQUIVO: lib/src/core/routes/route_service.dart
 * RESPONSABILIDADE: Orquestrar a navegação do aplicativo, centralizando rotas de múltiplos módulos.
 * PADRÃO: Service / Orchestrator. Isola a complexidade do GoRouter.
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../di/injector.dart';
import '../modules/feature_module.dart';

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
      initialLocation: '/',
      routes: allRoutes,
      errorBuilder: (context, state) => Scaffold(
        body: Center(child: Text('Rota não encontrada: ${state.uri}')),
      ),
    );
  }

  /// Transição padrão de Fade entre telas.
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
