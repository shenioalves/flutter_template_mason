import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/src/core/logger/app_logger.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/entities/example_entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/failures/example_failure.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/usecases/get_example_usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/presentation/cubit/example_cubit.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/presentation/cubit/example_state.dart';

class MockUseCase extends Mock implements GetExampleUseCase {}

class MockLogger extends Mock implements AppLogger {}

void main() {
  late MockUseCase useCase;
  const entity = ExampleEntity(id: '1', name: 'Teste');
  const failure = FailureInfo(type: ExampleFailure.noConnection);
  ExampleCubit buildCubit() =>
      ExampleCubit(getExampleUseCase: useCase, logger: MockLogger());
  setUp(() => useCase = MockUseCase());

  blocTest<ExampleCubit, ExampleState>(
    'mostra carregamento e resultado',
    setUp: () =>
        when(() => useCase()).thenAnswer((_) async => const Success(entity)),
    build: buildCubit,
    act: (cubit) => cubit.fetchExample(),
    expect: () => [const ExampleLoading(), const ExampleSuccess(entity)],
  );
  blocTest<ExampleCubit, ExampleState>(
    'mostra carregamento e falha',
    setUp: () =>
        when(() => useCase()).thenAnswer((_) async => const Failure(failure)),
    build: buildCubit,
    act: (cubit) => cubit.fetchExample(),
    expect: () => [const ExampleLoading(), const ExampleError(failure)],
  );
  test('não duplica consulta nem emite depois de fechar a tela', () async {
    final pending = Completer<Result<ExampleFailure, ExampleEntity>>();
    when(() => useCase()).thenAnswer((_) => pending.future);
    final cubit = buildCubit();
    final fetch = cubit.fetchExample();
    await cubit.fetchExample();
    verify(() => useCase()).called(1);
    await cubit.close();
    pending.complete(const Success(entity));
    await expectLater(fetch, completes);
  });
}
