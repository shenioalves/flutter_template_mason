/*
 * ARQUIVO: lib/src/features/example/data/repositories/example_repository_impl.dart
 * RESPONSABILIDADE: Implementar a interface do domínio, coordenando as fontes de dados.
 * CAMINHO DOS DADOS EM U:
 * - IDA (Pedido): Recebe a chamada do UseCase e repassa para o DataSource.
 * - VOLTA (Resposta): Recebe o Model do DataSource e retorna como Entity para o Domain.
 */

import '../../domain/entities/example_entity.dart';
import '../../domain/repositories/example_repository.dart';
import '../datasources/example_datasource.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleDataSource dataSource;

  ExampleRepositoryImpl(this.dataSource);

  @override
  Future<ExampleEntity> getExample(String id) async {
    return await dataSource.getExample(id);
  }
}
