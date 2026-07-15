import 'api_response.dart';

/// Contrato abstrato para o cliente HTTP do aplicativo.
///
/// Desacopla toda a base de código da implementação concreta (Dio),
/// permitindo substituição em testes ou mudança de biblioteca sem impacto.
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
