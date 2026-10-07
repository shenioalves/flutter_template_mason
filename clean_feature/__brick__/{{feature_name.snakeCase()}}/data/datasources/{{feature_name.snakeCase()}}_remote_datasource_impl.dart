// TODO(api): substitua o endpoint ilustrativo e confira parâmetros, autenticação e resposta.
import '../../../../core/network/api_client.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';
import '{{feature_name.snakeCase()}}_datasource.dart';

class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}DataSource {
  {{feature_name.pascalCase()}}RemoteDataSourceImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<{{feature_name.pascalCase()}}Model> get{{feature_name.pascalCase()}}() async {
    final response = await _apiClient.get('/{{feature_name.snakeCase()}}');
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Invalid {{feature_name.snakeCase()}} response.');
    }
    return {{feature_name.pascalCase()}}Model.fromJson(data);
  }
}
