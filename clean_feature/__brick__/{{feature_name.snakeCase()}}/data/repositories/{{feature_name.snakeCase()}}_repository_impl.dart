import '../../../../core/network/api_client_exception.dart';
import '../../../../core/utils/result/result.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/failures/{{feature_name.snakeCase()}}_failure.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../datasources/{{feature_name.snakeCase()}}_datasource.dart';

class {{feature_name.pascalCase()}}RepositoryImpl
    implements {{feature_name.pascalCase()}}Repository {
  {{feature_name.pascalCase()}}RepositoryImpl(this._dataSource);

  final {{feature_name.pascalCase()}}DataSource _dataSource;

  @override
  Future<Result<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>>
  get{{feature_name.pascalCase()}}() async {
    try {
      final model = await _dataSource.get{{feature_name.pascalCase()}}();
      return Success<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(
        model.toEntity(),
      );
    } on ApiClientException catch (error) {
      return Failure<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(
        FailureInfo(type: _mapException(error), message: _messageFrom(error)),
      );
    } on FormatException catch (error) {
      return Failure<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(
        FailureInfo(
          type: {{feature_name.pascalCase()}}Failure.invalidResponse,
          message: error.message,
        ),
      );
    } catch (error) {
      return Failure<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>(
        FailureInfo(
          type: {{feature_name.pascalCase()}}Failure.unknown,
          message: error.toString(),
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

  String _messageFrom(ApiClientException error) {
    final data = error.responseData;
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['error'];
      if (message is String && message.isNotEmpty) return message;
    }
    return error.message ?? 'Unable to load {{feature_name.snakeCase()}}.';
  }
}
