// TODO(assets): adicione somente caminhos de arquivos existentes e declare suas pastas no pubspec.
/*
 * ARQUIVO: lib/src/core/ui/theme/app_assets.dart
 * RESPONSABILIDADE: Centralizar os caminhos das imagens e ícones do aplicativo.
 */

enum AppAssets {
  example('assets/icons/example.svg');

  final String path;
  const AppAssets(this.path);
}
