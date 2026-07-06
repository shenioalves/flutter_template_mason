/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/data/failures/{{feature_name.snakeCase()}}_failure.dart
 * RESPONSABILIDADE: Definir os erros específicos da feature.
 * COMO USAR: Retornar através do Result.failure() no Repository ou DataSource.
 */

import '../../../../core/utils/result/failure.dart';

class {{feature_name.pascalCase()}}Failure extends Failure {
  {{feature_name.pascalCase()}}Failure({required super.message});
}

class {{feature_name.pascalCase()}}NetworkFailure extends {{feature_name.pascalCase()}}Failure {
  {{feature_name.pascalCase()}}NetworkFailure({required super.message});
}
