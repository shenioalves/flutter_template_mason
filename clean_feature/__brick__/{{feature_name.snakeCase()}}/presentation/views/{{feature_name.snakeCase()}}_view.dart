/*
 * ARQUIVO: lib/src/features/{{feature_name.snakeCase()}}/presentation/views/{{feature_name.snakeCase()}}_view.dart
 * RESPONSABILIDADE: Tela principal da feature. Apenas UI e reação a estados do Cubit.
 * COMO USAR: Registrada no {{feature_name.pascalCase()}}Module dentro de GoRoute.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/{{feature_name.snakeCase()}}_cubit.dart';
import '../cubit/{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}View extends StatefulWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  State<{{feature_name.pascalCase()}}View> createState() => _{{feature_name.pascalCase()}}ViewState();
}

class _{{feature_name.pascalCase()}}ViewState extends State<{{feature_name.pascalCase()}}View> {
  @override
  void initState() {
    super.initState();
    // Exemplo: carregar dados ao abrir a tela
    // context.read<{{feature_name.pascalCase()}}Cubit>().loadData('param');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.titleCase()}}'),
      ),
      body: BlocConsumer<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
        listener: (context, state) {
          if (state is {{feature_name.pascalCase()}}Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is {{feature_name.pascalCase()}}Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is {{feature_name.pascalCase()}}Success) {
            return Center(
              child: Text('Sucesso: ${state.data.id}'),
            );
          }

          return const Center(
            child: Text('Estado Inicial - Pressione o botão'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<{{feature_name.pascalCase()}}Cubit>().loadData('teste');
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
