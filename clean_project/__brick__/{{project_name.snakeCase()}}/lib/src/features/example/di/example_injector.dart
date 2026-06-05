/*
 * ARQUIVO: lib/src/features/example/di/example_injector.dart
 * RESPONSABILIDADE: Registrar todas as dependências da feature 'example' no container de DI.
 * CAMINHO DOS DADOS EM U:
 * - SETUP: Configura o grafo de objetos necessário para que o fluxo "View -> Cubit -> UseCase..." funcione via injeção.
 */

import '../../../core/di/injector.dart';
import '../data/datasources/example_datasource.dart';
import '../data/datasources/example_remote_datasource_impl.dart';
import '../data/repositories/example_repository_impl.dart';
import '../domain/repositories/example_repository.dart';
import '../domain/usecases/get_example_usecase.dart';
import '../presentation/cubit/example_cubit.dart';

void registerExampleFeature(Injector injector) {
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

  // Presentation (Cubits/BLoCs)
  injector.registerFactory<ExampleCubit>(
    () => ExampleCubit(injector.get<GetExampleUseCase>()),
  );
}
