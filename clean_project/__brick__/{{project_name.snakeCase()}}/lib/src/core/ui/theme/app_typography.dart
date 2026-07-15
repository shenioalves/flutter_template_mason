import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Definições de tipografia base (TextStyleConfig + TypographyConfig).
class AppTypography {
  AppTypography._();

  static const TextStyle display = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading1 = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labels = TextStyle(
    fontFamily: 'Radio Canada',
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle emoji = TextStyle(fontFamily: 'Noto Color Emoji');

  /// Retorna o TextTheme base para injetar no ThemeData.
  ///
  static TextTheme getTextTheme() {
    final Color color = AppColors.gray_300;
    return TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 23,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.normal,
        color: color,
        fontSize: 16,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.normal,
        color: color,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.normal,
        color: color,
        fontSize: 20,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 21,
        color: color,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: 15,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.normal,
        color: color,
        fontSize: 18,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.normal,
        color: color,
        fontSize: 16,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.normal,
        color: color,
        fontSize: 18,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.normal,
        color: color,
        fontSize: 16,
      ),
    );
  }
}
