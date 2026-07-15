import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logger/app_logger.dart';
import '../../domain/usecases/get_example_usecase.dart';
import 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit({
    required GetExampleUseCase getExampleUseCase,
    required AppLogger logger,
  }) : _getExampleUseCase = getExampleUseCase,
       _logger = logger,
       super(const ExampleInitial());

  final GetExampleUseCase _getExampleUseCase;
  final AppLogger _logger;

  Future<void> fetchExample() async {
    emit(const ExampleLoading());
    final result = await _getExampleUseCase();
    result.fold((failure) {
      _logger.error('[ExampleCubit] ${failure.message}');
      emit(ExampleError(failure));
    }, (entity) => emit(ExampleSuccess(entity)));
  }
}
