/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart
 * RESPONSABILIDADE: Implementar o contrato do repositório, tratando exceções e retornando Result.
 * COMO USAR: Instanciado no Module e injetado nos UseCases.
 */

import '../../../../core/utils/result/result.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../datasources/{{feature_name.snakeCase()}}_datasource.dart';
import '../failures/{{feature_name.snakeCase()}}_failure.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}DataSource _dataSource;

  {{feature_name.pascalCase()}}RepositoryImpl(this._dataSource);

  @override
  Future<Result<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>> callUseCaseMethod({
    required String param,
  }) async {
    try {
      final result = await _dataSource.getDados(param);
      return Result.success(result);
    } catch (e) {
      // Aqui você pode mapear exceções específicas da API para Failures
      return Result.failure({{feature_name.pascalCase()}}Failure(message: e.toString()));
    }
  }
}
