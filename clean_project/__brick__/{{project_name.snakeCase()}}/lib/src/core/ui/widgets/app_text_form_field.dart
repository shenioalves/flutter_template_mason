/*
 * ARQUIVO: lib/src/core/ui/widgets/app_text_form_field.dart
 * RESPONSABILIDADE: Componentes de UI reutilizáveis
 * COMO USAR: Componente de campo de texto padronizado.
 */
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: AppTypography.bodyMedium.copyWith(color: AppColors.gray900),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

