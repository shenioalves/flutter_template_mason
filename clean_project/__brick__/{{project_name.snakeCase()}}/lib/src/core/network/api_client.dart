/*
 * ARQUIVO: lib/src/core/network/api_client.dart
 * RESPONSABILIDADE: Camada de rede e comunicação externa
 * COMO USAR: Interface para requisições HTTP.
 */
import 'package:{{project_name.snakeCase()}}/src/core/network/api_response.dart';

abstract class ApiClient {
  Future<ApiResponse> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> post(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> put(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> patch(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> delete(String url, {Map<String, dynamic>? headers});
  Future<void> download(String url, String path);
}
