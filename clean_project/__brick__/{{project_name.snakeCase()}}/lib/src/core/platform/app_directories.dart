/*
 * ARQUIVO: lib/src/core/platform/app_directories.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Gerenciamento de caminhos de diretórios do sistema.
 */
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class AppDirectories {
  Future<Directory> getDocumentsDir() => getApplicationDocumentsDirectory();

  Future<Directory> getCacheDir() => getApplicationCacheDirectory();

  Future<Directory> getTempDir() => getTemporaryDirectory();

  Future<Directory> getSupportDir() => getApplicationSupportDirectory();
}
