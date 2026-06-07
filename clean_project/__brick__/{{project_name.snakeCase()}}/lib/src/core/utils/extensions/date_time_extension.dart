/*
 * ARQUIVO: lib/src/core/utils/extensions/date_time_extension.dart
 * RESPONSABILIDADE: Utilitários e extensões auxiliares
 * COMO USAR: Extensões de conveniência para tipos nativos.
 */
extension DateTimeExtension on DateTime {
  /// Format date in readable string:
  String get formatted =>
      "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
}
