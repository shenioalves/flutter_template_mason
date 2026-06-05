import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../datasources/{{feature_name.snakeCase()}}_datasource.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}DataSource dataSource;

  {{feature_name.pascalCase()}}RepositoryImpl(this.dataSource);

  @override
  Future<{{feature_name.pascalCase()}}Entity> get{{feature_name.pascalCase()}}(String id) async {
    return await dataSource.get{{feature_name.pascalCase()}}(id);
  }
}
