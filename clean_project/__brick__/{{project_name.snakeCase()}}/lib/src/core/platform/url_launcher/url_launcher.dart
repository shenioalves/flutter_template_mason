/*
 * ARQUIVO: lib/src/core/platform/url_launcher/url_launcher.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Consultar documentação
 */
abstract class UrlLauncher {
  Future<void> launchExternalAppUrl(String url);
  Future<void> sendWhatsAppMessage(String number, {String? message});
}
