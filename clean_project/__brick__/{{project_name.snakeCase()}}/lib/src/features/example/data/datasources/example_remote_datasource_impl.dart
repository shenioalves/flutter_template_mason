// TODO(api): substitua o endpoint ilustrativo e confira parâmetros, autenticação e resposta.
import '../../../../core/network/api_client.dart';
import '../models/example_model.dart';
import 'example_datasource.dart';

class ExampleRemoteDataSourceImpl implements ExampleDataSource {
  ExampleRemoteDataSourceImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<ExampleModel> getExample() async {
    final response = await _apiClient.get('/example');
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Invalid example response.');
    }
    return ExampleModel.fromJson(data);
  }
}
