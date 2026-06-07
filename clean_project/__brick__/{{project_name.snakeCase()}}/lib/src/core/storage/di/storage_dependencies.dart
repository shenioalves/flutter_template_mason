/*
 * ARQUIVO: lib/src/core/storage/di/storage_dependencies.dart
 * RESPONSABILIDADE: Persistência de dados local
 * COMO USAR: Agrupador de injeções por módulo/camada.
 */
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/injector.dart';
import '../local_storage/local_storage.dart';
import '../local_storage/local_storage_impl.dart';
import '../secure_storage/secure_storage.dart';
import '../secure_storage/secure_storage_impl.dart';

Future<void> configureStorageDependencies(Injector injector) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  injector.registerSingleton<LocalStorage>(LocalStorageImpl(sharedPreferences));

  injector.registerLazySingleton<SecureStorage>(
    () => SecureStorageImpl(const FlutterSecureStorage()),
  );
}
