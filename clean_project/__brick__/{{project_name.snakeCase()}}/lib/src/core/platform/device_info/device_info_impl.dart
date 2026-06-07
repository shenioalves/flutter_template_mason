/*
 * ARQUIVO: lib/src/core/platform/device_info/device_info_impl.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Consultar documentação
 */
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:{{project_name.snakeCase()}}/src/core/platform/device_info/device_info.dart';

class DeviceInfoImpl implements DeviceInfo {
  DeviceInfoImpl(this._plugin);

  final DeviceInfoPlugin _plugin;

  @override
  Future<bool> checkLocaleSupport() async {
    if (Platform.isIOS) return true;
    final info = await _plugin.androidInfo;
    return info.version.sdkInt >= 33;
  }

  @override
  Future<int> getAndroidSdkInt() async {
    final info = await _plugin.androidInfo;
    return info.version.sdkInt;
  }
}
