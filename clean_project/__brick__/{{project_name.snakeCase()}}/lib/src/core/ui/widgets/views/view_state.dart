/*
 * ARQUIVO: lib/src/core/ui/widgets/views/view_state.dart
 * RESPONSABILIDADE: Definir os estados visuais possíveis de qualquer tela.
 * COMO USAR: Usar com AppTemplateView para alternar entre estados da UI.
 */

/// Estados visuais possíveis para uma tela encapsulada pelo [AppTemplateView].
///
/// Cada Cubit da feature é responsável por mapear seus estados de negócio
/// para um destes estados visuais.
enum ViewState {
  /// Estado inicial — antes de qualquer ação.
  initial,

  /// Carregamento em andamento.
  loading,

  /// Dados carregados com sucesso.
  success,

  /// Erro genérico do servidor (5xx).
  errorServer,

  /// Erro de conexão (sem internet).
  errorConnection,

  /// Erro de token (sessão expirada).
  errorToken,

  /// Nenhum dado disponível.
  empty,
}
