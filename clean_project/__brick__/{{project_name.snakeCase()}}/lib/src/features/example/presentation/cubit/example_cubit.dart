/*
 * ARQUIVO: lib/src/features/example/presentation/cubit/example_cubit.dart
 * RESPONSABILIDADE: Gerenciar o estado da tela e coordenar a execução de UseCases.
 * COMO USAR: Injetar via BlocProvider e acessar via context.read().
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_example_usecase.dart';
import 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  final GetExampleUseCase getExampleUseCase;

  ExampleCubit(this.getExampleUseCase) : super(ExampleInitial());

  Future<void> fetchExample() async {
    emit(ExampleLoading());

    final result = await getExampleUseCase();

    result.fold(
      (failure) => emit(ExampleError(failure.message ?? failure.type.name)),
      (entity) => emit(ExampleSuccess(entity)),
    );
  }
}

