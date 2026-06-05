/*
 * ARQUIVO: lib/src/features/example/example_module.dart
 * RESPONSABILIDADE: Encapsular a configuração de DI e Rotas da feature Example.
 * PADRÃO: Module Pattern. Isola a feature do resto do app.
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/di/injector.dart';
import '../../core/modules/feature_module.dart';
import '../../core/routes/route_service.dart';
import 'data/datasources/example_datasource.dart';
import 'data/datasources/example_remote_datasource_impl.dart';
import 'data/repositories/example_repository_impl.dart';
import 'domain/repositories/example_repository.dart';
import 'domain/usecases/get_example_usecase.dart';
import 'presentation/cubit/example_cubit.dart';
import 'presentation/example_view.dart';

class ExampleModule implements FeatureModule {
  @override
  void registerDependencies(Injector injector) {
    // DataSources
    injector.registerLazySingleton<ExampleDataSource>(
      () => ExampleRemoteDataSourceImpl(),
    );

    // Repositories
    injector.registerLazySingleton<ExampleRepository>(
      () => ExampleRepositoryImpl(injector.get<ExampleDataSource>()),
    );

    // UseCases
    injector.registerLazySingleton<GetExampleUseCase>(
      () => GetExampleUseCase(injector.get<ExampleRepository>()),
    );

    // Cubit (Registrado como Factory para novas instâncias ao entrar na tela)
    injector.registerFactory<ExampleCubit>(
      () => ExampleCubit(injector.get<GetExampleUseCase>()),
    );
  }

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => RouteService.buildPageTransitionDefault(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => ExampleModule.getInjector(context).get<ExampleCubit>(),
            child: const ExampleView(),
          ),
        ),
      ),
    ];
  }

  /// Helper para recuperar o injector a partir do context se necessário, 
  /// ou via DI central. Aqui assumimos uso do Injector registrado no core.
  // ignore: strict_top_level_inference
  static Injector getInjector(context) => 
      RepositoryProvider.of<Injector>(context);
}
