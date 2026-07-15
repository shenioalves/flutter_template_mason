/// Extensões úteis para manipulação de Strings em toda a aplicação.
extension StringExtensions on String {
  /// Verifica se a string está vazia ou contém apenas espaços.
  bool get isBlank => trim().isEmpty;

  /// Verifica se a string tem algum conteúdo (não nulo e não apenas espaços).
  bool get isNotBlank => !isBlank;

  /// Retorna apenas os números contidos na string.
  /// Muito útil para limpar máscaras de CPF/CNPJ/Telefone.
  String get onlyNumbers => replaceAll(RegExp(r'\D'), '');

  /// Capitaliza a primeira letra da string.
  String get capitalize {
    if (isBlank) return this;
    if (length == 1) return toUpperCase();
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

/// Extensão para Strings anuláveis (nullable).
extension NullableStringExtensions on String? {
  /// Retorna `true` se for null ou isBlank.
  bool get isNullOrBlank => this == null || this!.isBlank;
}
