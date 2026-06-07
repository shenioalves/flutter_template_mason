/*
 * ARQUIVO: lib/src/core/platform/di/platform_dependencies.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Agrupador de injeções por módulo/camada.
 */
import 'package:device_info_plus/device_info_plus.dart';

import '../../di/injector.dart';
import '../app_directories.dart';
import '../device_info/device_info.dart';
import '../device_info/device_info_impl.dart';
import '../permissions/permissions.dart';
import '../permissions/permissions_impl.dart';
import '../share/share.dart';
import '../share/share_impl.dart';
import '../url_launcher/url_launcher.dart';
import '../url_launcher/url_launcher_impl.dart';

void configurePlatformDependencies(Injector injector) {
  injector.registerLazySingleton<AppDirectories>(() => AppDirectories());

  injector.registerLazySingleton<DeviceInfo>(
    () => DeviceInfoImpl(DeviceInfoPlugin()),
  );

  injector.registerLazySingleton<Permissions>(() => PermissionsImpl());

  injector.registerLazySingleton<Share>(
    () => ShareImpl(injector.get<AppDirectories>()),
  );

  injector.registerLazySingleton<UrlLauncher>(() => UrlLauncherImpl());
}
