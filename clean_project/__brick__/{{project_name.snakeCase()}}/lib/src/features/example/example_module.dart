import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection_container.dart';
import '../../core/di/injector.dart';
import '../../core/logger/app_logger.dart';
import '../../core/modules/feature_module.dart';
import '../../core/network/api_client.dart';
import '../../core/routes/app_routes.dart';
import '../../core/routes/route_service.dart';
import 'data/datasources/example_datasource.dart';
import 'data/datasources/example_remote_datasource_impl.dart';
import 'data/repositories/example_repository_impl.dart';
import 'domain/repositories/example_repository.dart';
import 'domain/usecases/get_example_usecase.dart';
import 'presentation/cubit/example_cubit.dart';
import 'presentation/views/example_view.dart';

class ExampleModule implements FeatureModule {
  @override
  void registerDependencies(Injector injector) {
    injector.registerLazySingleton<ExampleDataSource>(
      () => ExampleRemoteDataSourceImpl(apiClient: injector.get<ApiClient>()),
    );
    injector.registerLazySingleton<ExampleRepository>(
      () => ExampleRepositoryImpl(injector.get<ExampleDataSource>()),
    );
    injector.registerLazySingleton<GetExampleUseCase>(
      () => GetExampleUseCase(injector.get<ExampleRepository>()),
    );
    injector.registerFactory<ExampleCubit>(
      () => ExampleCubit(
        getExampleUseCase: injector.get<GetExampleUseCase>(),
        logger: injector.get<AppLogger>(),
      ),
    );
  }

  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        path: AppRoutes.examplePath,
        name: AppRoutes.exampleName,
        pageBuilder: (context, state) =>
            RouteService.buildPageTransitionDefault(
              context: context,
              state: state,
              child: BlocProvider(
                create: (_) => InjectionContainer.injector.get<ExampleCubit>(),
                child: const ExampleView(),
              ),
            ),
      ),
    ];
  }
}
