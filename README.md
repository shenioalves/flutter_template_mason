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

Adicione o brick globalmente (No Windows, execute como Administrador se encontrar erro de caminhos longos):
```bash
mason add -g clean_project --git-url "https://github.com/shenioalves/flutter_template_mason.git" --git-path clean_project
```

> **⚠️ Nota para usuários Windows:** Se você receber um erro `PathNotFoundException`, é provável que o limite de 260 caracteres do Windows esteja bloqueando a instalação. Execute o comando abaixo no PowerShell como Administrador para habilitar caminhos longos:
> ```powershell
> New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
> ```

Gere o projeto (rode isso na pasta onde deseja que a pasta do app seja criada):
```bash
mason make clean_project
```

## 📦 2. Criando Novas Features (No dia a dia)
O projeto gerado já vem com o arquivo `mason.yaml` pré-configurado. Basta entrar na pasta do projeto e executar:

Baixe a dependência do brick (necessário apenas na primeira vez):
```bash
mason get
```

Gere a nova feature (responda com o nome da feature quando solicitado):
```bash
mason make clean_feature
```
