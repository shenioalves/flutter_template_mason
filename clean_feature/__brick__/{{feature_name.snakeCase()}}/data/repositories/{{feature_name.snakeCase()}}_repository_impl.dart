import '../../../../core/logger/app_logger.dart';
import '../../../../core/network/api_client_exception.dart';
import '../../../../core/utils/result/result.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/failures/{{feature_name.snakeCase()}}_failure.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../datasources/{{feature_name.snakeCase()}}_datasource.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  {{feature_name.pascalCase()}}RepositoryImpl(this._dataSource, this._logger);

  final {{feature_name.pascalCase()}}DataSource _dataSource;
  final AppLogger _logger;

  @override
  Future<Result<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}() async {
    try {
      final model = await _dataSource.get{{feature_name.pascalCase()}}();
      return Success<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(model.toEntity());
    } on ApiClientException catch (error) {
      _logger.error(
        'Falha HTTP: kind=${error.kind}, status=${error.statusCode}',
      );
      return Failure<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(
        FailureInfo(type: _mapException(error), message: _messageFrom(error)),
      );
    } on FormatException catch (_) {
      _logger.error('Resposta da API com formato inválido.');
      return Failure<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(
        FailureInfo(
          type: {{feature_name.pascalCase()}}Failure.invalidResponse,
          message: 'Não foi possível interpretar os dados recebidos.',
        ),
      );
    } catch (_) {
      _logger.error('Falha inesperada ao carregar os dados.');
      return Failure<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(
        FailureInfo(
          type: {{feature_name.pascalCase()}}Failure.unknown,
          message: 'Não foi possível carregar os dados. Tente novamente.',
        ),
      );
    }
  }

  {{feature_name.pascalCase()}}Failure _mapException(ApiClientException error) {
    if (error.kind == ApiClientErrorKind.noConnection) {
      return {{feature_name.pascalCase()}}Failure.noConnection;
    }
    if (error.kind == ApiClientErrorKind.timeout) {
      return {{feature_name.pascalCase()}}Failure.timeout;
    }
    final statusCode = error.statusCode;
    if (statusCode != null && statusCode >= 500 && statusCode <= 599) {
      return {{feature_name.pascalCase()}}Failure.serverError;
    }
    return {{feature_name.pascalCase()}}Failure.unknown;
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
