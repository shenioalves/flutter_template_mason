// TODO(feature): substitua id/name pelos dados de negócio; mantenha JSON fora da Entity.
import 'package:equatable/equatable.dart';

class ExampleEntity extends Equatable {
  const ExampleEntity({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
