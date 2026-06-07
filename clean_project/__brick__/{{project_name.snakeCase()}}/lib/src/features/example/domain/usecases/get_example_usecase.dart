/*
 * ARQUIVO: lib/src/features/example/domain/usecases/get_example_usecase.dart
 * RESPONSABILIDADE: Executar uma regra de negócio específica (Caso de Uso).
 * COMO USAR: Injetar no Cubit e chamar para executar regra de negócio.
 */

import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/failures/example_failures.dart';

import '../entities/example_entity.dart';
import '../repositories/example_repository.dart';

class GetExampleUseCase {
  final ExampleRepository repository;

  GetExampleUseCase(this.repository);

  Future<Result<ExampleFailure, ExampleEntity>> call() async {
    return await repository.getExample();
  }
}

