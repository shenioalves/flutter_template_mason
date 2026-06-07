/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}_entity.dart
 * RESPONSABILIDADE: Objeto de domínio que representa o negócio.
 * COMO USAR: Entidade de domínio, usada na camada de negócio e UI.
 */

import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}}Entity extends Equatable {
  final String id;
  final String name;

  const {{feature_name.pascalCase()}}Entity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

