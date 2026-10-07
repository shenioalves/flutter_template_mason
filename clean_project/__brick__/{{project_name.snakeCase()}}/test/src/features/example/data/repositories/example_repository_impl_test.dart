import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/src/core/logger/app_logger.dart';
import 'package:{{project_name.snakeCase()}}/src/core/network/api_client_exception.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/datasources/example_datasource.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/models/example_model.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/repositories/example_repository_impl.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/entities/example_entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/failures/example_failure.dart';

class MockDataSource extends Mock implements ExampleDataSource {}

class MockLogger extends Mock implements AppLogger {}

void main() {
  late MockDataSource source;
  late ExampleRepositoryImpl repository;

  setUp(() {
    source = MockDataSource();
    repository = ExampleRepositoryImpl(source, MockLogger());
  });

  test('converte o Model para Entity ao consultar', () async {
    when(
      () => source.getExample(),
    ).thenAnswer((_) async => const ExampleModel(id: '1', name: 'Teste'));
    final result = await repository.getExample();
    expect(
      (result as Success<ExampleFailure, ExampleEntity>).object,
      const ExampleEntity(id: '1', name: 'Teste'),
    );
  });

  final cases = <(Object, ExampleFailure)>[
    (
      ApiClientException(kind: ApiClientErrorKind.noConnection),
      ExampleFailure.noConnection,
    ),
    (
      ApiClientException(kind: ApiClientErrorKind.timeout),
      ExampleFailure.timeout,
    ),
    (ApiClientException(statusCode: 500), ExampleFailure.serverError),
    (ApiClientException(statusCode: 503), ExampleFailure.serverError),
    (ApiClientException(statusCode: 599), ExampleFailure.serverError),
    (const FormatException('detalhe-interno'), ExampleFailure.invalidResponse),
    (StateError('detalhe-interno'), ExampleFailure.unknown),
    (
      ApiClientException(
        statusCode: 400,
        message: 'detalhe-interno',
        responseData: {'message': 'detalhe-interno'},
      ),
      ExampleFailure.unknown,
    ),
  ];
  for (final (error, expected) in cases) {
    test(
      'traduz ${error.runtimeType} para $expected sem expor detalhes',
      () async {
        when(() => source.getExample()).thenThrow(error);
        final result = await repository.getExample();
        final failure =
            (result as Failure<ExampleFailure, ExampleEntity>).error;
        expect(failure.type, expected);
        expect(failure.message, isNot(contains('detalhe-interno')));
      },
    );
  }
}
