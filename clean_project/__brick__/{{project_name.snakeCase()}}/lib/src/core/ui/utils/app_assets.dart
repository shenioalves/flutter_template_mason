/*
 * ARQUIVO: lib/src/core/ui/theme/app_assets.dart
 * RESPONSABILIDADE: Centralizar os caminhos das imagens e ícones do aplicativo.
 */

enum AppAssets {
  bank('assets/icons/bank.png'),
  billReceipt('assets/icons/bill-receipt.png'),
  cash('assets/icons/cash.png'),
  baseLogo('assets/auth/base_logo.png'),
  wppHome('assets/icons/wpp_home.png'),
  cashImage('assets/images/cash.png'),

  // Animations
  splashAnimation('assets/animations/splash.gif');

  final String path;
  const AppAssets(this.path);
}
