import 'package:dio/dio.dart';

import 'api_client.dart';
import 'api_client_exception.dart';
import 'api_response.dart';

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
      throw _toApiClientException(e);
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
      throw _toApiClientException(e);
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
      throw _toApiClientException(e);
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
      throw _toApiClientException(e);
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
      throw _toApiClientException(e);
    }
  }

  @override
  Future<void> download(String url, String path) async {
    try {
      await _dio.download(url, path);
    } on DioException catch (e) {
      throw _toApiClientException(e);
    }
  }

  ApiClientException _toApiClientException(DioException exception) {
    final kind = switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => ApiClientErrorKind.timeout,
      DioExceptionType.connectionError => ApiClientErrorKind.noConnection,
      DioExceptionType.badResponse => ApiClientErrorKind.http,
      _ => ApiClientErrorKind.unexpected,
    };

    return ApiClientException(
      kind: kind,
      statusCode: exception.response?.statusCode,
      message: exception.message,
      responseData: exception.response?.data,
    );
  }
}
