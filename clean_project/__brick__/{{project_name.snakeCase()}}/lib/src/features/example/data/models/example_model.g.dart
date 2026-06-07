/*
 * ARQUIVO: lib/src/features/example/data/models/example_model.g.dart
 * RESPONSABILIDADE: Modelos de dados (Data Transfer Objects)
 * COMO USAR: Consultar documentação
 */
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExampleModel _$ExampleModelFromJson(Map<String, dynamic> json) =>
    _ExampleModel(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$ExampleModelToJson(_ExampleModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

