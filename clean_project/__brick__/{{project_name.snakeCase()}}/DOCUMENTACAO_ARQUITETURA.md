# 🏛 Documentação de Arquitetura
Este projeto utiliza Clean Architecture com abordagem Feature-First.

## ⚙️ Como criar uma nova Feature
Não crie pastas manualmente. Utilize nosso gerador oficial (Mason).
1. Execute: `mason make clean_feature`
2. Digite o nome da feature.
3. Registre o novo módulo gerado dentro de `InjectionContainer.init()`.

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
