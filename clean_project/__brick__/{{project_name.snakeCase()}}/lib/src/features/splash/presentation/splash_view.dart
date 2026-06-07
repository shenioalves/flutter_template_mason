/*
 * ARQUIVO: lib/src/features/splash/presentation/splash_view.dart
 * RESPONSABILIDADE: Interface do usuário (View)
 * COMO USAR: Instanciar e exibir como parte da navegação ou árvore de widgets.
 */
import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue500,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.white,
        ),
      ),
    );
  }
}

