/*
 * ARQUIVO: lib/src/core/utils/extensions/list_extension.dart
 * RESPONSABILIDADE: Utilitários e extensões auxiliares
 * COMO USAR: Extensões de conveniência para tipos nativos.
 */
extension ListNumberExtension on List<num> {
  /// Calculate the average of the elements in a list of numbers:
  double get average => isNotEmpty ? (reduce((a, b) => a + b) / length) : 0.0;
}

extension ListNullExtension on List? {
  /// Checks is the list is not null nor empty
  bool get isNotNullOrEmpty {
    return this?.isNotEmpty ?? false;
  }
}
