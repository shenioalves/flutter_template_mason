/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/presentation/cubit/{{feature_name.snakeCase()}}_cubit.dart
 * RESPONSABILIDADE: Gerenciar o estado da tela e coordenar a execução de UseCases.
 * COMO USAR: Injetar via BlocProvider e acessar via context.read().
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_{{feature_name.snakeCase()}}_usecase.dart';
import '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  final Get{{feature_name.pascalCase()}}UseCase get{{feature_name.pascalCase()}}UseCase;

  {{feature_name.pascalCase()}}Cubit(this.get{{feature_name.pascalCase()}}UseCase) : super({{feature_name.pascalCase()}}Initial());

  Future<void> fetch{{feature_name.pascalCase()}}(String id) async {
    emit({{feature_name.pascalCase()}}Loading());
    try {
      final result = await get{{feature_name.pascalCase()}}UseCase(id);
      emit({{feature_name.pascalCase()}}Success(result));
    } catch (e) {
      emit({{feature_name.pascalCase()}}Error(e.toString()));
    }
  }
}

