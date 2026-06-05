import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}}Entity extends Equatable {
  final String id;
  final String name;

  const {{feature_name.pascalCase()}}Entity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
