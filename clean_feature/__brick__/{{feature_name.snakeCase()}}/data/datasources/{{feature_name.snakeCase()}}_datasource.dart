/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/data/datasources/{{feature_name.snakeCase()}}_datasource.dart
 * RESPONSABILIDADE: Definir o contrato para a fonte de dados (remota ou local).
 * COMO USAR: Interface implementada por RemoteDataSourceImpl.
 */

import '../models/{{feature_name.snakeCase()}}_model.dart';

abstract class {{feature_name.pascalCase()}}DataSource {
  Future<{{feature_name.pascalCase()}}Model> getDados(String param);
}
