/*
 * ARQUIVO: lib/src/core/network/di/network_dependencies.dart
 * RESPONSABILIDADE: Camada de rede e comunicação externa
 * COMO USAR: Agrupador de injeções por módulo/camada.
 */
import 'package:dio/dio.dart';
import '../../di/injector.dart';
import '../api_client.dart';
import '../dio_client_impl.dart';

void configureNetworkDependencies(Injector injector) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Adicionar interceptores aqui se necessário
  // dio.interceptors.add(LogInterceptor());

  injector.registerLazySingleton<ApiClient>(() => DioClientImpl(dio));
}

