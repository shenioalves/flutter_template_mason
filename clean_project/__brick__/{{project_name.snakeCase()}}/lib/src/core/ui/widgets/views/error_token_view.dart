/*
 * ARQUIVO: lib/src/core/ui/widgets/views/error_token_view.dart
 * RESPONSABILIDADE: Tela de erro exibida quando o token de sessão é inválido ou expirou.
 * COMO USAR: Renderizada automaticamente pelo AppTemplateView quando ViewState.errorToken.
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

/// View de erro exibida quando a sessão do usuário expirou.
///
/// A base retorna à splash; a feature de autenticação deve definir o destino real.
class ErrorTokenView extends StatelessWidget {
  const ErrorTokenView({super.key});

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
            const AppIcon(
              icon: Icons.lock_clock_outlined,
              size: 80,
              color: AppColors.violet_300,
            ),
            SizedBox(height: 20.h(context)),
            const AppText(
              text: 'Sessão expirada',
              typography: AppTypography.heading1,
              color: AppColors.gray_400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h(context)),
            const AppText(
              text: 'Sua sessão expirou. Por favor,\nfaça login novamente.',
              typography: AppTypography.body,
              color: AppColors.gray_300,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45.h(context)),
            AppButton(
              // TODO(auth): ao implementar login, direcione para a rota de autenticação real.
              label: 'Voltar ao inicio',
              onPressed: () => context.goNamed(AppRoutes.splashName),
            ),
          ],
        ),
      ),
    );
  }
}
