# Coordenação multi-agent

O agente principal atua como `orchestrator`. Ele escolhe o menor conjunto de
perfis necessário, divide os arquivos e consolida o resultado.

## Perfis

| Perfil | Responsabilidade | Escrita |
| --- | --- | --- |
| `orchestrator` | Coordenação, integração e decisão de escopo | Sim |
| `architecture` | Impacto entre camadas e dependências | Não |
| `domain` | Entities, failures, repositories e use cases | Sim |
| `data` | Models, DataSources, repositories e storage | Sim |
| `api` | Contratos HTTP, payloads e respostas | Não |
| `presentation` | Cubits, states, views e widgets | Sim |
| `test` | Testes e fixtures | Sim, somente em `test/` |
| `review` | Revisão do diff e riscos | Não |

## Regras de divisão

- Um arquivo possui um único responsável por vez.
- `architecture`, `api` e `review` não editam código.
- `domain` não edita Data, Presentation, core ou testes.
- `data` não edita Domain, Presentation ou testes.
- `presentation` não edita Domain, Data ou testes.
- `test` não altera código de produção.
- O coordenador mantém para si a integração de módulos, DI e rotas, ou atribui
  esses arquivos explicitamente.
- Agentes não criam outros agentes.
- Todos leem `.agents/AGENTS.md` e este protocolo.

## Contrato de tarefa

```text
Papel e objetivo:
Escopo e critérios de aceitação:
Arquivos que pode editar:
Arquivos reservados:
Contratos disponíveis:
Verificações esperadas:
Entrega: arquivos, evidências, pendências e riscos.
```

## Fluxos sugeridos

| Tipo de tarefa | Perfis |
| --- | --- |
| Bug visual | `presentation` → `test` → `review` |
| Problema de API | `api` → `data` → `test` → `review` |
| Regra de negócio | `domain` → `test` → `review` |
| Feature grande | `architecture` → `domain`/`api` → `data` → `presentation` → `test` → `review` |
| Revisão sem implementação | `architecture` e/ou `review` |

Os fluxos são sugestões. Tarefas pequenas podem ser executadas diretamente pelo
agente principal. Não delegue trabalho sem critério de aceitação observável.

## Verificação final

Depois que os escritores terminarem, revise o diff consolidado e execute:

```powershell
dart format <arquivos alterados>
flutter analyze
flutter test
```

Não declare uma verificação que não foi executada. Registre falhas de ambiente e
lacunas de plataforma separadamente das falhas do código.
