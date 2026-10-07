// TODO(feature): adicione as ações da tela; injete novos UseCases pelo construtor e pelo módulo.
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logger/app_logger.dart';
import '../../domain/usecases/get_{{feature_name.snakeCase()}}_usecase.dart';
import '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Cubit({
    required Get{{feature_name.pascalCase()}}UseCase get{{feature_name.pascalCase()}}UseCase,
    required AppLogger logger,
  }) : _get{{feature_name.pascalCase()}}UseCase = get{{feature_name.pascalCase()}}UseCase,
       _logger = logger,
       super(const {{feature_name.pascalCase()}}Initial());

  final Get{{feature_name.pascalCase()}}UseCase _get{{feature_name.pascalCase()}}UseCase;
  final AppLogger _logger;

  Future<void> fetch{{feature_name.pascalCase()}}() async {
    if (isClosed || state is {{feature_name.pascalCase()}}Loading) return;
    emit(const {{feature_name.pascalCase()}}Loading());
    final result = await _get{{feature_name.pascalCase()}}UseCase();
    if (isClosed) return;
    result.fold((failure) {
      _logger.error('[{{feature_name.pascalCase()}}Cubit] ${failure.message}');
      emit({{feature_name.pascalCase()}}Error(failure));
    }, (entity) => emit({{feature_name.pascalCase()}}Success(entity)));
  }
}
