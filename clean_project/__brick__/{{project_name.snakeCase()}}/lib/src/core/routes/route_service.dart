import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../di/injector.dart';
import '../modules/feature_module.dart';
import '../ui/ui.dart';
import 'app_routes.dart';

class RouteService {
  RouteService(this._modules);

  final List<FeatureModule> _modules;
  late final GoRouter _router;

  GoRouter get router => _router;

  void initialize(Injector injector) {
    final routes = <RouteBase>[];

    for (final module in _modules) {
      module.registerDependencies(injector);
      routes.addAll(module.routes());
    }

    _router = GoRouter(
      initialLocation: AppRoutes.splashPath,
      routes: routes,
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppIcon(
                  icon: Icons.error_outline,
                  color: AppColors.red_250,
                  size: 80,
                ),
                const SizedBox(height: 16),
                const AppText(
                  text: 'Ops! Algo deu errado',
                  typography: AppTypography.heading2,
                  color: AppColors.gray_400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                AppText(
                  text: 'Rota nao encontrada: ${state.uri}',
                  typography: AppTypography.body,
                  color: AppColors.gray_250,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AppButton(
                  label: 'Voltar ao inicio',
                  onPressed: () => context.goNamed(AppRoutes.splashName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static CustomTransitionPage<T> buildPageTransitionDefault<T>({
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
