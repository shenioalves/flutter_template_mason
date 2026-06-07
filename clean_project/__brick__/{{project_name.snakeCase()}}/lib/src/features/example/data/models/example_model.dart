/*
 * ARQUIVO: lib/src/features/example/data/models/example_model.dart
 * RESPONSABILIDADE: Realizar a ponte entre os dados brutos (JSON/DB) e a camada de domínio.
 * COMO USAR: Modelo de dados para serialização/deserialização (JSON).
 */

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/example_entity.dart';

part 'example_model.freezed.dart';
part 'example_model.g.dart';

@freezed
abstract class ExampleModel with _$ExampleModel {
  const ExampleModel._();

  const factory ExampleModel({required String id, required String name}) =
      _ExampleModel;

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  ExampleEntity toEntity() {
    return ExampleEntity(id: id, name: name);
  }
}

