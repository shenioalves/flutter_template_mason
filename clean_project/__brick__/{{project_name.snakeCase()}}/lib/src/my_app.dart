/*
 * ARQUIVO: lib/src/my_app.dart
 * RESPONSABILIDADE: Widget principal da aplicação.
 * COMO USAR: Widget raiz da aplicação, configura MaterialApp e serviços globais.
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart';
import 'core/di/injector.dart';
import 'core/routes/route_service.dart';
import 'core/ui/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routeService = InjectionContainer.injector.get<RouteService>();

    return RepositoryProvider<Injector>.value(
      value: InjectionContainer.injector,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Clean Architecture',
        theme: AppTheme.getTheme(),
        routerConfig: routeService.router,
      ),
    );
  }
}
