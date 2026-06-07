/*
 * ARQUIVO: lib/src/core/utils/result/enums/generic_failure.dart
 * RESPONSABILIDADE: Utilitários e extensões auxiliares
 * COMO USAR: Consultar documentação
 */


import 'package:{{project_name.snakeCase()}}/src/core/utils/result/result.dart';

enum GenericFailure implements FailureType {
  unknown,
  badRequest,
  unauthorized,
}
