/*
 * ARQUIVO: lib/src/features/example/data/datasources/example_remote_datasource_impl.dart
 * RESPONSABILIDADE: Implementar a chamada para a fonte de dados remota (ex: API).
 * CAMINHO DOS DADOS EM U:
 * - VOLTA (Resposta): Retorna o ExampleModel preenchido com dados da API.
 */

import '../models/example_model.dart';
import 'example_datasource.dart';

class ExampleRemoteDataSourceImpl implements ExampleDataSource {
  @override
  Future<ExampleModel> getExample(String id) async {
    // Simulação de chamada de API
    await Future.delayed(const Duration(seconds: 1));
    return ExampleModel(id: id, name: 'Exemplo de Dados da API');
  }
}
