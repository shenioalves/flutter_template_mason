# Criar um projeto Flutter

Este brick cria o app, Android/iOS, arquitetura, exemplo funcional, testes e documentação para o time.

## 1. Preparar as ferramentas

Siga a [instalação de Flutter, Git e Mason](../README.md). Confira `flutter doctor` e `mason --version`.

## 2. Gerar o projeto

Para usar a cópia local, execute na raiz deste repositório:

```sh
mason get
mason make clean_project --project_name meu_app --org_name com.exemplo -o ../apps
```

Para usar Git, instale uma vez:

```sh
mason add -g clean_project --git-url https://github.com/shenioalves/flutter_template_mason.git --git-path clean_project
```

Depois, na pasta que vai guardar os apps:

```sh
mason make clean_project --project_name meu_app --org_name com.exemplo
```

| Variável | Exemplo | Significado |
| --- | --- | --- |
| `project_name` | `meu_app` | Nome do pacote Dart e da pasta. Use letras minúsculas e `_`; sem espaços, acentos ou hífens; não comece com número |
| `org_name` | `com.minhaempresa` | Prefixo dos identificadores Android/iOS |

Sem as opções, o Mason pergunta os valores. Não gere dentro de outro app Flutter. O brick já cria a pasta do projeto: `-o ../apps` resulta em `../apps/meu_app`.

## 3. Preparar e executar o app

Entre na pasta **gerada**, ajustando ao destino escolhido:

```sh
cd ../apps/meu_app
```

Crie sua configuração local no PowerShell:

```powershell
Copy-Item .env.example .env
```

No macOS/Linux: `cp .env.example .env`.

Baixe as bibliotecas e complete os arquivos de plataforma gerados pelo Flutter:

```sh
flutter pub get
flutter create --platforms=android,ios --org com.exemplo .
flutter analyze
flutter test
flutter devices
flutter run -d ID_DO_DISPOSITIVO
```

Substitua `com.exemplo` pela organização informada ao Mason e `ID_DO_DISPOSITIVO` por um ID listado em `flutter devices`. O `flutter create` é usado **uma vez no app recém-gerado** para completar arquivos como o wrapper do Gradle, ausente do brick. Não use `--overwrite`; confira o diff se repetir em um projeto já desenvolvido. iOS requer macOS/Xcode.

Ao abrir, a splash leva ao exemplo. Toque em **Carregar exemplo**: aparecerá **Meu primeiro exemplo**, usando dados locais. Não é preciso ter uma API pronta. A implementação remota também está disponível para o exercício descrito no README do app.

## 4. Preparar o gerador de features

O app inclui `mason.yaml` apontando para Git. Com a versão desejada publicada:

```sh
mason get
```

Para experimentar mudanças locais, substitua o conteúdo do `mason.yaml` do app pelo caminho do seu clone. Ajuste o caminho do exemplo; `/` funciona no YAML do Windows:

```yaml
bricks:
  clean_feature:
    path: C:/dev/flutter_template_mason/clean_feature
```

Execute `mason get` novamente. Não mantenha `git` e `path` na mesma entrada.

## 5. Personalizar e começar

Leia o `README.md` do app: ele explica arquitetura, integração, use cases, componentes, assets, testes e uso dos perfis multi-agent. Pesquise `TODO` no projeto; os comentários apontam configurações de API, nome, tema, módulos e lojas. O guia `docs/PERSONALIZACAO.md` organiza esses pontos.

Depois siga [Criar feature](../clean_feature/README.md). O gerador entrega o ponto de partida; campos e endpoints precisam representar a funcionalidade real.
