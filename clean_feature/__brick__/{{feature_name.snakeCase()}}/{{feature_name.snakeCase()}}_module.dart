// TODO(feature): registre este módulo no InjectionContainer e ajuste as rotas públicas.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection_container.dart';
import '../../core/di/injector.dart';
import '../../core/logger/app_logger.dart';
import '../../core/modules/feature_module.dart';
import '../../core/network/api_client.dart';
import '../../core/routes/route_service.dart';
import 'data/datasources/{{feature_name.snakeCase()}}_datasource.dart';
import 'data/datasources/{{feature_name.snakeCase()}}_remote_datasource_impl.dart';
import 'data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import 'domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import 'domain/usecases/get_{{feature_name.snakeCase()}}_usecase.dart';
import 'presentation/cubit/{{feature_name.snakeCase()}}_cubit.dart';
import 'presentation/views/{{feature_name.snakeCase()}}_view.dart';

class {{feature_name.pascalCase()}}Module implements FeatureModule {
  static const String routePath = '/{{feature_name.snakeCase()}}';
  static const String routeName = '{{feature_name.snakeCase()}}';

  @override
  void registerDependencies(Injector injector) {
    injector.registerLazySingleton<{{feature_name.pascalCase()}}DataSource>(
      () => {{feature_name.pascalCase()}}RemoteDataSourceImpl(apiClient: injector.get<ApiClient>()),
    );
    injector.registerLazySingleton<{{feature_name.pascalCase()}}Repository>(
      () => {{feature_name.pascalCase()}}RepositoryImpl(
        injector.get<{{feature_name.pascalCase()}}DataSource>(),
        injector.get<AppLogger>(),
      ),
    );
    injector.registerLazySingleton<Get{{feature_name.pascalCase()}}UseCase>(
      () => Get{{feature_name.pascalCase()}}UseCase(injector.get<{{feature_name.pascalCase()}}Repository>()),
    );
    injector.registerFactory<{{feature_name.pascalCase()}}Cubit>(
      () => {{feature_name.pascalCase()}}Cubit(
        get{{feature_name.pascalCase()}}UseCase: injector.get<Get{{feature_name.pascalCase()}}UseCase>(),
        logger: injector.get<AppLogger>(),
      ),
    );
  }

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        path: routePath,
        name: routeName,
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
