/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/presentation/{{feature_name.snakeCase()}}_view.dart
 * RESPONSABILIDADE: Camada de Apresentação (UI).
 * COMO USAR: Instanciar e exibir como parte da navegação ou árvore de widgets.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/{{feature_name.snakeCase()}}_cubit.dart';
import 'cubit/{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('{{feature_name.pascalCase()}}')),
      body: Center(
        child: BlocBuilder<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
          builder: (context, state) {
            if (state is {{feature_name.pascalCase()}}Loading) {
              return const CircularProgressIndicator();
            } else if (state is {{feature_name.pascalCase()}}Success) {
              return Text('Data: ${state.entity.name}');
            } else if (state is {{feature_name.pascalCase()}}Error) {
              return Text('Error: ${state.message}');
            }
            return ElevatedButton(
              onPressed: () => context.read<{{feature_name.pascalCase()}}Cubit>().fetch{{feature_name.pascalCase()}}('123'),
              child: const Text('Fetch Data'),
            );
          },
        ),
      ),
    );
  }
}

