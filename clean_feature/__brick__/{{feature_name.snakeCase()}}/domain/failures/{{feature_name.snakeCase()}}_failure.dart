// TODO(feature): adicione as falhas de negócio que a tela precisa distinguir.
import '../../../../core/utils/result/result.dart';

enum {{feature_name.pascalCase()}}Failure implements FailureType {
  noConnection,
  timeout,
  serverError,
  invalidResponse,
  unknown,
}
