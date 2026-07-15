import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

class {{feature_name.pascalCase()}}Model {
  const {{feature_name.pascalCase()}}Model({required this.id, required this.name});

  final String id;
  final String name;

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    if (id is! String || name is! String) {
      throw const FormatException('{{feature_name.pascalCase()}} fields are invalid.');
    }
    return {{feature_name.pascalCase()}}Model(id: id, name: name);
  }

  {{feature_name.pascalCase()}}Entity toEntity() =>
      {{feature_name.pascalCase()}}Entity(id: id, name: name);
}
