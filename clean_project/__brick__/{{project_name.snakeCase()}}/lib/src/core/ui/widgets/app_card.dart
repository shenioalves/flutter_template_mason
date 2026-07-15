import 'package:flutter/material.dart';

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.color = Colors.white,
    this.borderRadius = 8,
    this.borderColor,
    this.gradient,
    this.boxShadows,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color color;
  final double borderRadius;
  final Color? borderColor;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadows;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: gradient == null ? color : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: boxShadows ?? AppShadows.card,
      ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: cardContent);
    }

    return cardContent;
  }
}
