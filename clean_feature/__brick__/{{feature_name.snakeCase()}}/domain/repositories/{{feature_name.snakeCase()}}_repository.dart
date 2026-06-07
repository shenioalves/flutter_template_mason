/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/domain/repositories/{{feature_name.snakeCase()}}_repository.dart
 * RESPONSABILIDADE: Definir o contrato para obtenção de dados.
 * COMO USAR: Interface para abstração de dados, injetar no UseCase.
 */

import '../entities/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<{{feature_name.pascalCase()}}Entity> get{{feature_name.pascalCase()}}(String id);
}

