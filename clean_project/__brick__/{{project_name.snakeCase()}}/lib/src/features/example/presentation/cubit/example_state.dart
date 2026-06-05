/*
 * ARQUIVO: lib/src/features/example/presentation/cubit/example_state.dart
 * RESPONSABILIDADE: Definir os estados possíveis da tela.
 * CAMINHO DOS DADOS EM U:
 * - VOLTA (Resposta): O Cubit emite um destes estados para atualizar a View.
 */

import 'package:equatable/equatable.dart';
import '../../domain/entities/example_entity.dart';

abstract class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object?> get props => [];
}

class ExampleInitial extends ExampleState {}

class ExampleLoading extends ExampleState {}

class ExampleSuccess extends ExampleState {
  final ExampleEntity entity;

  const ExampleSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ExampleError extends ExampleState {
  final String message;

  const ExampleError(this.message);

  @override
  List<Object?> get props => [message];
}
