import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

import '../cubit/example_cubit.dart';
import '../cubit/example_state.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleCubit, ExampleState>(
      builder: (context, state) {
        return AppTemplateView(
          state: state.viewState,
          backgroundColor: AppColors.background,
          refreshPageError: context.read<ExampleCubit>().fetchExample,
          pageInitial: Center(
            child: AppButton(
              label: 'Buscar exemplo',
              onPressed: context.read<ExampleCubit>().fetchExample,
            ),
          ),
          pageSuccess: Center(
            child: state is ExampleSuccess
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppText(
                        text: 'Exemplo carregado',
                        typography: AppTypography.heading2,
                      ),
                      const SizedBox(height: 8),
                      AppText(
                        text: '${state.entity.id} - ${state.entity.name}',
                        typography: AppTypography.body,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
