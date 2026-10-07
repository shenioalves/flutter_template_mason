// TODO(ui): substitua a demonstração pela tela real; trate efeitos únicos com BlocListener.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../cubit/{{feature_name.snakeCase()}}_cubit.dart';
import '../cubit/{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      builder: (context, state) {
        return AppTemplateView(
          state: state.viewState,
          backgroundColor: AppColors.background,
          refreshPageError: context.read<{{feature_name.pascalCase()}}Cubit>().fetch{{feature_name.pascalCase()}},
          pageInitial: Center(
            child: AppButton(
              label: 'Carregar {{feature_name.titleCase()}}',
              onPressed: context.read<{{feature_name.pascalCase()}}Cubit>().fetch{{feature_name.pascalCase()}},
            ),
          ),
          pageSuccess: Center(
            child: state is {{feature_name.pascalCase()}}Success
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppText(
                        text: '{{feature_name.titleCase()}} carregado',
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
