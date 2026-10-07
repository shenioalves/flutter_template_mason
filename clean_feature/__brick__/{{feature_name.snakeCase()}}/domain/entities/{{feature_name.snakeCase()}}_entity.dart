// TODO(feature): substitua id/name pelos dados de negócio; mantenha JSON fora da Entity.
import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}}Entity extends Equatable {
  const {{feature_name.pascalCase()}}Entity({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
