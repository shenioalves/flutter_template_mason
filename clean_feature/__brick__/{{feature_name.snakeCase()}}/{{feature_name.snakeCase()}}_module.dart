/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_module.dart
 * RESPONSABILIDADE: Configuração de Injeção de Dependências e Rotas da feature {{feature_name.pascalCase()}}.
 * COMO USAR: Registre as rotas no AppRoutes e adicione este módulo no sistema principal.
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection_container.dart';
import '../../core/di/injector.dart';
import '../../core/logger/app_logger.dart';
import '../../core/modules/feature_module.dart';
import '../../core/network/api_client.dart';
import '../../core/routes/app_routes.dart';
import '../../core/routes/route_service.dart';
import 'data/datasources/{{feature_name.snakeCase()}}_datasource.dart';
import 'data/datasources/{{feature_name.snakeCase()}}_remote_datasource_impl.dart';
import 'data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import 'domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import 'domain/usecases/{{feature_name.snakeCase()}}_usecase.dart';
import 'presentation/cubit/{{feature_name.snakeCase()}}_cubit.dart';
import 'presentation/views/{{feature_name.snakeCase()}}_view.dart';

class {{feature_name.pascalCase()}}Module implements FeatureModule {
  @override
  void registerDependencies(Injector injector) {
    // DataSources
    injector.registerLazySingleton<{{feature_name.pascalCase()}}DataSource>(
      () => {{feature_name.pascalCase()}}RemoteDataSourceImpl(apiClient: injector.get<ApiClient>()),
    );

    // Repositories
    injector.registerLazySingleton<{{feature_name.pascalCase()}}Repository>(
      () => {{feature_name.pascalCase()}}RepositoryImpl(injector.get<{{feature_name.pascalCase()}}DataSource>()),
    );

    // UseCases
    injector.registerLazySingleton<{{feature_name.pascalCase()}}UseCase>(
      () => {{feature_name.pascalCase()}}UseCase(injector.get<{{feature_name.pascalCase()}}Repository>()),
    );

    // Cubit (Factory — nova instância a cada navegação)
    injector.registerFactory<{{feature_name.pascalCase()}}Cubit>(
      () => {{feature_name.pascalCase()}}Cubit(
        {{feature_name.camelCase()}}UseCase: injector.get<{{feature_name.pascalCase()}}UseCase>(),
        logger: injector.get<AppLogger>(),
      ),
    );
  }

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        path: AppRoutes.{{feature_name.camelCase()}}Path,
        name: AppRoutes.{{feature_name.camelCase()}}Name,
        pageBuilder: (context, state) =>
            RouteService.buildPageTransitionDefault(
              context: context,
              state: state,
              child: BlocProvider(
                create: (_) => InjectionContainer.injector.get<{{feature_name.pascalCase()}}Cubit>(),
                child: const {{feature_name.pascalCase()}}View(),
              ),
            ),
      ),
    ];
  }
}
