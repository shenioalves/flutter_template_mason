import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart';
import 'core/di/injector.dart';
import 'core/routes/route_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routeService = InjectionContainer.injector.get<RouteService>();

    return RepositoryProvider<Injector>.value(
      value: InjectionContainer.injector,
      child: MaterialApp.router(
        title: 'Flutter Clean Architecture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: routeService.router,
      ),
    );
  }
}
