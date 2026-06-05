# 🏛 Documentação de Arquitetura
Este projeto utiliza Clean Architecture com abordagem Feature-First.

## ⚙️ Como criar uma nova Feature
Não crie pastas manualmente. Utilize nosso gerador oficial (Mason).
Este projeto já vem pré-configurado com os templates necessários.

1. Se for a primeira vez no projeto, execute: `mason get`
2. Para criar a feature, execute: `mason make clean_feature`
3. Digite o nome da feature quando solicitado.
4. Registre o novo módulo gerado dentro de `InjectionContainer.init()`.

> 💡 **Dica (Windows):** Se encontrar erro de "PathNotFoundException", execute `git config --global core.longpaths true` e habilite caminhos longos no Windows (Registry).

## 📂 Estrutura de uma Feature (Fluxo em "U")
### 1. Domain (Coração)
* **Entities:** Objetos de negócio puros (sem `.fromJson`).
* **Repositories:** Interfaces (contratos).
* **UseCases:** Regras de negócio de responsabilidade única (método `call`).

### 2. Data (Infraestrutura)
* **Models:** Estendem as Entities e lidam com JSON/APIs.
* **DataSources:** Interfaces e implementações para chamadas externas.
* **RepositoryImpl:** Implementa o contrato do Domain.

### 3. Presentation (Interface)
* **View:** Interface visual passiva.
* **Cubit/State:** Gerencia os estados da View e coordena UseCases.

## 🛑 Regras de Ouro
* NUNCA importe arquivos da camada Data dentro de Domain ou Presentation.
* Solicite dependências via construtor e injete pelo Injector.
