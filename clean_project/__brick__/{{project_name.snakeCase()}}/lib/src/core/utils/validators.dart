/*
 * ARQUIVO: lib/src/core/utils/validators.dart
 * RESPONSABILIDADE: Utilitários e extensões auxiliares
 * COMO USAR: Funções utilitárias para validação de campos.
 */
import 'package:{{project_name.snakeCase()}}/src/core/utils/extensions/string_extension.dart';

typedef Validator = String? Function(String?);

class Validators {
  Validators._();

  static String? combine(List<Validator> validators, String? value) {
    for (final v in validators) {
      final result = v(value);
      if (result != null) return result;
    }
    return null;
  }

  static String? required(String? value) => value == null || value.isEmpty ? 'Campo obrigatório' : null;

  static Validator minLength(int min) =>
      (value) => (value?.length ?? 0) < min ? 'Mínimo de $min caracteres' : null;

  static String? email(String? value) => value != null && value.isValidEmail ? null : 'Email inválido';

  static String? hasNumber(String? value) =>
      value == null || !RegExp(r'\d').hasMatch(value) ? 'Deve conter ao menos 1 número' : null;

  static String? hasUpperCase(String? value) =>
      value == null || !RegExp(r'[A-Z]').hasMatch(value) ? 'Deve conter ao menos 1 letra maiúscula' : null;

  static String? hasLowerCase(String? value) =>
      value == null || !RegExp(r'[a-z]').hasMatch(value) ? 'Deve conter ao menos 1 letra minúscula' : null;

  static String? phone(String? value) {
    final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    return digits.length != 11 ? 'Telefone inválido' : null;
  }
}

