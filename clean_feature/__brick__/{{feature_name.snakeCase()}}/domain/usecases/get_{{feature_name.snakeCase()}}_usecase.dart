/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/domain/usecases/get_{{feature_name.snakeCase()}}_usecase.dart
 * RESPONSABILIDADE: Executar uma regra de negócio específica.
 * COMO USAR: Injetar no Cubit e chamar para executar regra de negócio.
 */

import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../repositories/{{feature_name.snakeCase()}}_repository.dart';

class Get{{feature_name.pascalCase()}}UseCase {
  final {{feature_name.pascalCase()}}Repository repository;

  Get{{feature_name.pascalCase()}}UseCase(this.repository);

  Future<{{feature_name.pascalCase()}}Entity> call(String id) async {
    return await repository.get{{feature_name.pascalCase()}}(id);
  }
}

