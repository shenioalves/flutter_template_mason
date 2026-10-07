// TODO(inicio): substitua a ida ao exemplo pelo fluxo inicial real, usando um UseCase se houver sessão.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

import '../../../core/routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToExample();
  }

  Future<void> _navigateToExample() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (mounted) context.goNamed(AppRoutes.exampleName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.violet_350,
      body: Center(child: AppLoading(color: AppColors.gray_0)),
    );
  }
}
