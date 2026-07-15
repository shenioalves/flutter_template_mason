import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';

/// Falhas genéricas reutilizáveis por qualquer camada do sistema.
enum GenericFailure implements FailureType {
  unknown,
  badRequest,
  unauthorized,
  notFound,
  serverError,
  noConnection,
  timeout,
}
