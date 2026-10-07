// TODO(api): adapte campos e parsing ao JSON confirmado com o backend; atualize toEntity().
import '../../domain/entities/example_entity.dart';

class ExampleModel {
  const ExampleModel({required this.id, required this.name});

  final String id;
  final String name;

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    if (id is! String || name is! String) {
      throw const FormatException('Example fields are invalid.');
    }
    return ExampleModel(id: id, name: name);
  }

  ExampleEntity toEntity() => ExampleEntity(id: id, name: name);
}
