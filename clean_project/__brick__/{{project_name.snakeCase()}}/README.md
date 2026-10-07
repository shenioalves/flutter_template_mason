# {{project_name.titleCase()}}

Projeto Flutter organizado por features, Clean Architecture, Cubit, `go_router`,
`Dio`, injeção de dependências e componentes compartilhados.

## Começar

```powershell
Copy-Item .env.example .env
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run -d ID_DO_DISPOSITIVO
```

Se o projeto acabou de ser gerado pelo Mason, complete os arquivos de
plataforma uma vez:

```bash
flutter create --platforms=android,ios --org {{org_name}} .
```

O exemplo inicial funciona sem backend. A splash abre a tela de exemplo, que
carrega dados locais ao tocar em **Carregar exemplo**.

## Estrutura

```text
lib/src/
├── core/
│   ├── di/          dependências
│   ├── network/     ApiClient, Dio e erros HTTP
│   ├── platform/    serviços do dispositivo
│   ├── routes/      rotas
│   ├── storage/     dados locais e credenciais
│   ├── ui/          tema, assets e componentes
│   └── utils/       Result, validações e extensões
└── features/
    └── <feature>/
        ├── data/
        ├── domain/
        └── presentation/
```

Fluxo principal:

```text
View → Cubit → UseCase → Repository → DataSource → ApiClient → Dio
```

Domain contém regras de negócio e contratos. Data contém Models, DataSources e
implementações. Presentation contém Cubits, estados, Views e widgets.

## Criar uma feature

Na raiz do projeto:

```bash
mason get
mason make clean_feature --feature_name products -o lib/src/features
```

Depois:

1. Ajuste Entity, Failure, Repository e UseCase.
2. Adapte o Model ao JSON real.
3. Implemente DataSource e RepositoryImpl.
4. Ajuste Cubit, states, View e widgets.
5. Registre o módulo em `lib/src/core/di/injection_container.dart`.
6. Registre ou ajuste a rota.
7. Crie os testes.

O `-o lib/src/features` evita criar a feature na raiz do projeto. O gerador
produz um exemplo de consulta; endpoint, payload e regras devem ser ajustados
ao produto.

## Injeção de dependências

Use `Injector` nos módulos. GetIt fica somente na implementação do Injector.

- `registerLazySingleton`: serviços, DataSources, Repositories e UseCases sem estado.
- `registerFactory`: Cubits criados por tela.
- `registerSingleton`: instâncias únicas já prontas.

As dependências entram pelo construtor. Não acesse GetIt diretamente em Views,
Cubits ou Domain.

## API

Configure `.env`:

```env
API_URL=https://api.exemplo.com
```

O Android Emulator acessa uma API local pelo endereço `http://10.0.2.2:8080`.
No iOS Simulator use `http://127.0.0.1:8080`. Em aparelho físico, use o IP da
máquina na rede local.

Chamadas ficam em DataSources e usam `ApiClient`. Repositories convertem erros
técnicos em failures da feature. Views não chamam Dio diretamente.

Para testar o exemplo com uma API, troque `ExampleDemoDataSourceImpl` pela
implementação remota no `ExampleModule` e ajuste o endpoint no DataSource.

## Criar um UseCase

Um UseCase representa uma ação de negócio e recebe o Repository por contrato:

```dart
class GetProductUseCase {
  const GetProductUseCase(this._repository);

  final ProductRepository _repository;

  Future<Result<ProductFailure, ProductEntity>> call() {
    return _repository.getProduct();
  }
}
```

Validações de negócio ficam no UseCase ou no Domain. Validações puramente
visuais ficam na View.

## Componentes

Componentes compartilhados ficam em `core/ui/widgets`. Componentes específicos
ficam em `features/<feature>/presentation/widgets`.

Componentes recebem dados e callbacks. Eles não acessam API, Repository,
DataSource, rotas globais ou Injector.

Reutilize:

```text
AppText
AppButton
AppCard
AppLoading
AppDialog
AppSnackbar
AppTextFormField
AppTemplateView
```

Exporte novos componentes em `lib/src/core/ui/ui.dart`.

## Assets

Arquivos ficam em `assets/images`, `assets/icons` ou outra pasta declarada no
`pubspec.yaml`.

Adicione o caminho ao enum `AppAssets`:

```dart
logo('assets/images/logo.png'),
```

Use o componente correto:

```dart
AppAsset.image(assetPath: AppAssets.logo)
AppAsset.svg(assetPath: AppAssets.logo)
AppAsset.network(networkUrl: imageUrl)
```

Depois de alterar o manifesto de assets, execute `flutter pub get`.

## Estado com Cubit

Cubits representam operações que possuem loading, sucesso, vazio ou erro.

- `BlocBuilder` constrói a interface.
- `BlocListener` executa navegação, snackbar ou diálogo.
- `ValueNotifier` atende estados visuais locais.
- Controllers, FocusNodes e ValueNotifiers são descartados em `dispose()`.

Cubits não recebem `BuildContext`, não navegam e não chamam DataSources.

## Storage

- `SecureStorage`: tokens e dados sensíveis.
- `LocalStorage`: preferências não sensíveis.
- Chaves ficam nos enums dos respectivos diretórios.
- `.env` não é local para senhas ou chaves privadas.

## Testes

Espelhe a estrutura de `lib` em `test/src/features`.

- Model: parsing válido, nulo e inválido.
- Repository: DataSource e storage mockados.
- UseCase: Repository mockado.
- Cubit: `blocTest`.
- Widget: interação e comportamento visível.
- Integração: somente fluxos completos que justifiquem o custo.

```bash
dart format lib test
flutter analyze
flutter test
```

## Assinaturas e publicação

Veja `docs/ASSINATURAS.md` para IDs de produtos, verificação e backend. Veja
`docs/PERSONALIZACAO.md` para nome, tema, assets, assinatura Android e
configuração iOS.

Não versionar `.env`, keystores, senhas, certificados ou chaves privadas.

## Multi-agent

O projeto inclui perfis de trabalho em `.agents/` para dividir tarefas com
segurança:

| Perfil | Responsabilidade |
| --- | --- |
| `orchestrator` | Coordenação e integração |
| `architecture` | Impacto entre camadas |
| `api` | Contratos HTTP |
| `domain` | Regras de negócio |
| `data` | Models, DataSources e Repositories |
| `presentation` | Cubits, Views e widgets |
| `test` | Testes |
| `review` | Revisão final |

Leia `.agents/MULTI_AGENT.md` antes de delegar. Um arquivo deve ter somente um
responsável por vez. O agente principal mantém a integração de DI, módulos e
rotas quando esses arquivos não forem atribuídos explicitamente.

## Verificação final

Antes de entregar uma feature:

- a rota está registrada;
- o módulo está ativo;
- loading, sucesso, vazio e erro foram considerados;
- não há segredo no Git;
- os testes relevantes passam;
- `flutter analyze` não apresenta problemas.
