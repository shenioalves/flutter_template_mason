/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart
 * RESPONSABILIDADE: Representação de dados externa (JSON).
 * COMO USAR: Modelo de dados para serialização/deserialização (JSON).
 */

import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}}Entity {
  const {{feature_name.pascalCase()}}Model({
    required super.id,
    required super.name,
  });

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{feature_name.pascalCase()}}Model(
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

