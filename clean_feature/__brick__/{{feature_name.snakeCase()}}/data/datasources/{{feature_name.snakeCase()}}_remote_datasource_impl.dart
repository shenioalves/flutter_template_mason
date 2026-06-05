import '../models/{{feature_name.snakeCase()}}_model.dart';
import '{{feature_name.snakeCase()}}_datasource.dart';

class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}DataSource {
  @override
  Future<{{feature_name.pascalCase()}}Model> get{{feature_name.pascalCase()}}(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return {{feature_name.pascalCase()}}Model(id: id, name: '{{feature_name.pascalCase()}} Data from API');
  }
}
