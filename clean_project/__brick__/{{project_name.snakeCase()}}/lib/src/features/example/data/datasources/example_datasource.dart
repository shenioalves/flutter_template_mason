// TODO(api): ajuste o contrato de consulta/gravação às operações da feature.
import '../models/example_model.dart';

abstract interface class ExampleDataSource {
  Future<ExampleModel> getExample();
}
