import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/src/core/logger/app_logger.dart';
import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/datasources/example_demo_datasource_impl.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/data/repositories/example_repository_impl.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/domain/usecases/get_example_usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/presentation/cubit/example_cubit.dart';
import 'package:{{project_name.snakeCase()}}/src/features/example/presentation/views/example_view.dart';

class MockLogger extends Mock implements AppLogger {}

void main() {
  testWidgets('carrega dados da demonstração ao tocar no botão', (
    tester,
  ) async {
    final logger = MockLogger();
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.getTheme(),
        home: BlocProvider(
          create: (_) => ExampleCubit(
            getExampleUseCase: GetExampleUseCase(
              ExampleRepositoryImpl(ExampleDemoDataSourceImpl(), logger),
            ),
            logger: logger,
          ),
          child: const ExampleView(),
        ),
      ),
    );
    expect(find.text('Carregar exemplo'), findsOneWidget);
    await tester.tap(find.text('Carregar exemplo'));
    await tester.pumpAndSettle();
    expect(find.text('1 - Meu primeiro exemplo'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
