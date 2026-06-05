/*
 * ARQUIVO: lib/src/features/example/data/models/example_model.dart
 * RESPONSABILIDADE: Realizar a ponte entre os dados brutos (JSON/DB) e a camada de domínio.
 * CAMINHO DOS DADOS EM U:
 * - VOLTA (Resposta): O DataSource retorna este Model, que é uma versão da Entity com capacidades de serialização.
 */

import '../../domain/entities/example_entity.dart';

class ExampleModel extends ExampleEntity {
  const ExampleModel({
    required super.id,
    required super.name,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
