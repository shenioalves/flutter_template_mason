class HttpClientException implements Exception {
  HttpClientException({
    this.statusCode,
    this.message,
  });

  final int? statusCode;
  final String? message;

  @override
  String toString() =>
      'HttpClientException(statusCode: $statusCode, message: $message)';
}
