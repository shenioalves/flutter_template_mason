import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/models/example_model.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/entities/example_entity.dart';

void main() {
  test('converte JSON válido para dados de negócio', () {
    final model = ExampleModel.fromJson({'id': '1', 'name': 'Teste'});
    expect(model.toEntity(), const ExampleEntity(id: '1', name: 'Teste'));
  });

  test('recusa campo obrigatório ausente ou com tipo incorreto', () {
    for (final json in <Map<String, dynamic>>[
      {'id': '1'},
      {'id': 1, 'name': 'Teste'},
      {'id': '1', 'name': null},
    ]) {
      expect(() => ExampleModel.fromJson(json), throwsFormatException);
    }
  });
}
