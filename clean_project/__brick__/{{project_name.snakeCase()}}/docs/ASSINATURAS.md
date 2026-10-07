# Preparar assinaturas das lojas

Integração **opcional**: o template reserva `lib/src/core/platform/purchases/store_config.dart` com TODOs, mas não instala SDK de compras, cria produtos, processa pagamentos ou libera planos. Preencher constantes não implementa a assinatura.

## 1. Identificar cada informação

| Informação | Onde configurar |
| --- | --- |
| ID do produto Google Play | `StoreConfig.playProductId`, via `--dart-define=PLAY_PRODUCT_ID=...` |
| ID do produto Apple | `StoreConfig.appStoreProductId`, via `--dart-define=APP_STORE_PRODUCT_ID=...` |
| Chave pública RSA Google Play, se exigida pelo fluxo | `StoreConfig.playPublicKey`, via `--dart-define=PLAY_PUBLIC_KEY=...` |
| Keystore e senhas Android | Configuração de build/release, fora do Git |
| Credenciais privadas Google/Apple | Backend/gerenciador de segredos do servidor |

`888888888` não é uma chave válida. A chave pública não substitui ID de produto nem keystore. `in_app_purchase` não exige essa chave ao inicializar; preencha apenas se a solução de verificação local adotada a utilizar. Referências: [licenciamento Google](https://developer.android.com/google/play/licensing/client-side-verification) e [exemplo oficial do plugin](https://pub.dev/packages/in_app_purchase/example).

## 2. Preparar lojas e backend

1. Confirme applicationId Android e Bundle Identifier iOS.
2. Cadastre os produtos nos consoles e copie seus IDs exatos. Preço/moeda exibidos devem vir da loja.
3. Configure contas e ambientes de teste das lojas.
4. Combine o endpoint de validação com o backend e o retorno de benefícios/validade.
5. Guarde credenciais privadas Google e Apple no servidor. `.env` e `--dart-define` ficam no aplicativo e não protegem segredos.

O backend deve verificar compras e acompanhar mudanças da assinatura antes de conceder acesso. Veja [integração Google Play com backend](https://developer.android.com/google/play/billing/backend).

## 3. Implementar com a arquitetura

1. Gere `mason make clean_feature --feature_name subscriptions -o lib/src/features` e adapte o exemplo ao fluxo real.
2. Defina Entities de planos/benefícios, contrato do Repository e UseCases para consultar, comprar e restaurar.
3. Instale o SDK escolhido conforme sua documentação. Encapsule-o em DataSource/serviço; Cubit e Domain não importam o SDK.
4. Faça a implementação consumir os IDs de `StoreConfig`. Se os planos vierem do backend, use os IDs do contrato real em vez das constantes.
5. Envie a verificação ao backend usando `ApiClient`. Atualize benefícios após confirmação válida do servidor.
6. Trate pendência, sucesso, cancelamento, erro, restauração e conclusão de transação conforme o SDK. Cancele listeners ao encerrar o serviço.
7. Registre as dependências e o módulo. Teste em sandbox/internal testing antes de publicar.

O [exemplo mantido pelo Flutter](https://pub.dev/packages/in_app_purchase/example) mostra observação e verificação de compras; use-o junto do contrato do seu backend.
