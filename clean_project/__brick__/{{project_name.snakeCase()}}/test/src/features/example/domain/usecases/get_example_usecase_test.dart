import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/entities/example_entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/failures/example_failure.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/repositories/example_repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/usecases/get_example_usecase.dart';

class MockRepository extends Mock implements ExampleRepository {}

void main() {
  test('preserva sucesso e falha retornados pelo contrato', () async {
    final repository = MockRepository();
    final useCase = GetExampleUseCase(repository);
    for (final expected in <Result<ExampleFailure, ExampleEntity>>[
      const Success(ExampleEntity(id: '1', name: 'Teste')),
      const Failure(FailureInfo(type: ExampleFailure.noConnection)),
    ]) {
      when(() => repository.getExample()).thenAnswer((_) async => expected);
      expect(await useCase(), same(expected));
    }
    verify(() => repository.getExample()).called(2);
  });
}
