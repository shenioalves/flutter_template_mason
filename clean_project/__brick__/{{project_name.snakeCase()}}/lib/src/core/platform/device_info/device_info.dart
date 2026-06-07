/*
 * ARQUIVO: lib/src/core/platform/device_info/device_info.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Consultar documentação
 */
abstract class DeviceInfo {
  Future<bool> checkLocaleSupport();
  Future<int> getAndroidSdkInt();
}
