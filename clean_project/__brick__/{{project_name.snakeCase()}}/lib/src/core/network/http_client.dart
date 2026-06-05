import 'package:{{project_name.snakeCase()}}/src/core/network/http_response.dart';

abstract class HttpClient {
  Future<HttpResponse> get(String url, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});

  Future<HttpResponse> post(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse> put(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse> patch(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse> delete(String url, {Map<String, dynamic>? headers});
}
