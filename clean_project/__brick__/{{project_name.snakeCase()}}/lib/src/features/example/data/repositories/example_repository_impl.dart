import '../../../../core/logger/app_logger.dart';
import '../../../../core/network/api_client_exception.dart';
import '../../../../core/utils/result/result.dart';
import '../../domain/entities/example_entity.dart';
import '../../domain/failures/example_failure.dart';
import '../../domain/repositories/example_repository.dart';
import '../datasources/example_datasource.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  ExampleRepositoryImpl(this._dataSource, this._logger);

  final ExampleDataSource _dataSource;
  final AppLogger _logger;

  @override
  Future<Result<ExampleFailure, ExampleEntity>> getExample() async {
    try {
      final model = await _dataSource.getExample();
      return Success<ExampleFailure, ExampleEntity>(model.toEntity());
    } on ApiClientException catch (error) {
      _logger.error(
        'Falha HTTP: kind=${error.kind}, status=${error.statusCode}',
      );
      return Failure<ExampleFailure, ExampleEntity>(
        FailureInfo(type: _mapException(error), message: _messageFrom(error)),
      );
    } on FormatException catch (_) {
      _logger.error('Resposta da API com formato inválido.');
      return Failure<ExampleFailure, ExampleEntity>(
        FailureInfo(
          type: ExampleFailure.invalidResponse,
          message: 'Não foi possível interpretar os dados recebidos.',
        ),
      );
    } catch (_) {
      _logger.error('Falha inesperada ao carregar os dados.');
      return Failure<ExampleFailure, ExampleEntity>(
        FailureInfo(
          type: ExampleFailure.unknown,
          message: 'Não foi possível carregar os dados. Tente novamente.',
        ),
      );
    }
  }

  ExampleFailure _mapException(ApiClientException error) {
    if (error.kind == ApiClientErrorKind.noConnection) {
      return ExampleFailure.noConnection;
    }
    if (error.kind == ApiClientErrorKind.timeout) {
      return ExampleFailure.timeout;
    }
    final statusCode = error.statusCode;
    if (statusCode != null && statusCode >= 500 && statusCode <= 599) {
      return ExampleFailure.serverError;
    }
    return ExampleFailure.unknown;
  }

  // TODO(api): trate 401/403 e falhas de negócio conforme o contrato da feature.
  String _messageFrom(ApiClientException error) {
    return switch (error.kind) {
      ApiClientErrorKind.noConnection =>
        'Verifique sua conexão e tente novamente.',
      ApiClientErrorKind.timeout =>
        'A solicitação demorou demais. Tente novamente.',
      _ => 'Não foi possível carregar os dados. Tente novamente.',
    };
  }
}
