/*
 * ARQUIVO: lib/src/core/ui/widgets/views/app_template_view.dart
 * RESPONSABILIDADE: Template base para as telas da aplicação, gerenciando o Scaffold e transições de estado.
 * COMO USAR: Retornar este widget no método build da View, mapeando os estados do Cubit para ViewState.
 */

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:flutter/material.dart';

import 'error_connection_view.dart';
import 'error_server_view.dart';
import 'error_token_view.dart';

class AppTemplateView extends StatelessWidget {
  final ViewState state;
  final Widget pageSuccess;
  final Widget? pageLoading;
  final Widget? pageInitial;
  final Widget? pageEmpty;
  final VoidCallback refreshPageError;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;
  final Widget? drawer;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry? padding;
  final bool extendBody;
  final bool showBottomNavigationBar;

  const AppTemplateView({
    super.key,
    required this.state,
    required this.pageSuccess,
    this.pageLoading,
    this.pageInitial,
    this.pageEmpty,
    this.appBar,
    this.backgroundColor,
    this.backgroundGradient,
    this.drawer,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.padding,
    required this.refreshPageError,
    this.extendBody = false,
    this.showBottomNavigationBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBody: extendBody,
      backgroundColor: backgroundGradient != null
          ? Colors.transparent
          : backgroundColor,
      drawer: drawer,
      floatingActionButton: state == ViewState.success
          ? floatingActionButton
          : null,
      bottomNavigationBar:
          showBottomNavigationBar ||
              (state == ViewState.success && bottomNavigationBar != null)
          ? bottomNavigationBar
          : null,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: SafeArea(
            top: safeAreaTop,
            bottom: safeAreaBottom,
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
              child: switch (state) {
                ViewState.success => pageSuccess,
                ViewState.loading => pageLoading ?? const AppLoading(),
                ViewState.initial => pageInitial ?? const SizedBox.shrink(),
                ViewState.empty => pageEmpty ?? const SizedBox.shrink(),
                ViewState.errorServer => ErrorServerView(
                  onRefreshError: refreshPageError,
                ),
                ViewState.errorConnection => ErrorConnectionView(
                  onRefreshError: refreshPageError,
                ),
                ViewState.errorToken => const ErrorTokenView(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
