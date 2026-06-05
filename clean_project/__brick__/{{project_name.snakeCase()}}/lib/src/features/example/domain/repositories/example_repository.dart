/*
 * ARQUIVO: lib/src/features/example/domain/repositories/example_repository.dart
 * RESPONSABILIDADE: Definir o contrato de como os dados serão acessados.
 * CAMINHO DOS DADOS EM U:
 * - IDA (Pedido): O UseCase chama os métodos definidos nesta interface.
 * - VOLTA (Resposta): Garante que quem implementar retornará os dados no formato de Entity.
 */

import '../entities/example_entity.dart';

abstract class ExampleRepository {
  Future<ExampleEntity> getExample(String id);
}
