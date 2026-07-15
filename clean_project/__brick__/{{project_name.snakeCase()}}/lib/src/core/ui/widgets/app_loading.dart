import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

/// Componente de Loading padrão da aplicação.
/// Substitui o antigo `LoadPageWidget`.
class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.color,
    this.size = 45,
  });

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: color ?? AppColors.violet_300,
        size: size.img(context),
      ),
    );
  }
}
