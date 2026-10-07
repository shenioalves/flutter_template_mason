// TODO(feature): implemente a ação/regra de negócio e teste usando o contrato do Repository.
import '../../../../core/utils/result/result.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../failures/{{feature_name.snakeCase()}}_failure.dart';
import '../repositories/{{feature_name.snakeCase()}}_repository.dart';

class Get{{feature_name.pascalCase()}}UseCase {
  const Get{{feature_name.pascalCase()}}UseCase(this._repository);

  final {{feature_name.pascalCase()}}Repository _repository;

  Future<Result<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>> call() {
    return _repository.get{{feature_name.pascalCase()}}();
  }
}
