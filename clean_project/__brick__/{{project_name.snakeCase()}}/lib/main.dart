/*
 * ARQUIVO: lib\main.dart
 * RESPONSABILIDADE: Ponto de entrada da aplicação
 * COMO USAR: Inicializar dependências e executar o runApp
 */
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/src/core/di/injection_container.dart';
import 'package:{{project_name.snakeCase()}}/src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.init();
  runApp(const MyApp());
}

