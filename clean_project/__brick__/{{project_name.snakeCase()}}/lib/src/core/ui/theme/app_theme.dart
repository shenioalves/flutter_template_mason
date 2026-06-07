/*
 * ARQUIVO: lib/src/core/ui/theme/app_theme.dart
 * RESPONSABILIDADE: Definição de identidade visual (cores, tipografia, tema)
 * COMO USAR: Configuração central de cores e estilos do app.
 */
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.gray100,
        colorScheme: const ColorScheme.light(
          primary: AppColors.blue500,
          onPrimary: AppColors.white,
          secondary: AppColors.blue400,
          onSecondary: AppColors.white,
          error: AppColors.red500,
          onError: AppColors.white,
          surface: AppColors.white,
          onSurface: AppColors.gray900,
          outline: AppColors.gray300,
        ),
        textTheme: TextTheme(
          displayLarge: AppTypography.titleLarge.copyWith(color: AppColors.gray900),
          displayMedium: AppTypography.titleMedium.copyWith(color: AppColors.gray900),
          displaySmall: AppTypography.titleSmall.copyWith(color: AppColors.gray900),
          bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.gray700),
          bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.gray700),
          bodySmall: AppTypography.bodySmall.copyWith(color: AppColors.gray600),
          labelLarge: AppTypography.labelLarge.copyWith(color: AppColors.gray600),
          labelMedium: AppTypography.labelMedium.copyWith(color: AppColors.gray600),
          labelSmall: AppTypography.labelSmall.copyWith(color: AppColors.gray600),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue500,
            foregroundColor: AppColors.white,
            textStyle: AppTypography.labelLarge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.gray500),
          labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.gray700),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.gray300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.gray300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.blue500, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.red500),
          ),
        ),
      );
}

