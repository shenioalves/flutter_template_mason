import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? padding;

  const AppIcon({super.key, required this.icon, this.size = 24, this.color})
    : backgroundColor = null,
      borderRadius = null,
      padding = null;

  const AppIcon.background({
    super.key,
    required this.icon,
    this.size = 24,
    this.color = AppColors.violet_300,
    this.backgroundColor = AppColors.gray_0,
    this.borderRadius = 8,
    this.padding = 16,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, size: size.img(context), color: color);

    if (backgroundColor == null) {
      return iconWidget;
    }

    return Container(
      padding: padding != null ? EdgeInsets.all(padding!) : null,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
      child: iconWidget,
    );
  }
}
