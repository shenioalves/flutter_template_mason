/*
 * ARQUIVO: lib/src/core/ui/widgets/views/error_server_view.dart
 * RESPONSABILIDADE: Tela de erro genérica para falhas internas do servidor.
 * COMO USAR: Renderizada automaticamente pelo AppTemplateView quando ViewState.errorServer.
 */

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:flutter/material.dart';

/// View de erro exibida quando há falha no servidor (5xx).
class ErrorServerView extends StatelessWidget {
  const ErrorServerView({super.key, required this.onRefreshError});

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
              text: 'Erro interno no servidor',
              typography: AppTypography.heading1,
              color: AppColors.gray_400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45.h(context)),
            AppIcon(icon: Icons.error_outline),
            SizedBox(height: 20.h(context)),
            const AppText(
              text: 'Estamos trabalhando nisso',
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
