/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}_entity.dart
 * RESPONSABILIDADE: Representar as regras de negócio e propriedades da entidade principal da feature.
 * COMO USAR: Retornado pelo Repository/UseCase. Não deve conter anotações JSON, apenas regras puras do Dart.
 */

class {{feature_name.pascalCase()}}Entity {
  final String id;
  
  // Adicione outras propriedades da entidade
  {{feature_name.pascalCase()}}Entity({
    required this.id,
  });
}
