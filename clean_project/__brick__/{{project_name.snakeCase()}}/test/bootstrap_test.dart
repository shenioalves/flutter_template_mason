import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{project_name.snakeCase()}}/src/core/di/injection_container.dart';
import 'package:{{project_name.snakeCase()}}/src/core/routes/route_service.dart';
import 'package:{{project_name.snakeCase()}}/src/my_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await dotenv.load(fileName: '.env');
    await InjectionContainer.init();
  });

  tearDownAll(() {
    InjectionContainer.injector.get<RouteService>().router.dispose();
  });

  testWidgets('inicia módulos e navega da splash para o exemplo', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.text('Carregar exemplo'), findsOneWidget);
    await tester.tap(find.text('Carregar exemplo'));
    await tester.pumpAndSettle();
    expect(find.text('1 - Meu primeiro exemplo'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });
}
