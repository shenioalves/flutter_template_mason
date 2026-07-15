import '../../../../core/utils/result/result.dart';

enum ExampleFailure implements FailureType {
  noConnection,
  timeout,
  serverError,
  invalidResponse,
  unknown,
}
