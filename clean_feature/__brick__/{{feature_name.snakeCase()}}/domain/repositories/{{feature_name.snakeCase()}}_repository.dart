/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/domain/repositories/{{feature_name.snakeCase()}}_repository.dart
 * RESPONSABILIDADE: Definir o contrato para operações de dados da feature.
 * COMO USAR: Interface para abstração de dados, injetar no UseCase.
 */

import '../../../../core/utils/result/result.dart';
import '../../data/failures/{{feature_name.snakeCase()}}_failure.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<Result<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>> callUseCaseMethod({
    required String param,
  });
}
