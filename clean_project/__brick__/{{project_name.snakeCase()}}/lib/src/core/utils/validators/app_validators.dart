class AppValidators {
  AppValidators._();

  static String? isEmpty(String? value, [String? message]) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'Por favor, insira um valor válido';
    }
    return null;
  }

  static String? matchPassword(
    String? valueOne,
    String? valueTwo, [
    String? message,
  ]) {
    if (valueOne == null ||
        valueTwo == null ||
        valueOne.trim() != valueTwo.trim() ||
        valueOne.trim().isEmpty) {
      return message ?? 'As senhas não coincidem';
    }
    return null;
  }

  static String? moreThanFive(String? value, [String? message]) {
    if ((value?.trim().length ?? 0) < 6) {
      return message ?? 'O código tem no mínimo 6 caracteres';
    }
    return null;
  }

  static String? moreThanSeven(String? value, [String? message]) {
    if ((value?.trim().length ?? 0) < 8) {
      return message ?? 'A senha deve ter no mínimo 8 caracteres';
    }
    return null;
  }

  static String? hasNumber(String? value, [String? message]) {
    if (value == null || !RegExp(r'\d').hasMatch(value.trim())) {
      return message ?? 'A senha deve ter no mínimo 1 número';
    }
    return null;
  }

  static String? upperLetter(String? value, [String? message]) {
    if (value == null || !RegExp(r'[A-Z]').hasMatch(value.trim())) {
      return message ?? 'A senha deve ter no mínimo 1 letra maiúscula';
    }
    return null;
  }

  static String? lowerLetter(String? value, [String? message]) {
    if (value == null || !RegExp(r'[a-z]').hasMatch(value.trim())) {
      return message ?? 'A senha deve ter no mínimo 1 letra minúscula';
    }
    return null;
  }

  static String? validateEmail(String? value, [String? message]) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'Por favor, insira um e-mail válido';
    }
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(value.trim())) {
      return message ?? 'Por favor, insira um e-mail válido';
    }
    return null;
  }

  static String? validateTelephone(String? value, [String? message]) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'Por favor, insira um telefone válido';
    }
    final phoneNumbers = value.replaceAll(RegExp(r'\D'), '');
    if (phoneNumbers.length < 10 || phoneNumbers.length > 11) {
      return message ?? 'Por favor, insira um telefone válido';
    }
    return null;
  }

  /// Combina múltiplos validadores para um único campo.
  /// Retorna o erro do primeiro validador que falhar.
  static String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
