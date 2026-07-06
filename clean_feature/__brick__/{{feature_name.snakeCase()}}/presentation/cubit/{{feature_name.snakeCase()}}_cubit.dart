/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/presentation/cubit/{{feature_name.snakeCase()}}_cubit.dart
 * RESPONSABILIDADE: Gerenciar o estado da tela e coordenar a execução do(s) UseCase(s).
 * COMO USAR: Injetar via BlocProvider e acessar via context.read<{{feature_name.pascalCase()}}Cubit>().
 */

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logger/app_logger.dart';
import '../../domain/usecases/{{feature_name.snakeCase()}}_usecase.dart';
import '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  final {{feature_name.pascalCase()}}UseCase _{{feature_name.camelCase()}}UseCase;
  final AppLogger _logger;

  {{feature_name.pascalCase()}}Cubit({
    required {{feature_name.pascalCase()}}UseCase {{feature_name.camelCase()}}UseCase,
    required AppLogger logger,
  })  : _{{feature_name.camelCase()}}UseCase = {{feature_name.camelCase()}}UseCase,
        _logger = logger,
        super(const {{feature_name.pascalCase()}}Initial());

  Future<void> loadData(String param) async {
    emit(const {{feature_name.pascalCase()}}Loading());

    final result = await _{{feature_name.camelCase()}}UseCase(param: param);

    result.fold(
      (failure) {
        _logger.error('[{{feature_name.pascalCase()}}Cubit] Falha ao carregar dados: ${failure.message}');
        emit({{feature_name.pascalCase()}}Error(message: failure.message ?? 'Erro desconhecido'));
      },
      (data) {
        _logger.info('[{{feature_name.pascalCase()}}Cubit] Dados carregados com sucesso.');
        emit({{feature_name.pascalCase()}}Success(data));
      },
    );
  }
}
