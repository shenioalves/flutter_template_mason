/*
 * ARQUIVO: lib/src/features/example/domain/repositories/example_repository.dart
 * RESPONSABILIDADE: Definir o contrato de como os dados serão acessados.
 * COMO USAR: Interface para abstração de dados, injetar no UseCase.
 */

import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/failures/example_failures.dart';

import '../entities/example_entity.dart';

abstract class ExampleRepository {
  Future<Result<ExampleFailure, ExampleEntity>> getExample();
}

