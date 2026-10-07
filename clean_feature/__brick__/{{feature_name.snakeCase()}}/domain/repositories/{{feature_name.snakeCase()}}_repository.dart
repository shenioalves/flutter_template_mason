// TODO(feature): declare as operações reais; mantenha os mesmos tipos no RepositoryImpl.
import '../../../../core/utils/result/result.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../failures/{{feature_name.snakeCase()}}_failure.dart';

abstract interface class {{feature_name.pascalCase()}}Repository {
  Future<Result<{{feature_name.pascalCase()}}Failure, {{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}();
}
