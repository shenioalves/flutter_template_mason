/*
 * ARQUIVO: lib/src/features/example/presentation/example_view.dart
 * RESPONSABILIDADE: Interface do usuário (UI) para exibir a entidade Example.
 * COMO USAR: Instanciar e exibir como parte da navegação ou árvore de widgets.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/example_cubit.dart';
import 'cubit/example_state.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo Clean Architecture')),
      body: Center(
        child: BlocBuilder<ExampleCubit, ExampleState>(
          builder: (context, state) {
            if (state is ExampleLoading) {
              return const CircularProgressIndicator();
            } else if (state is ExampleSuccess) {
              return Text('ID: ${state.entity.id}\nNome: ${state.entity.name}');
            } else if (state is ExampleError) {
              return Text('Erro: ${state.message}');
            }
            return ElevatedButton(
              onPressed: () => context.read<ExampleCubit>().fetchExample(),
              child: const Text('Buscar Exemplo'),
            );
          },
        ),
      ),
    );
  }
}

