import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Tema principal da aplicação.
/// Substitui o antigo `AppTheme`.
class AppTheme {
  AppTheme._();

  static ThemeData getTheme() {
    final textTheme = AppTypography.getTextTheme();

    return ThemeData(
      fontFamily: 'Radio Canada',
      primaryColor: AppColors.violet_0,
      splashColor: AppColors.violet_0,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.violet_0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          minimumSize: WidgetStateProperty.all<Size>(
            Size(
              double.infinity,
              40,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(0),
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColors.violet_350,
          ),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.amber,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.violet_350,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hoverColor: AppColors.violet_400,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.violet_400, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.violet_0,
      ).copyWith(inversePrimary: AppColors.blue_200),
      scaffoldBackgroundColor: AppColors.violet_0,
      textTheme: textTheme,
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFFF9A557),
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: IconThemeData(
        color: const Color(0xFF0E151A),
        size: 35,
      ),
    );
  }
}
