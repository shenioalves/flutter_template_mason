import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

/// Componente customizado para trechos de texto (TextSpan).
///
/// Encapsula o [TextSpan] nativo do Flutter, aplicando por padrão
/// a tipografia do projeto ([AppTypography]).
///
/// Uso:
/// ```dart
/// AppTextSpan(
///   text: 'texto em negrito',
///   typography: AppTypography.bodySmall,
///   fontWeight: FontWeight.bold,
/// )
/// ```
class AppTextSpan extends TextSpan {
  AppTextSpan({
    super.text,
    super.children,
    super.recognizer,
    super.mouseCursor,
    super.onEnter,
    super.onExit,
    super.semanticsLabel,
    super.locale,
    super.spellOut,
    Color? color,
    TextStyle typography = AppTypography.body,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) : super(
          style: typography.copyWith(
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
          ),
        );
}
