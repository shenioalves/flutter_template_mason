/*
 * ARQUIVO: lib/src/features/example/data/datasources/example_datasource.dart
 * RESPONSABILIDADE: Definir o contrato para a fonte de dados (API, Local DB, etc).
 * COMO USAR: Interface para fonte de dados, injetar no Repositório.
 */

import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/failures/example_failures.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/models/example_model.dart';

abstract class ExampleDataSource {
  Future<Result<ExampleFailure, ExampleModel>> getExample();
}

