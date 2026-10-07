// TODO(tema): ajuste as dimensões de referência ao layout do novo projeto.
import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double _mockupHeight = 752;
  static const double _mockupWidth = 360;

  static double getTextScale(BuildContext context) {
    final shortestSide = MediaQuery.sizeOf(context).shortestSide;
    var scale = shortestSide / _mockupWidth;

    return scale.clamp(0.8, 1.2);
  }

  static double getImageScale(BuildContext context) {
    final double phoneWidth = MediaQuery.sizeOf(context).width;
    final double scale = phoneWidth / _mockupWidth;

    return scale.clamp(0.8, 1.3);
  }

  static double getHeightSpacing(BuildContext context, double heightSpacing) {
    final double phoneHeight = MediaQuery.sizeOf(context).height;
    return (heightSpacing / _mockupHeight) * phoneHeight;
  }

  static double getWidthSpacing(BuildContext context, double widthSpacing) {
    final double phoneWidth = MediaQuery.sizeOf(context).width;
    return (widthSpacing / _mockupWidth) * phoneWidth;
  }
}

extension ResponsiveExtension on num {
  /// retorna a altura proporcional, uso: 100.h(context)
  double h(BuildContext context) =>
      ResponsiveUtils.getHeightSpacing(context, toDouble());

  /// retorna a largura proporcional, uso: 100.w(context)
  double w(BuildContext context) =>
      ResponsiveUtils.getWidthSpacing(context, toDouble());

  /// retorna a escala da imagem proporcional, uso: 100.imgScale(context)
  double img(BuildContext context) =>
      toDouble() * ResponsiveUtils.getImageScale(context);

  /// retorna o tamanho da fonte proporcional, uso: 100.sp(context)
  double sp(BuildContext context) =>
      toDouble() * ResponsiveUtils.getTextScale(context);
}
