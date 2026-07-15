import '../models/{{feature_name.snakeCase()}}_model.dart';

abstract interface class {{feature_name.pascalCase()}}DataSource {
  Future<{{feature_name.pascalCase()}}Model> get{{feature_name.pascalCase()}}();
}
