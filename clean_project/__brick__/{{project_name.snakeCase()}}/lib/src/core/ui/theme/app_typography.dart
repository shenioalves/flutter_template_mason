/*
 * ARQUIVO: lib/src/core/ui/theme/app_typography.dart
 * RESPONSABILIDADE: Definição de identidade visual (cores, tipografia, tema)
 * COMO USAR: Definição de estilos de texto e fontes.
 */
import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
    height: 1.2,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
    height: 1.2,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'Karla',
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    height: 1.2,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.2,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'Karla',
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.0,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'Karla',
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.0,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'Karla',
    fontWeight: FontWeight.w600,
    fontSize: 11.0,
    height: 1.0,
  );
}

