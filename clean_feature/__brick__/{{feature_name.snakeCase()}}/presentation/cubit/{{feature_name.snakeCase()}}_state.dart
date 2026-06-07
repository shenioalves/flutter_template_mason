/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/presentation/cubit/{{feature_name.snakeCase()}}_state.dart
 * RESPONSABILIDADE: Definir os estados possíveis da tela.
 * COMO USAR: Consumir no BlocBuilder para reagir a mudanças de estado.
 */

import 'package:equatable/equatable.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State();

  @override
  List<Object?> get props => [];
}

class {{feature_name.pascalCase()}}Initial extends {{feature_name.pascalCase()}}State {}
class {{feature_name.pascalCase()}}Loading extends {{feature_name.pascalCase()}}State {}

class {{feature_name.pascalCase()}}Success extends {{feature_name.pascalCase()}}State {
  final {{feature_name.pascalCase()}}Entity entity;

  const {{feature_name.pascalCase()}}Success(this.entity);

  @override
  List<Object?> get props => [entity];
}

class {{feature_name.pascalCase()}}Error extends {{feature_name.pascalCase()}}State {
  final String message;

  const {{feature_name.pascalCase()}}Error(this.message);

  @override
  List<Object?> get props => [message];
}

