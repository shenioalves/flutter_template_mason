import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

/// Componente customizado para texto rico (RichText).
///
/// Encapsula o [RichText] nativo do Flutter, aplicando por padrão
/// a tipografia do projeto ([AppTypography]) ao [TextSpan] raiz.
///
/// Uso:
/// ```dart
/// AppRichText(
///   children: [
///     TextSpan(text: 'Texto normal '),
///     TextSpan(
///       text: 'texto em negrito',
///       style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
///     ),
///   ],
///   typography: AppTypography.bodySmall,
///   color: AppColors.gray_350,
/// )
/// ```
class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    this.text,
    required this.children,
    this.color,
    this.typography = AppTypography.body,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  /// Texto opcional no [TextSpan] raiz (antes dos [children]).
  final String? text;

  /// Lista de [InlineSpan] filhos do [TextSpan] raiz.
  final List<InlineSpan> children;

  /// Cor padrão aplicada ao estilo raiz.
  final Color? color;

  /// Tipografia base do [TextSpan] raiz.
  final TextStyle typography;

  /// Alinhamento do texto.
  final TextAlign textAlign;

  /// Número máximo de linhas.
  final int? maxLines;

  /// Comportamento de overflow.
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      text: TextSpan(
        text: text,
        style: typography.copyWith(color: color),
        children: children,
      ),
    );
  }
}
