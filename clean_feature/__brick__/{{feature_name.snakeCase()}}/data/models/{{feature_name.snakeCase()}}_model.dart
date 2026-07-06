/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart
 * RESPONSABILIDADE: Mapear os dados externos (ex: JSON da API) para a entidade do domínio.
 * COMO USAR: Utilizar no DataSource para decodificar a resposta da API e converter para Entity.
 */

import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}}Entity {
  {{feature_name.pascalCase()}}Model({
    required super.id,
  });

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{feature_name.pascalCase()}}Model(
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
