/*
 * ARQUIVO: lib/src/features/example/presentation/cubit/example_cubit.dart
 * RESPONSABILIDADE: Gerenciar o estado da tela e coordenar a execução de UseCases.
 * CAMINHO DOS DADOS EM U:
 * - IDA (Pedido): Recebe eventos da View e chama o UseCase.
 * - VOLTA (Resposta): Converte o resultado do UseCase em um estado (Success/Error) para a View.
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_example_usecase.dart';
import 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  final GetExampleUseCase getExampleUseCase;

  ExampleCubit(this.getExampleUseCase) : super(ExampleInitial());

  Future<void> fetchExample(String id) async {
    emit(ExampleLoading());
    try {
      final result = await getExampleUseCase(id);
      emit(ExampleSuccess(result));
    } catch (e) {
      emit(ExampleError(e.toString()));
    }
  }
}
