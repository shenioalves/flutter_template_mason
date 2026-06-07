/*
 * ARQUIVO: lib/src/features/example/domain/entities/example_entity.dart
 * RESPONSABILIDADE: Representar o objeto de negócio puro da aplicação.
 * COMO USAR: Entidade de domínio, usada na camada de negócio e UI.
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

