/*
 * ARQUIVO: lib/src/features/example/domain/entities/example_entity.dart
 * RESPONSABILIDADE: Representar o objeto de negócio puro da aplicação.
 * CAMINHO DOS DADOS EM U: 
 * - IDA (Pedido): O UseCase manipula esta entidade.
 * - VOLTA (Resposta): O RepositoryImpl converte o Model para esta Entity antes de retornar ao UseCase.
 * OBS: Não deve conter dependências de bibliotecas externas (exceto Equatable) ou lógica de serialização.
 */

import 'package:equatable/equatable.dart';

class ExampleEntity extends Equatable {
  final String id;
  final String name;

  const ExampleEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
