/*
 * ARQUIVO: lib/src/core/network/di/network_dependencies.dart
 * RESPONSABILIDADE: Camada de rede e comunicação externa
 * COMO USAR: Agrupador de injeções por módulo/camada.
 */
import 'package:dio/dio.dart';

import '../../di/injector.dart';
import '../../storage/secure_storage/secure_storage.dart';
import '../api_client.dart';
import '../dio_client_impl.dart';
import '../interceptors/auth_interceptor.dart';

void configureNetworkDependencies(Injector injector) {
  final dio = Dio(
    BaseOptions(
      baseUrl: const String.fromEnvironment('API_BASE_URL'),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  dio.interceptors.add(AuthInterceptor(injector.get<SecureStorage>()));

  injector.registerLazySingleton<ApiClient>(() => DioClientImpl(dio));
}

