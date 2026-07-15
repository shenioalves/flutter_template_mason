import 'package:dio/dio.dart';

import '../../storage/secure_storage/secure_storage.dart';

/// Adds the session token when the request does not provide Authorization.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._secureStorage);

  final SecureStorage _secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey('Authorization')) {
      handler.next(options);
      return;
    }

    final token = await _secureStorage.getSessionToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
