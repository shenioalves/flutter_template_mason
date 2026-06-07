/*
 * ARQUIVO: lib/src/core/platform/permissions/permissions_impl.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Consultar documentação
 */
import 'package:permission_handler/permission_handler.dart';
import 'package:{{project_name.snakeCase()}}/src/core/platform/permissions/permissions.dart';

class PermissionsImpl implements Permissions {
  @override
  Future<bool> requestStorage() async {
    if ((await Permission.storage.status).isGranted) return true;
    return (await Permission.storage.request()).isGranted;
  }
}
