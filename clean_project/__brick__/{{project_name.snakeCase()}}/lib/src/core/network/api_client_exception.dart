/// Categoria técnica preservada entre o cliente HTTP e o repositório.
///
/// A camada de dados converte esta categoria em failures de domínio. Ela não
/// deve vazar para Presentation.
enum ApiClientErrorKind { noConnection, timeout, http, unexpected }

/// Exceção independente do Dio para erros de infraestrutura HTTP.
class ApiClientException implements Exception {
  ApiClientException({
    this.statusCode,
    this.message,
    this.responseData,
    ApiClientErrorKind? kind,
  }) : kind = kind ??
            (statusCode == null
                ? ApiClientErrorKind.unexpected
                : ApiClientErrorKind.http);

  final int? statusCode;
  final String? message;
  final dynamic responseData;
  final ApiClientErrorKind kind;

  @override
  String toString() =>
      'ApiClientException(kind: $kind, statusCode: $statusCode, message: $message, responseData: $responseData)';
}
