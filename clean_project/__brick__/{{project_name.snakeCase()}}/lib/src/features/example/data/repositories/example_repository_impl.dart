/*
 * ARQUIVO: lib/src/features/example/data/repositories/example_repository_impl.dart
 * RESPONSABILIDADE: Implementar a interface do domínio, coordenando as fontes de dados.
 * COMO USAR: Implementação do repositório, injetar no container de DI.
 */

import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/failures/example_failures.dart';

import '../../domain/entities/example_entity.dart';
import '../../domain/repositories/example_repository.dart';
import '../datasources/example_datasource.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  ExampleRepositoryImpl(this._exampleDatasource);

  final ExampleDataSource _exampleDatasource;

  @override
  Future<Result<ExampleFailure, ExampleEntity>> getExample() async {
    final result = await _exampleDatasource.getExample();

    return result.fold(
      (error) => Failure(error),
      (example) => Success(example.toEntity()),
    );
  }
}

