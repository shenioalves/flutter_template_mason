/// Configuração pública para a futura integração de assinaturas.
/// A base não realiza compras nem consome estes valores automaticamente.
/// Consulte docs/ASSINATURAS.md antes de implementar a feature.
class StoreConfig {
  StoreConfig._();

  // TODO(lojas): informe o ID REAL da assinatura no Google Play Console.
  // Exemplo: premium_monthly. Use --dart-define=PLAY_PRODUCT_ID=...
  static const playProductId = String.fromEnvironment('PLAY_PRODUCT_ID');

  // TODO(lojas): informe o ID REAL do produto no App Store Connect.
  // Exemplo: com.suaempresa.seuapp.premium.monthly.
  static const appStoreProductId = String.fromEnvironment(
    'APP_STORE_PRODUCT_ID',
  );

  // TODO(lojas): se a integração exigir verificação local por RSA,
  // informe aqui a CHAVE PÚBLICA Base64 da Google Play via PLAY_PUBLIC_KEY.
  // Nem todo SDK exige essa chave; in_app_purchase não a recebe ao inicializar.
  // Essa chave não é o keystore que assina o aplicativo.
  static const playPublicKey = String.fromEnvironment('PLAY_PUBLIC_KEY');

  // TODO(lojas/backend): valide compras no servidor antes de liberar benefícios.
  // Credenciais Google de serviço, chave Apple .p8 e shared secret ficam no
  // backend, nunca neste arquivo, no .env ou em --dart-define do aplicativo.
}
