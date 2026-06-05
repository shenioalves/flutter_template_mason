/*
 * ARQUIVO: lib/src/core/modules/feature_module.dart
 * RESPONSABILIDADE: Definir o contrato obrigatório para cada feature do sistema.
 * PADRÃO: Interface Segregation. Cada módulo decide suas dependências e rotas.
 */

import 'package:go_router/go_router.dart';
import '../di/injector.dart';

abstract class FeatureModule {
  /// Registra as dependências exclusivas desta feature (Cubit, UseCase, Repo).
  void registerDependencies(Injector injector);

  /// Retorna a lista de rotas (GoRouter) desta feature.
  List<RouteBase> routes();
}
