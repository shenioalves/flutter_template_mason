import 'package:go_router/go_router.dart';

import '../../core/di/injector.dart';
import '../../core/modules/feature_module.dart';
import '../../core/routes/app_routes.dart';
import '../../core/routes/route_service.dart';
import 'presentation/splash_view.dart';

class SplashModule implements FeatureModule {
  @override
  void registerDependencies(Injector injector) {}

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        path: AppRoutes.splashPath,
        name: AppRoutes.splashName,
        pageBuilder: (context, state) =>
            RouteService.buildPageTransitionDefault(
              context: context,
              state: state,
              child: const SplashView(),
            ),
      ),
    ];
  }
}
