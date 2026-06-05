# 🧱 Flutter Template Mason
Repositório central de templates (Bricks) para padronização de arquitetura em projetos Flutter.

## O que é o Mason?
O [Mason](https://pub.dev/packages/mason_cli) é um gerador de código que permite criar arquivos e estruturas de pastas a partir de templates (bricks) pré-definidos, garantindo consistência e produtividade na equipe.

## 🚀 Como começar (Instalação)
Instale o Mason globalmente na sua máquina:
```bash
dart pub global activate mason_cli
```

## 📦 1. Criando um Novo Projeto do Zero
Como você ainda não tem um projeto, precisaremos adicionar o brick de projeto globalmente ou rodá-lo direto do GitHub.

Adicione o brick globalmente:
```bash
mason add -g clean_project --git https://github.com/shenioalves/flutter_template_mason --path clean_project
```

Gere o projeto (rode isso na pasta onde deseja que a pasta do app seja criada):
```bash
mason make clean_project
```

## 📦 2. Criando Novas Features (No dia a dia)
Após o projeto ter sido criado, entre na pasta dele. Para simplificar a criação de features no dia a dia, declare o brick de features no arquivo `mason.yaml` do seu projeto:

```yaml
bricks:
  clean_feature:
    git:
      url: https://github.com/shenioalves/flutter_template_mason
      path: clean_feature
```

Baixe a dependência do brick:
```bash
mason get
```

Gere a nova feature (responda com o nome da feature quando solicitado):
```bash
mason make clean_feature
```
