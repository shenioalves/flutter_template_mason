# Personalizar o projeto

Use a busca global do editor por `TODO`. Cada comentário descreve o que precisa ser decidido naquele arquivo. Resolva os itens da funcionalidade entregue; serviços opcionais podem continuar sem integração.

| Área | Arquivo | O que fazer |
| --- | --- | --- |
| API | `.env.example`, `.env` e `lib/src/core/network/di/network_dependencies.dart` | Definir URL pública e timeouts |
| Nome/versão | `pubspec.yaml` | Ajustar descrição e versão |
| Android | `android/app/build.gradle.kts` | Conferir applicationId e configurar assinatura release |
| Android visual | `android/app/src/main/AndroidManifest.xml` | Nome, ícone e permissões |
| iOS | `ios/Runner/Info.plist` e Runner no Xcode | Nome, permissões, Bundle Identifier, Team e assinatura |
| Tema | `lib/src/core/ui/theme/` | Cores, fontes e estilos |
| Responsividade | `lib/src/core/ui/utils/responsive_utils.dart` | Dimensões de referência |
| Imagens | `assets/`, `app_assets.dart` e `pubspec.yaml` | Arquivos reais e declaração de pastas |
| Início | `lib/src/features/splash/presentation/splash_view.dart` | Trocar destino de demonstração |
| Módulos | `lib/src/core/di/injection_container.dart` | Registrar features ativas |
| Rotas | `lib/src/core/routes/app_routes.dart` e módulos | Definir nomes e destinos |
| API da feature | `data/datasources` e `data/models` | Endpoint, payload e parsing |
| Regras/testes | `domain`, `presentation` e `test` | Substituir exemplo e testar |
| Assinaturas | `lib/src/core/platform/purchases/store_config.dart` | IDs e chave pública opcional; leia [Assinaturas](ASSINATURAS.md) |
| Plugins | `lib/src/core/platform/di/platform_dependencies.dart` | Registrar serviços opcionais |

## Publicar nas lojas

O Android usa assinatura de debug durante o desenvolvimento. Antes da publicação, configure a assinatura de upload/release em `android/app/build.gradle.kts`, conforme [o guia do Flutter](https://docs.flutter.dev/deployment/android#sign-the-app). O TODO aponta esse trecho. Não envie keystores ou senhas ao Git.

No iOS, abra `ios/Runner.xcworkspace` no Xcode e configure Runner em Signing & Capabilities com equipe e Bundle Identifier corretos. Veja [publicação iOS](https://docs.flutter.dev/deployment/ios). A chave de assinatura do aplicativo não é a chave pública de compras.

Para trocar o ícone, adicione um PNG real em `assets/images/app_icon.png`. Só então configure no `pubspec.yaml`:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: assets/images/app_icon.png
```

Execute `dart run flutter_launcher_icons`. O pacote já está no projeto; a configuração fica ausente até você fornecer uma imagem real. Para fontes, siga o README.
