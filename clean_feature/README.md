# Criar uma nova feature

Uma **feature** é uma funcionalidade, como produtos ou perfil. Este brick gera seus arquivos com um exemplo de consulta de um objeto `{ "id": "1", "name": "Exemplo" }`.

## 1. Abrir o terminal na pasta certa

Use a raiz do **app gerado**, onde ficam `pubspec.yaml`, `mason.yaml` e `lib`. Não execute dentro deste diretório do template. Instale o Mason conforme o [guia inicial](../README.md). O app já possui `mason.yaml`; não precisa de `mason init`.

## 2. Instalar e gerar

```sh
mason get
mason make clean_feature --feature_name products -o lib/src/features
```

Para testar alterações locais, configure o `path` conforme o [guia do projeto](../clean_project/README.md#4-preparar-o-gerador-de-features).

Nomes como `products` ou `user_profile` geram `ProductsCubit` ou `UserProfileCubit`. Não use o nome de uma feature existente para uma nova geração.

## 3. Conferir o resultado

```text
lib/src/features/products/
  products_module.dart
  domain/
    entities/products_entity.dart
    failures/products_failure.dart
    repositories/products_repository.dart
    usecases/get_products_usecase.dart
  data/
    models/products_model.dart
    datasources/products_datasource.dart
    datasources/products_remote_datasource_impl.dart
    repositories/products_repository_impl.dart
  presentation/
    cubit/products_cubit.dart
    cubit/products_state.dart
    views/products_view.dart
```

O nome `products` não transforma o resultado em lista. A estrutura consulta **um objeto**. Para uma lista, adapte todos os tipos do Model ao State e teste seu parsing.

## 4. Registrar o módulo

Em `lib/src/core/di/injection_container.dart`, adicione:

```dart
import '../../features/products/products_module.dart';
```

Acrescente à lista existente, preservando os outros módulos:

```dart
final routeService = RouteService([
  SplashModule(),
  ExampleModule(),
  ProductsModule(),
]);
```

O módulo registra DataSource, Repository, UseCase e Cubit, além da rota `/products`, com nome `products`. O Mason não altera a DI automaticamente.

## 5. Abrir a tela

Na View de origem, importe `package:go_router/go_router.dart` e `products_module.dart` pelo caminho relativo àquela View. Adicione um botão:

```dart
AppButton(
  label: 'Abrir produtos',
  onPressed: () => context.pushNamed(ProductsModule.routeName),
)
```

`pushNamed` permite voltar; `goNamed` muda a localização principal. A rota já está no módulo. Se for compartilhada por outras features, mova suas constantes para `AppRoutes` e atualize as referências, evitando strings duplicadas.

## 6. Implementar a funcionalidade real

Siga esta ordem e os `TODO`s dos arquivos:

1. **Contrato da API:** confirme endpoint, parâmetros, corpo, resposta e erros com o backend.
2. **Entity:** defina os dados de negócio.
3. **Failure:** defina falhas que exigem tratamentos diferentes.
4. **Repository e UseCase:** declare a ação e suas regras.
5. **Model:** interprete o JSON e converta com `toEntity()`.
6. **DataSource:** chame `ApiClient`. O endpoint gerado é ilustrativo.
7. **RepositoryImpl:** converta Models e traduza exceções em failures.
8. **Cubit e State:** represente carregamento, sucesso e erro. A consulta começa pelo botão; para carregamento automático, use `..fetchProducts()` ao criar o Cubit na rota.
9. **View e widgets:** monte a tela e trate efeitos com `BlocListener`.
10. **Testes:** cubra sucesso, falha e dados inválidos relevantes.

O README do app contém exemplos detalhados de integração, UseCase, componentes e imagens.

## 7. Validar

Na raiz do app:

```sh
dart format lib/src/features/products
flutter analyze
flutter test
```

Abra a rota e confira carregamento, resposta, erro e tentativa novamente. O brick não cria backend, credenciais, autenticação completa ou testes específicos de produtos.
