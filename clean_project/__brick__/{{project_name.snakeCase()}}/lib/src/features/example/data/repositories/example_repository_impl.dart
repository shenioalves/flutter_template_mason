import '../../../../core/network/api_client_exception.dart';
import '../../../../core/utils/result/result.dart';
import '../../domain/entities/example_entity.dart';
import '../../domain/failures/example_failure.dart';
import '../../domain/repositories/example_repository.dart';
import '../datasources/example_datasource.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  ExampleRepositoryImpl(this._dataSource);

  final ExampleDataSource _dataSource;

  @override
  Future<Result<ExampleFailure, ExampleEntity>> getExample() async {
    try {
      final model = await _dataSource.getExample();
      return Success<ExampleFailure, ExampleEntity>(model.toEntity());
    } on ApiClientException catch (error) {
      return Failure<ExampleFailure, ExampleEntity>(
        FailureInfo(type: _mapException(error), message: _messageFrom(error)),
      );
    } on FormatException catch (error) {
      return Failure<ExampleFailure, ExampleEntity>(
        FailureInfo(
          type: ExampleFailure.invalidResponse,
          message: error.message,
        ),
      );
    } catch (error) {
      return Failure<ExampleFailure, ExampleEntity>(
        FailureInfo(type: ExampleFailure.unknown, message: error.toString()),
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

  String _messageFrom(ApiClientException error) {
    final data = error.responseData;
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['error'];
      if (message is String && message.isNotEmpty) return message;
    }
    return error.message ?? 'Unable to load the example.';
  }
}
