/*
 * ARQUIVO: lib/src/features/example/data/datasources/example_remote_datasource_impl.dart
 * RESPONSABILIDADE: Implementar a chamada para a fonte de dados remota (ex: API).
 * COMO USAR: Implementação de fonte de dados remota via API.
 */

import 'package:{{project_name.snakeCase()}}/src/core/network/api_client.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/failures/example_failures.dart';

import '../models/example_model.dart';
import 'example_datasource.dart';

class ExampleRemoteDataSourceImpl implements ExampleDataSource {
  ExampleRemoteDataSourceImpl(this._httpClient);
  final ApiClient _httpClient;

  @override
  Future<Result<ExampleFailure, ExampleModel>> getExample() async {
    try {
      final result = await _httpClient.get('/example');
      return Success(ExampleModel.fromJson(result.data));
    } catch (e) {
      return const Failure(FailureInfo(type: ExampleFailure.unkown));
    }
  }
}

