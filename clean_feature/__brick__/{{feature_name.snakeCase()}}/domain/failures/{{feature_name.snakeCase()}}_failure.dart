import '../../../../core/utils/result/result.dart';

enum {{feature_name.pascalCase()}}Failure implements FailureType {
  noConnection,
  timeout,
  serverError,
  invalidResponse,
  unknown,
}
