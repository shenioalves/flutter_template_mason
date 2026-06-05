/*
 * ARQUIVO: lib/src/features/example/data/datasources/example_datasource.dart
 * RESPONSABILIDADE: Definir o contrato para a fonte de dados (API, Local DB, etc).
 * CAMINHO DOS DADOS EM U:
 * - IDA (Pedido): Chamado pelo RepositoryImpl.
 * - VOLTA (Resposta): Retorna dados brutos ou Models.
 */

import '../models/example_model.dart';

abstract class ExampleDataSource {
  Future<ExampleModel> getExample(String id);
}
