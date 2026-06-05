/*
 * ARQUIVO: lib/src/features/example/domain/usecases/get_example_usecase.dart
 * RESPONSABILIDADE: Executar uma regra de negócio específica (Caso de Uso).
 * CAMINHO DOS DADOS EM U:
 * - IDA (Pedido): Chamado pelo Cubit/BLoC.
 * - VOLTA (Resposta): Retorna a Entity para a camada de Presentation.
 */

import '../entities/example_entity.dart';
import '../repositories/example_repository.dart';

class GetExampleUseCase {
  final ExampleRepository repository;

  GetExampleUseCase(this.repository);

  Future<ExampleEntity> call(String id) async {
    return await repository.getExample(id);
  }
}
