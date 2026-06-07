/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_module.dart
 * RESPONSABILIDADE: Configuração de Injeção de Dependências e Rotas.
 * COMO USAR: Registrar dependências e definir rotas da feature.
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/di/injector.dart';
import '../../core/modules/feature_module.dart';
import '../../core/routes/route_service.dart';
import 'data/datasources/{{feature_name.snakeCase()}}_datasource.dart';
import 'data/datasources/{{feature_name.snakeCase()}}_remote_datasource_impl.dart';
import 'data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import 'domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import 'domain/usecases/get_{{feature_name.snakeCase()}}_usecase.dart';
import 'presentation/cubit/{{feature_name.snakeCase()}}_cubit.dart';
import 'presentation/{{feature_name.snakeCase()}}_view.dart';

class {{feature_name.pascalCase()}}Module implements FeatureModule {
  @override
  void registerDependencies(Injector injector) {
    // DataSources
    injector.registerLazySingleton<{{feature_name.pascalCase()}}DataSource>(
      () => {{feature_name.pascalCase()}}RemoteDataSourceImpl(),
    );

    // Repositories
    injector.registerLazySingleton<{{feature_name.pascalCase()}}Repository>(
      () => {{feature_name.pascalCase()}}RepositoryImpl(injector.get<{{feature_name.pascalCase()}}DataSource>()),
    );

    // UseCases
    injector.registerLazySingleton<Get{{feature_name.pascalCase()}}UseCase>(
      () => Get{{feature_name.pascalCase()}}UseCase(injector.get<{{feature_name.pascalCase()}}Repository>()),
    );

    // Cubit
    injector.registerFactory<{{feature_name.pascalCase()}}Cubit>(
      () => {{feature_name.pascalCase()}}Cubit(injector.get<Get{{feature_name.pascalCase()}}UseCase>()),
    );
  }

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        path: '/{{feature_name.paramCase()}}',
        pageBuilder: (context, state) => RouteService.buildPageTransitionDefault(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => {{feature_name.pascalCase()}}Module.getInjector(context).get<{{feature_name.pascalCase()}}Cubit>(),
            child: const {{feature_name.pascalCase()}}View(),
          ),
        ),
      ),
    ];
  }

  static Injector getInjector(context) => RepositoryProvider.of<Injector>(context);
}

