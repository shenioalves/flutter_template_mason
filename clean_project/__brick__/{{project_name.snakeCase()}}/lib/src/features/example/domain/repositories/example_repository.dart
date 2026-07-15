import '../../../../core/utils/result/result.dart';
import '../entities/example_entity.dart';
import '../failures/example_failure.dart';

abstract interface class ExampleRepository {
  Future<Result<ExampleFailure, ExampleEntity>> getExample();
}
