/*
 * ARQUIVO: lib/src/core/network/dio_client_impl.dart
 * RESPONSABILIDADE: Camada de rede e comunicação externa
 * COMO USAR: Implementação do ApiClient usando a biblioteca Dio.
 */
import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/src/core/network/api_client.dart';
import 'package:{{project_name.snakeCase()}}/src/core/network/api_client_exception.dart';
import 'package:{{project_name.snakeCase()}}/src/core/network/api_response.dart';

class DioClientImpl implements ApiClient {
  DioClientImpl(this._dio);

  final Dio _dio;

  @override
  Future<ApiResponse> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return ApiResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      throw ApiClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<ApiResponse> post(
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
      return ApiResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      throw ApiClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<ApiResponse> put(
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
      return ApiResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      throw ApiClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<ApiResponse> patch(
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
      return ApiResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      throw ApiClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<ApiResponse> delete(
    String url, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        options: Options(headers: headers),
      );
      return ApiResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      throw ApiClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }

  @override
  Future<void> download(String url, String path) async {
    try {
      await _dio.download(url, path);
    } on DioException catch (e) {
      throw ApiClientException(
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}
