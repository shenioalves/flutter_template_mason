# Guia de desenvolvimento

Este projeto usa Flutter, Clean Architecture, organização por features, Cubit,
go_router, Injector, Dio, storage separado por finalidade e `Result` para erros
esperados.

Antes de alterar uma feature:

1. Leia o README e `DOCUMENTACAO_ARQUITETURA.md`.
2. Leia os arquivos vizinhos e preserve os contratos existentes.
3. Defina os arquivos que serão alterados antes de começar.
4. Execute formatter, análise e testes ao terminar.

Regras principais:

- Domain não importa Data, Presentation, Flutter ou plugins.
- Views não chamam API, DataSource ou RepositoryImpl.
- Cubits recebem dependências pelo construtor e não recebem `BuildContext`.
- GetIt só aparece na implementação do Injector.
- Não versionar `.env`, tokens, senhas ou chaves privadas.
- Não misturar mudanças de arquitetura com uma feature sem decisão explícita.
