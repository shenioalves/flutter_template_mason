/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/data/datasources/{{feature_name.snakeCase()}}_remote_datasource_impl.dart
 * RESPONSABILIDADE: Implementar o acesso a dados externos via API.
 * COMO USAR: Instanciado no Module e injetado no RepositoryImpl.
 */

import '../../../../core/network/api_client.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';
import '{{feature_name.snakeCase()}}_datasource.dart';

class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}DataSource {
  final ApiClient _apiClient;

  {{feature_name.pascalCase()}}RemoteDataSourceImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<{{feature_name.pascalCase()}}Model> getDados(String param) async {
    final response = await _apiClient.get('/sua-rota-api/$param');
    return {{feature_name.pascalCase()}}Model.fromJson(response.data);
  }
}
