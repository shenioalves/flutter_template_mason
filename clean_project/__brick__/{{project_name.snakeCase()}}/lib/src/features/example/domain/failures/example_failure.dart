// TODO(feature): adicione as falhas de negócio que a tela precisa distinguir.
import '../../../../core/utils/result/result.dart';

enum ExampleFailure implements FailureType {
  noConnection,
  timeout,
  serverError,
  invalidResponse,
  unknown,
}
