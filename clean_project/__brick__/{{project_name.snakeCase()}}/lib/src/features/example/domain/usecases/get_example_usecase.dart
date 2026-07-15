import '../../../../core/utils/result/result.dart';
import '../entities/example_entity.dart';
import '../failures/example_failure.dart';
import '../repositories/example_repository.dart';

class GetExampleUseCase {
  const GetExampleUseCase(this._repository);

  final ExampleRepository _repository;

  Future<Result<ExampleFailure, ExampleEntity>> call() {
    return _repository.getExample();
  }
}
