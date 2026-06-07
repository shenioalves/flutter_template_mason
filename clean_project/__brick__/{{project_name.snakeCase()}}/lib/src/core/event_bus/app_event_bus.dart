/*
 * ARQUIVO: lib/src/core/event_bus/app_event_bus.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Comunicação desacoplada entre módulos via eventos.
 */
import 'dart:async';

import 'package:event_bus/event_bus.dart';

class AppEventBus {
  final eventBus = EventBus();

  StreamSubscription<T> listen<T>(void Function(T)? onData) =>
      eventBus.on<T>().listen(onData);

  void fire(dynamic event) => eventBus.fire(event);
}
