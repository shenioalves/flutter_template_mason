# Regras da arquitetura

O [README](README.md) é o guia prático. Este arquivo resume as regras para revisão.

- Organize funcionalidades em `features/<nome>` com Domain, Data e Presentation.
- Domain contém Entity, Failure, contrato de Repository e UseCase. Não importa Flutter, Dio, Data ou Presentation.
- Model interpreta JSON e converte com `toEntity()`. Não herda Entity.
- DataSource conhece endpoint e payload. RepositoryImpl converte Model e traduz exceções para `Result<FailureType, Entity>`.
- Cubit recebe UseCases pelo construtor e emite estados imutáveis. Não recebe BuildContext, não navega e não chama DataSource.
- Views desenham estado com BlocBuilder e tratam efeitos com BlocListener.
- Componentes compartilhados recebem dados e callbacks. Regras de uma feature ficam nela.
- Módulos registram dependências e rotas. InjectionContainer ativa os módulos.
- Use Injector; GetIt é detalhe interno. Cubits de tela são factories.
- ApiClient abstrai Dio; erros técnicos não são exibidos diretamente ao usuário.
- Tokens de sessão e redefinição possuem chaves e ciclos de vida diferentes.
- `.env` guarda configuração pública, não segredos. Compras são descritas em `docs/ASSINATURAS.md`.
- Use AppWidgets, tema e AppAssets. Declare os arquivos reais no pubspec.
- Testes espelham camadas e substituem rede/plugins por mocks ou fakes.

Fluxo: `View → Cubit → UseCase → Repository → RepositoryImpl → DataSource`.

Para criar uma feature, execute na raiz do app:

```sh
mason get
mason make clean_feature --feature_name products -o lib/src/features
```

Registre o módulo e siga o tutorial do README. Pesquise os comentários `TODO` antes de entregar.
