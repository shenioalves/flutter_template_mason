import '../models/example_model.dart';

abstract interface class ExampleDataSource {
  Future<ExampleModel> getExample();
}
