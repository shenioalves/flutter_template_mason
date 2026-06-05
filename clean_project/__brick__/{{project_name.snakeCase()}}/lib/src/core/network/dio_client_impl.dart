import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/src/core/network/http_client.dart';
import 'package:{{project_name.snakeCase()}}/src/core/network/http_client_exception.dart';
import 'package:{{project_name.snakeCase()}}/src/core/network/http_response.dart';

class DioClientImpl implements HttpClient {
  DioClientImpl(this._dio);

  final Dio _dio;

  @override
  Future<HttpResponse> get(String url, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return HttpResponse(data: response.data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      throw HttpClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<HttpResponse> post(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return HttpResponse(data: response.data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      throw HttpClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<HttpResponse> put(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return HttpResponse(data: response.data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      throw HttpClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<HttpResponse> patch(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return HttpResponse(data: response.data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      throw HttpClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<HttpResponse> delete(String url, {Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(url, options: Options(headers: headers));
      return HttpResponse(data: response.data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      throw HttpClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}
