// TODO(tema): adicione fontes em assets/fonts e declare-as no pubspec antes de usar fontFamily.
import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Definições de tipografia base (TextStyleConfig + TypographyConfig).
class AppTypography {
  AppTypography._();

  static const TextStyle display = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labels = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle emoji = TextStyle();

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
