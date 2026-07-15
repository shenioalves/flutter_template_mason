/*
 * ARQUIVO: lib/src/core/ui/widgets/views/error_connection_view.dart
 * RESPONSABILIDADE: Tela de erro exibida quando não há conexão com a internet.
 * COMO USAR: Renderizada automaticamente pelo AppTemplateView quando ViewState.errorConnection.
 */

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:flutter/material.dart';

/// View de erro exibida quando não há conexão com a internet.
class ErrorConnectionView extends StatelessWidget {
  const ErrorConnectionView({super.key, required this.onRefreshError});

  final VoidCallback onRefreshError;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 70.h(context),
          horizontal: 20.w(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText(
              text: 'Sem Internet',
              typography: AppTypography.heading1,
              color: AppColors.gray_400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45.h(context)),
            AppIcon(icon: Icons.corporate_fare_rounded),
            SizedBox(height: 20.h(context)),
            const AppText(
              text: 'Conecte-se novamente',
              typography: AppTypography.body,
              color: AppColors.gray_300,
              textAlign: TextAlign.center,
            ),
            const AppText(
              text: 'Verifique sua conexão',
              typography: AppTypography.body,
              color: AppColors.gray_300,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45.h(context)),
            AppButton(label: 'Tente novamente', onPressed: onRefreshError),
          ],
        ),
      ),
    );
  }
}
