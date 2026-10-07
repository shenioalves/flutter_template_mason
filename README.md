# Flutter Template Mason

Este repositório gera projetos Flutter com uma organização comum de pastas, componentes e fluxo de desenvolvimento. Os guias foram escritos para ajudar uma pessoa nova no time a executar o app e implementar sua primeira funcionalidade.

## Por onde começar

| Quero… | Guia |
| --- | --- |
| Instalar o Mason | Continue nesta página |
| Criar um aplicativo do zero | [Criar projeto](clean_project/README.md) |
| Adicionar uma funcionalidade | [Criar feature](clean_feature/README.md) |
| Trabalhar no app gerado | Abra o `README.md` dentro do novo app |

## 1. Entender as ferramentas

- **Flutter** executa e compila o aplicativo. Sua instalação inclui o Dart.
- **Mason** cria arquivos a partir de modelos.
- **Brick** é um desses modelos: `clean_project` cria o app; `clean_feature` cria uma funcionalidade.
- **mason.yaml** informa de onde baixar os bricks.
- **mason get** baixa os bricks.
- **flutter pub get** baixa as bibliotecas do app. São tarefas diferentes.

## 2. Preparar a máquina

Instale [Flutter](https://docs.flutter.dev/install) e [Git](https://git-scm.com/downloads). Configure Android Studio/SDK e um emulador para Android. Para executar ou compilar iOS, use macOS com Xcode.

Confira no terminal:

```sh
flutter --version
dart --version
git --version
flutter doctor
```

O projeto declara Dart `^3.10.7`: use Flutter com Dart compatível. Resolva os problemas da plataforma desejada indicados por `flutter doctor`.

## 3. Instalar o Mason

Execute de qualquer pasta:

```sh
dart pub global activate mason_cli
mason --version
```

Se `mason` não for reconhecido, adicione a pasta de executáveis do Pub ao `PATH` do usuário e reabra o terminal:

| Sistema | Pasta padrão |
| --- | --- |
| Windows | `%LOCALAPPDATA%\Pub\Cache\bin` |
| macOS/Linux | `$HOME/.pub-cache/bin` |

Se você definiu `PUB_CACHE`, use a subpasta `bin` desse caminho. No Windows, pesquise **Editar as variáveis de ambiente da sua conta**, edite `Path` e adicione a pasta. Não é necessário executar o Mason como administrador.

Como alternativa, substitua `mason` por `dart pub global run mason_cli:mason` em qualquer comando. Referências: [Mason](https://docs.brickhub.dev/) e [executáveis globais do Dart](https://dart.dev/tools/pub/cmd/pub-global).

## 4. Escolher de onde usar o template

### Usar esta cópia local, inclusive mudanças ainda não publicadas

Na raiz deste repositório, onde está este README:

```sh
mason get
mason make clean_project
```

Resultado: `../apps/meu_app`. Continue no [guia do projeto](clean_project/README.md#3-preparar-e-executar-o-app).

### Usar a versão publicada no Git

Instale uma vez, de qualquer pasta:

```sh
mason add -g clean_project --git-url https://github.com/shenioalves/flutter_template_mason.git --git-path clean_project
```

Entre na pasta que vai guardar seus aplicativos e execute:

```sh
mason make clean_project
```

Isso cria a subpasta `meu_app`. O Git só entrega alterações já commitadas e enviadas ao remoto. Para testar mudanças locais, use a opção anterior. Consulte as opções de [instalação](https://docs.brickhub.dev/mason-add/) e [destino da geração](https://docs.brickhub.dev/mason-make/).

## 5. No dia a dia

Na raiz do app criado, depois de configurar o brick:

### Na mesma raiz das suas features
```sh
mason get
mason make clean_feature
```

Siga [Criar feature](clean_feature/README.md).

## O que o template inclui

- API configurável por `.env` e `.env.example`.
- Contratos de injeção de dependências, rede, storage e logger.
- Clean Architecture com organização por features.
- Models com parsing explícito e conversão para Entities.
- Cubits com estados de loading, sucesso e erro.
- Componentes compartilhados, tema e centralização de assets.
- Testes com `flutter_test`, `mocktail` e `bloc_test`.
- Configuração opcional de assinaturas e publicação nas lojas.
- Protocolo multi-agent para dividir tarefas com segurança.

## Manter os bricks

Edite `clean_project/__brick__` ou `clean_feature/__brick__`. As expressões com chaves duplas são variáveis Mason; não substitua por nomes reais. Mantenha a feature `example` coerente com `clean_feature`.

Para validar, gere um app em uma pasta nova, siga seu README, gere também uma feature e execute `flutter analyze` e `flutter test` **no app gerado**. Não rode o analyzer nos arquivos que ainda contêm variáveis Mason.

O `mason.yaml` da raiz usa caminhos locais. O do app usa Git; troque para `path` local ao testar mudanças ainda não publicadas. Versione `mason-lock.json` no app. Para fixar uma revisão da equipe, adicione `ref: <tag-ou-commit-real>` ao bloco `git` e rode `mason get`. A versão em `brick.yaml` não cria uma tag automaticamente.

## Problemas comuns

| Problema | Como resolver |
| --- | --- |
| `mason` não reconhecido | Corrija o PATH ou use `dart pub global run mason_cli:mason` |
| Brick não encontrado | Rode `mason get` na pasta do `mason.yaml` correto |
| Feature na pasta errada | Use `-o lib/src/features` a partir da raiz do app |
| Arquivo já existe | Confira o diff; não sobrescreva trabalho em andamento |
| Caminho longo no Windows | Prefira clone e destino curtos, como `C:\dev\templates` |
| Mudança local não aparece | Confira se o brick aponta para `path` local ou Git |

Se caminhos longos ainda forem um problema, habilite `git config --global core.longpaths true`. Em máquina corporativa, peça à equipe responsável para verificar a política de caminhos longos do Windows.
