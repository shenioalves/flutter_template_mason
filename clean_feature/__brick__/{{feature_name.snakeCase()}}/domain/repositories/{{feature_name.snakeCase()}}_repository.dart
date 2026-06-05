import '../entities/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<{{feature_name.pascalCase()}}Entity> get{{feature_name.pascalCase()}}(String id);
}
