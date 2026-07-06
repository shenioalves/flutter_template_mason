/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/domain/usecases/{{feature_name.snakeCase()}}_usecase.dart
 * RESPONSABILIDADE: Executar a regra de negócio central da feature.
 * COMO USAR: Injetar no Cubit e chamar para executar a ação correspondente.
 */

import '../../../../core/utils/result/result.dart';
import '../../data/failures/{{feature_name.snakeCase()}}_failure.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../repositories/{{feature_name.snakeCase()}}_repository.dart';

class {{feature_name.pascalCase()}}UseCase {
  final {{feature_name.pascalCase()}}Repository repository;

  {{feature_name.pascalCase()}}UseCase(this.repository);

  Future<Result<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>> call({
    required String param,
  }) async {
    return await repository.callUseCaseMethod(
      param: param,
    );
  }
}
