import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.typography = AppTypography.body,
    this.decoration,
    this.decorationColor,
  });

  final String text;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextStyle typography;
  final TextDecoration? decoration;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: typography.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
