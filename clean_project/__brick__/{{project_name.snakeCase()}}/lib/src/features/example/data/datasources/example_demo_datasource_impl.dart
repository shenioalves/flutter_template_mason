import '../models/example_model.dart';
import 'example_datasource.dart';

/// Permite conhecer o fluxo completo antes de conectar uma API.
/// Troque esta implementação pela remota no ExampleModule ao integrar o backend.
class ExampleDemoDataSourceImpl implements ExampleDataSource {
  @override
  Future<ExampleModel> getExample() async {
    return const ExampleModel(id: '1', name: 'Meu primeiro exemplo');
  }
}
